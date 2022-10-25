package com.kh.fourweeks.controller;

import java.io.IOException;

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
import com.kh.fourweeks.entity.ChalUserDto;
import com.kh.fourweeks.error.TargetNotFoundException;
import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalUserDao;
import com.kh.fourweeks.service.AttachmentService;
import com.kh.fourweeks.service.ChalUserService;

@Controller
public class ChalUserController {
	@Autowired
	private ChalUserDao chalUserDao;	
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ChalUserService userService;
	
	@Autowired
	private AttachmentService attachService;
	
	@GetMapping("/join")
	public String join() {
		return "chalUser/join";
	}
	@PostMapping("/join")
	public String join(
			@ModelAttribute ChalUserDto chalUserDto) {
		chalUserDao.join(chalUserDto);
		return "redirect:join_success";
	}
	@RequestMapping("join_success")
	public String joinSuccess() {
		return "chalUser/joinSuccess";
	}
	
	@GetMapping("/login")
	public String login() {
		return "chalUser/login";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute ChalUserDto inputDto,
											HttpSession session) {
		ChalUserDto findDto = chalUserDao.selectOne(inputDto.getUserId());
		if(findDto == null) {
			return "redirect:login?error";
		}
		// 비밀번호 검사
		boolean pwMatch = inputDto.getUserPw().equals(findDto.getUserPw());
		
		if(pwMatch) {
			session.setAttribute(SessionConstant.ID, findDto.getUserId());
			
			// 로그인 시각 업데이트
			chalUserDao.updateLoginTime(inputDto.getUserId());
			return "redirect:/";
		} else {
			return "redirect:login?error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		return "redirect:/";
	}
	
	@GetMapping("/mypage/edit")
	public String editInfo(@RequestParam String userId,
			Model model) {
		ChalUserDto userDto = chalUserDao.selectOne(userId);
		if(userDto == null) {
			throw new TargetNotFoundException();
		}
		model.addAttribute("userDto", userDto);
		return "chalUser/myinfo_edit";
	}
	
	@PostMapping("/mypage/edit")
	public String editInfo(@ModelAttribute ChalUserDto userDto,
			@RequestParam MultipartFile attachment,
			RedirectAttributes attr) throws IllegalStateException, IOException {
		//userService에서 수정, 첨부파일 업로드(추가, 변경)/삭제까지 처리
		String userId = userService.myInfoEdit(userDto, attachment);
		
		attr.addAttribute("userId", userId);
		return "redirect:/mypage";
	}
	
	@GetMapping("/profile/download") // 프로필 사진 다운로드
	@ResponseBody
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam String userId) throws IOException {
		//아이디로 첨부파일 번호 찾기
		AttachmentDto attachDto = attachmentDao.userImgInfo(userId);
		int attachmentNo = attachDto.getAttachmentNo();

		//attachService에서 첨부파일 번호로 파일정보 조회해서 전송  
		return attachService.load(attachmentNo);
	}
	
}
