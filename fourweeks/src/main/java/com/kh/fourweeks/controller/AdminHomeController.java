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
import com.kh.fourweeks.entity.AdminDto;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.NoticeDto;
import com.kh.fourweeks.repository.AdminDao;
import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalReportDao;
import com.kh.fourweeks.service.AttachmentService;
import com.kh.fourweeks.service.ChalService;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private AttachmentService attachService;
	
	@Autowired
	private ChalService chalService;
	
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
	public String chalReport() {
		return "admin/chal_report";
	}
	
	@GetMapping("/report/user")
	public String userReport() {
		return "admin/user_report";
	}
	
	@GetMapping("/write")
	public String insert() {
		
		return "admin/write";
	}
	
	@PostMapping("/write")
	public String insert(@ModelAttribute NoticeDto noticeDto,
			@RequestParam MultipartFile attachment,
			RedirectAttributes attr,
			HttpSession session) throws IllegalStateException, IOException {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		noticeDto.setAdminId(userId);
		
		int noticeNo = chalService.notice(noticeDto, attachment);
		
		attr.addAttribute("noticeNo", noticeNo);
		return "redirect:detail";
	}
	
	@GetMapping("/list")
	public String list(@ModelAttribute NoticeDto noticeDto,
			@RequestParam(required = false) String keyword,
			Model model) {
		boolean isSearch = keyword != null;
		if(isSearch) {//검색
			model.addAttribute("list", adminDao.selectNoticeAll(keyword));
		}
		else {//목록
			model.addAttribute("list", adminDao.selectNoticeAll());
		}
		return "admin/list";
		
	}
	
	@GetMapping("/detail")
	public String detail(@ModelAttribute NoticeDto noticeDto,
			Model model) {
		
		model.addAttribute("detailDto", adminDao.selectNoticeOne(noticeDto.getNoticeNo()));
		
		return "admin/detail";
		
	}
	
	@GetMapping("/detail/download")//공지글 상세 이미지 조회
	@ResponseBody
	public ResponseEntity<ByteArrayResource> detailDownload(
			@ModelAttribute NoticeDto noticeDto
		) throws IOException {
		//공지글 번호로 첨부파일 번호 찾기
		int attachmentNo = attachmentDao.selectNoticeImg(noticeDto.getNoticeNo());
		//attachService에서 첨부파일 번호로 파일정보 조회해서 전송  
		return attachService.load(attachmentNo);
	}
	
	@GetMapping("/edit")
	public String edit(Model model,
			@RequestParam int noticeNo,
			HttpSession session
			) {
		model.addAttribute("dto", adminDao.selectNoticeOne(noticeNo));
		return "admin/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute NoticeDto noticeDto,
			@RequestParam MultipartFile attachment,
			RedirectAttributes attr,
			Model model) throws IllegalStateException, IOException {
			int noticeNo = chalService.noticeEdit(noticeDto, attachment);
			
			attr.addAttribute("noticeNo", noticeNo);
			
			return "redirect:detail";
		}
	
	
	@GetMapping("/edit_fail")
	public String editFail() {
		
		return "admin/edit_fail";
	}
}
