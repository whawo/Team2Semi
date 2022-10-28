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
import com.kh.fourweeks.entity.AdminDto;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.repository.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/home")
	public String home(Model model,
			HttpSession session) {
		
		return "admin/home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute AdminDto inputDto,
			HttpSession session) {
		AdminDto findDto = adminDao.selectOne(inputDto.getAdminId());
		if(findDto == null) {
			return "redirect:login?error";
		}
		// 비밀번호 검사
		boolean pwMatch = inputDto.getAdminPw().equals(findDto.getAdminPw());
		
		if(pwMatch) {
			session.setAttribute(SessionConstant.ID, findDto.getAdminId());
			// 로그인 일시 갱신
			adminDao.updateLoginTime(inputDto.getAdminId());
			return "redirect:home";
		} else {
			return "redirect:login?error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		return "redirect:login";
	}
	
	@GetMapping("/report/chal")
	public String chalReport(@ModelAttribute ChalDto chalDto) {
		return "admin/chal_report";
	}
}
