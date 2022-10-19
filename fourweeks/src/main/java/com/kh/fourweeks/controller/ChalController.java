package com.kh.fourweeks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ParticipantDto;
import com.kh.fourweeks.repository.ChalDao;

@Controller
@RequestMapping("/chal")
public class ChalController {
	@Autowired
	private ChalDao chalDao;
	
	@GetMapping("/create")
	public String create() {
		return "chal/create";
	}
	
	@PostMapping("/create")
	private String create(@ModelAttribute ChalDto chalDto,
			@ModelAttribute ParticipantDto partDto,
			RedirectAttributes attr,
			HttpSession session) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		chalDto.setUserId(memberId);
		
		//번호 미리 생성
		int chalNo = chalDao.chalSeq();
		chalDto.setChalNo(chalNo);
		
		//개설(등록)
		chalDao.insert(chalDto);

		//참가자에 개설자 자동 추가
		partDto.setChalNo(chalNo);
		partDto.setUserId(memberId);
		chalDao.addParticipant(partDto);
		
		//redirect
		attr.addAttribute("chalNo", chalNo);
		return "redirect:detail";
	}
}
