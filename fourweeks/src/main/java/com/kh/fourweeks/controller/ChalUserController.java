package com.kh.fourweeks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fourweeks.entity.ChalUserDto;
import com.kh.fourweeks.repository.ChalUserDao;

@Controller
public class ChalUserController {

	@Autowired
	private ChalUserDao chalUserDao;
	
	// 회원가입 페이지 시작
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
	// 회원가입 페이지 끝
	
	// 로그인 페이지 시작
	
}
