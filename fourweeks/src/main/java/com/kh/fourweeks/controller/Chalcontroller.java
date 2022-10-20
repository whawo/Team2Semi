package com.kh.fourweeks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.repository.ChalDao;
@Controller
@RequestMapping("/challenge")
public class Chalcontroller {

	@Autowired
	private ChalDao chalDao;

	@GetMapping("/detail")
	public String detail(
			@ModelAttribute ChalDto chalDto, Model model,
			HttpSession session) {
		model.addAttribute("chalDto", chalDao.selectOne(chalDto.getChalNo()));
		return "challenge/detail";
	}
}
