package com.kh.fourweeks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.AttachmentDto;
import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.entity.ChalUserDto;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.repository.ChalUserDao;

@Controller
public class ChalUserController {

	@Autowired
	private ChalUserDao chalUserDao;
	@Autowired
	private ChalConfirmDao confirmDao;
	
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
	
	
	@GetMapping("/mypage")
	public String myPage(@ModelAttribute ChalUserDto chalUserDto,
			@ModelAttribute AttachmentDto attachmentDto,
			@ModelAttribute ChalMyDetailDto chalMyDetailDto,
			Model model,
			HttpSession session
			) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		
		model.addAttribute("myDto", chalUserDao.selectOne(userId));
		model.addAttribute("chalDto" , chalUserDao.selectAllMyDetail((String)session.getAttribute(SessionConstant.ID)));
		model.addAttribute("progressDto",
				confirmDao.myConfirmCnt(chalMyDetailDto.getChalNo(),
						(String)session.getAttribute(SessionConstant.ID)));
		System.out.println(model + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return "chalUser/mypage";
		
	}
		
}
