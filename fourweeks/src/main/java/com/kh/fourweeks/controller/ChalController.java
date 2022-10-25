package com.kh.fourweeks.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
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
import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.entity.ParticipantDto;
import com.kh.fourweeks.entity.UserConfirmLikeDto;
import com.kh.fourweeks.error.TargetNotFoundException;
import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.repository.ChalUserDao;
import com.kh.fourweeks.repository.UserConfirmLikeDao;
import com.kh.fourweeks.service.AttachmentService;
import com.kh.fourweeks.service.ChalService;
import com.kh.fourweeks.vo.ChalListSearchRecruitedVO;
import com.kh.fourweeks.vo.ChalListSearchVO;
import com.kh.fourweeks.vo.ChalListVO;

@Controller
@RequestMapping("/chal")
public class ChalController {
	@Autowired
	private ChalDao chalDao;
	
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
		String userId = (String)session.getAttribute(SessionConstant.ID);
		chalDto.setUserId(userId);
		
		//chalService에서 번호 미리 생성 후 등록, 첨부파일 업로드(저장)까지 처리
		int chalNo = chalService.create(chalDto, attachment);
		
		//참가자에 개설자 자동 추가
		partDto.setChalNo(chalNo);
		partDto.setUserId(userId);
		chalDao.addParticipant(partDto);
		//redirect
		attr.addAttribute("chalNo", chalNo);
		return "redirect:detail";
	}
	
	
	@GetMapping("detail/download")//챌린지 상세 이미지 조회
	@ResponseBody
	public ResponseEntity<ByteArrayResource> detailDownload(
			@ModelAttribute ChalDto chalDto
		) throws IOException {
		//인증글 번호로 첨부파일 번호 찾기
		int attachmentNo = attachmentDao.selectChalImg(chalDto.getChalNo());
		//attachService에서 첨부파일 번호로 파일정보 조회해서 전송  
		return attachService.load(attachmentNo);
	}
	
	// 모집중인 화면 맵핑
	@GetMapping("/list")
	public String list(
				Model model,
				@ModelAttribute(name="voRecruited") ChalListSearchRecruitedVO voRecruited,
				@ModelAttribute(name="vo") ChalListSearchVO vo) {
		// 페이지수 구하기
		int count = chalDao.count(vo); 
		vo.setCount(count);
		
		int countRecruited = chalDao.countRecruited(voRecruited);
		voRecruited.setCount(countRecruited);
		
		// 첨부파일 출력
		model.addAttribute("list", attachmentDao.selectList());
		// 모집중인 챌린지 화면에 해당하는 모델 첨부
		model.addAttribute("list", chalDao.selectList(vo));
		// 전체 챌린지 화면에 해당하는 모델 첨부
		model.addAttribute("recruitedList", chalDao.selectListRecruited(voRecruited));
		return "chal/list";
	}
	
	//상세 조회(단일)
	@GetMapping("/detail")
	public String detail(@ModelAttribute ChalDto chalDto,
			@ModelAttribute AttachmentDto attachmentDto,
			Model model,
			HttpSession session
			) {
		//챌린지 상세 조회
		model.addAttribute("chalDto", chalDao.selectOne(chalDto.getChalNo()));
		//종료일 조회
		model.addAttribute("chalVO", chalDao.selectEndDday(chalDto.getChalNo()));
		//첨부파일
		model.addAttribute("attachmentList", 
				attachmentDao.selectDetail(attachmentDto.getAttachmentNo()));
		//참가여부 
		model.addAttribute("participantDto", chalDao.selectParticipantOne(chalDto.getChalNo(),
				(String)session.getAttribute(SessionConstant.ID)));
		return "chal/detail";
	}
	@GetMapping("/mychal")
	public String myChal(//챌린지 상세 
			@ModelAttribute ChalMyDetailDto chalMyDetailDto,
			HttpSession session,
			Model model) {
		//챌린지 상세 조회
		model.addAttribute("chalDto" , chalDao.selectMy((String)session.getAttribute(SessionConstant.ID),
				chalMyDetailDto.getChalNo()));
		//종료일 조회
		model.addAttribute("chalVO", chalDao.selectEndDday(chalMyDetailDto.getChalNo()));
		
		return "chal/my_chal";
		
	}
	
	@GetMapping("/allchal")
	public String allchal(//챌린지 상세 (참가중인 모든 유저)
			@ModelAttribute ChalMyDetailDto chalMyDetailDto,
			HttpSession session,
			Model model) {
		//모든 유저 조회
		model.addAttribute("dto", chalDao.selectAllDetail(chalMyDetailDto.getChalNo()));
		//챌린지 종료일 조회
		model.addAttribute("chalVO", chalDao.selectEndDday(chalMyDetailDto.getChalNo()));
		//챌린지 단일조회
		model.addAttribute("chalDto" , chalDao.selectMy((String)session.getAttribute(SessionConstant.ID),
				chalMyDetailDto.getChalNo()));
		System.out.println(model);
		return "chal/all_chal";
		
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "chal/insert";
	}
	
	@PostMapping("/insert")
	public String insert(// 참가자 참가
			@ModelAttribute ParticipantDto participantDto,
			HttpSession session,
			RedirectAttributes attr
			) {
		attr.addAttribute("chalNo", participantDto.getChalNo());
		String userId=(String)session.getAttribute(SessionConstant.ID);
		participantDto.setUserId(userId);
		chalDao.insertParticipant(participantDto);
		//참가자 증가 메소드
		chalDao.updateChalPerson(participantDto.getChalNo());
		//
		return "redirect:detail?chalNo="+participantDto.getChalNo();
	}
	
}
