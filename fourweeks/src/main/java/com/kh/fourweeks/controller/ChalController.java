package com.kh.fourweeks.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.AttachmentDto;
import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ParticipantDto;
import com.kh.fourweeks.error.TargetNotFoundException;
import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.service.AttachmentService;
import com.kh.fourweeks.service.ChalService;
import com.kh.fourweeks.vo.ChalListSearchVO;

@Controller
@RequestMapping("/chal")
public class ChalController {
	@Autowired
	private ChalDao chalDao;
	
	@Autowired
	private ChalConfirmDao confirmDao;
	
	@Autowired
	private ChalService chalService;
	
	@Autowired
	private AttachmentService attachService;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	private final File dir = new File(System.getProperty("user.home") + "/upload");


	@PostConstruct //최초 실행 시 딱 한번만 실행되는 메소드
	public void prepare() {
		dir.mkdirs();
		System.out.println("created");
	}
	
	@GetMapping("/create")
	public String create() {
		return "chal/create";
	}
	
	@PostMapping("/create")
	private String create(@ModelAttribute ChalDto chalDto,
			@ModelAttribute ParticipantDto partDto,
			@RequestParam List<MultipartFile> attachment,
			RedirectAttributes attr,
			HttpSession session) throws IllegalStateException, IOException {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		chalDto.setUserId(memberId);
		
		//chalService에서 번호 미리 생성 후 등록, 첨부파일 업로드(저장)까지 처리
		int chalNo = chalService.create(chalDto, attachment);
		
		//참가자에 개설자 자동 추가
		partDto.setChalNo(chalNo);
		partDto.setUserId(memberId);
		chalDao.addParticipant(partDto);
		System.out.println(dir);
		//redirect
		attr.addAttribute("chalNo", chalNo);
		return "redirect:detail";
	}
	
	//상세 조회(단일)
	@GetMapping("/detail")
	public String detail(@ModelAttribute ChalDto chalDto,
			@ModelAttribute AttachmentDto attachmentDto,
			Model model) {
		model.addAttribute("chalDto", chalDao.selectOne(chalDto.getChalNo()));
		model.addAttribute("chalVO", chalDao.selectEndDday(chalDto.getChalNo()));
		
		//첨부파일
		model.addAttribute("attachmentList", 
				attachmentDao.selectDetail(attachmentDto.getAttachmentNo()));
		return "chal/detail";
	}
	
	@GetMapping("detail/download")//챌린지 상세 이미지 조회
	@ResponseBody
	public ResponseEntity<ByteArrayResource> detailDownload(
			@ModelAttribute ChalDto chalDto
		) throws IOException {
		AttachmentDto dto = attachmentDao.selectDetail(chalDto.getChalNo());
		if(dto == null) {//파일이 없으면
			throw new TargetNotFoundException("존재하지 않는 파일입니다");
		}
		
		//[2] 파일 불러오기
		File target = new File(dir, String.valueOf(dto.getAttachmentNo()));
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		//[3] 응답 객체를 만들어 데이터를 전송
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_ENCODING, 
										StandardCharsets.UTF_8.name())
				.contentLength(dto.getAttachmentSize())
				.header(HttpHeaders.CONTENT_TYPE , 
										dto.getAttachmentType())
				.header(HttpHeaders.CONTENT_DISPOSITION, 
									ContentDisposition.attachment()
											.filename(
													dto.getAttachmentName(), 
													StandardCharsets.UTF_8)
											.build().toString())
				.body(resource);
	}
	
	@GetMapping("/confirm")
	public String confirm(Model model,
			HttpSession session) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("chalList", confirmDao.selectList(memberId));
		return "chal/confirm";
	}
	
	@PostMapping("/confirm")
	public String confirm(@ModelAttribute ChalConfirmDto confirmDto,
			@RequestParam List<MultipartFile> attachment,
			RedirectAttributes attr,
			HttpSession session) throws IllegalStateException, IOException {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		confirmDto.setUserId(memberId);
		
		//chalService에서 번호 미리 생성 후 등록, 첨부파일 업로드(저장)까지 처리
		int confirmNo = chalService.confirm(confirmDto, attachment);
		
		attr.addAttribute("confirmNo", confirmNo);
		return "redirect:/chal/confirm/detail";
	}
	
	@GetMapping("/confirm/detail")
	public String confirmDetail(Model model,
			@RequestParam int confirmNo,
			HttpSession session) {
		model.addAttribute("confirmDto", confirmDao.selectOne(confirmNo));
		return "chal/confirm_detail";
	}
	
	@GetMapping("confirm/detail/download") //인증글 이미지 조회
	@ResponseBody
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam int confirmNo) throws IOException {
		//인증글 번호로 첨부파일 번호 찾기
		int attachmentNo = attachmentDao.selectConfirmImg(confirmNo);
		//attachService에서 첨부파일 번호로 파일정보 조회해서 전송  
		return attachService.load(attachmentNo);
	}

	@GetMapping("/confirm/mylist") //챌린지별 내 인증글 목록 조회
	public String myConfirmList(@ModelAttribute ChalDto chalDto,
			Model model,
			HttpSession session) {
		//챌린지 정보 조회
		model.addAttribute("chalDto", chalDao.selectOne(chalDto.getChalNo()));
		model.addAttribute("chalVO", chalDao.selectEndDday(chalDto.getChalNo()));
		
		//내 인증글 목록 조회
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("confirmList", confirmDao.myConfirmList(memberId, chalDto.getChalNo()));
		model.addAttribute("listCnt", confirmDao.confirmCnt(memberId, chalDto.getChalNo()));
		return "chal/confirm_mylist";
	}
	

	@GetMapping("/list")
	public String list(
				Model model,
				@ModelAttribute(name="vo") ChalListSearchVO vo) {

		int count = chalDao.count(vo);
		vo.setCount(count);
		model.addAttribute("list", chalDao.selectList(vo));
		return "chal/list";
	}
	
	
}
