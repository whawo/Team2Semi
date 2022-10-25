package com.kh.fourweeks.controller;

import java.io.File;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.vo.ChalListSearchVO;


@Controller
public class HomeController {
	
	@Autowired
	private ChalDao chalDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	private final File dir = new File(System.getProperty("user.home") + "/upload");

	@PostConstruct //최초 실행 시 딱 한번만 실행되는 메소드
	public void prepare() {
		dir.mkdirs();
	}
	
	@RequestMapping("/")
	public String home(
			Model model,
			@ModelAttribute(name="vo") ChalListSearchVO vo) {
		
		model.addAttribute("list", attachmentDao.selectList());
		model.addAttribute("list", chalDao.listOfLargePerson(vo));
		return "home";
	}
	
	@RequestMapping("/need_login")
	public String needLogin() {
		return "need_login";
	}
}
