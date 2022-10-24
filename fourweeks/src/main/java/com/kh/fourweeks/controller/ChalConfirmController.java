package com.kh.fourweeks.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.entity.UserConfirmLikeDto;
import com.kh.fourweeks.error.TargetNotFoundException;
import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.repository.UserConfirmLikeDao;
import com.kh.fourweeks.service.AttachmentService;
import com.kh.fourweeks.service.ChalService;

@Controller
@RequestMapping("/confirm")
public class ChalConfirmController {
	@Autowired
	private ChalConfirmDao confirmDao;
	
	@Autowired
	private ChalDao chalDao;
	
	@Autowired
	private UserConfirmLikeDao confirmLikeDao;
	
	@Autowired
	private ChalService chalService;
	
	@Autowired
	private AttachmentService attachService;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@GetMapping("/write") //인증글 등록
	public String confirm(Model model,
			HttpSession session) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("chalList", confirmDao.selectList(userId));
		return "chal/confirm_write";
	}
	
	@PostMapping("/write")
	public String confirm(@ModelAttribute ChalConfirmDto confirmDto,
			@RequestParam List<MultipartFile> attachment,
			RedirectAttributes attr,
			HttpSession session) throws IllegalStateException, IOException {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		confirmDto.setUserId(userId);
		
		//chalService에서 번호 미리 생성 후 등록, 첨부파일 업로드(저장)까지 처리
		int confirmNo = chalService.confirm(confirmDto, attachment);
		
		attr.addAttribute("confirmNo", confirmNo);
		return "redirect:detail";
	}
	
	@GetMapping("/detail") //인증글 상세
	public String confirmDetail(Model model,
			@RequestParam int confirmNo,
			HttpSession session) {
		//조회수 중복 방지(Set: 중복 비허용)
		//(1) 세션에 읽은 인증글 번호 저장소(name=history)가 없으면 생성
		Set<Integer> history = (Set<Integer>) session.getAttribute("history");
		if(history == null) {
			history = new HashSet<>();
		}
		
		//(2) 현재 인증글 번호로 읽은 적이 있는지 검사
		if(history.add(confirmNo)) {//처음 읽는 번호면 add됨
			model.addAttribute("confirmDto", confirmDao.read(confirmNo));
		}
		else {//읽은 적이 있으면 add 안 됨
			model.addAttribute("confirmDto", confirmDao.selectOne(confirmNo));
		}
		
		//(3) 갱신된 저장소를 세션에 다시 저장
		session.setAttribute("history", history);
		
		//좋아요 기록 조회
		String userId = (String) session.getAttribute(SessionConstant.ID);
		if(userId != null) {
			UserConfirmLikeDto likeDto = new UserConfirmLikeDto();
			likeDto.setUserId(userId);
			likeDto.setConfirmNo(confirmNo);
			model.addAttribute("isLike", confirmLikeDao.check(likeDto));
		}
		
		model.addAttribute("confirmDto", confirmDao.selectOne(confirmNo));
		return "chal/confirm_detail";
	}
	
	@GetMapping("detail/download") //인증글 이미지 조회
	@ResponseBody
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam int confirmNo) throws IOException {
		//인증글 번호로 첨부파일 번호 찾기
		int attachmentNo = attachmentDao.selectConfirmImg(confirmNo);
		//attachService에서 첨부파일 번호로 파일정보 조회해서 전송  
		return attachService.load(attachmentNo);
	}
	
	@GetMapping("/edit") //인증글 수정
	public String confirmEdit(@RequestParam int confirmNo,
			HttpSession session,
			Model model) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("chalList", confirmDao.selectList(userId));
		ChalConfirmDto confirmDto = confirmDao.selectOne(confirmNo);
		if(confirmDto == null) {
			throw new TargetNotFoundException();
		}
		model.addAttribute("confirmDto", confirmDto);
		return "chal/confirm_edit";
	}
	
	@PostMapping("/edit")
	public String confirmEdit(@ModelAttribute ChalConfirmDto confirmDto,
			@RequestParam List<MultipartFile> attachment,
			RedirectAttributes attr) throws IllegalStateException, IOException {
		//chalService에서 수정, 첨부파일 업로드(추가, 변경)/삭제까지 처리
		int confirmNo = chalService.confirmEdit(confirmDto, attachment);
		
		attr.addAttribute("confirmNo", confirmNo);
		return "redirect:detail";
	}
	
	@GetMapping("/mylist") //챌린지별 내 인증글 목록 조회
	public String myConfirmList(@RequestParam int chalNo,
			Model model,
			HttpSession session) {
		//챌린지 정보 조회
		model.addAttribute("chalDto", chalDao.selectOne(chalNo));
		model.addAttribute("chalVO", chalDao.selectEndDday(chalNo));
		
		//내 인증글 목록 조회
		String userId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("confirmList", confirmDao.myConfirmList(userId, chalNo));
		model.addAttribute("listCnt", confirmDao.myConfirmCnt(userId, chalNo));
		return "chal/confirm_mylist";
	}
	
	@GetMapping("/like") //인증글 좋아요
	public String confirmLike(
				@RequestParam int confirmNo,
				HttpSession session, 
				RedirectAttributes attr) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		UserConfirmLikeDto dto = new UserConfirmLikeDto();
		dto.setUserId(userId);
		dto.setConfirmNo(confirmNo);
		
		if(confirmLikeDao.check(dto)) {//좋아요를 한 상태면
			confirmLikeDao.delete(dto);//취소(데이터 삭제)
		}
		else {//좋아요를 한 적이 없는 상태면
			confirmLikeDao.insert(dto);//좋아요(데이터 추가)
		}
		
		confirmLikeDao.refresh(confirmNo);//confirm_like(인증글 좋아요 수) 갱신
		
		attr.addAttribute("confirmNo", confirmNo);
		return "redirect:detail";
	}
	
	@GetMapping("/all") //챌린지별 참가자 인증글 목록 조회
	public String confirmAll(@RequestParam int chalNo,
			Model model) {
		model.addAttribute("confirmList", confirmDao.allConfirmList(chalNo));
		model.addAttribute("listCnt", confirmDao.confirmCnt(chalNo));
		return "chal/confirm_list";
	}
	
	//@GetMapping("/confirm/reply")
	
}
