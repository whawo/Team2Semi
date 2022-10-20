package com.kh.fourweeks.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ParticipantDto;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.service.ChalService;

@Controller
@RequestMapping("/chal")
public class ChalController {
	@Autowired
	private ChalDao chalDao;
	
	@Autowired
	private ChalService chalService;
	
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
		
		//redirect
		attr.addAttribute("chalNo", chalNo);
		return "redirect:detail";
	}
}
