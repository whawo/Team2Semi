package com.kh.fourweeks.controller;

import java.io.IOException;
import java.util.List;

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
import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.entity.ChalUserDto;
import com.kh.fourweeks.entity.LeaveCountDto;
import com.kh.fourweeks.error.TargetNotFoundException;
import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.repository.ChalUserDao;
import com.kh.fourweeks.service.AttachmentService;
import com.kh.fourweeks.service.ChalUserService;

@Controller
@RequestMapping("/user")
public class ChalUserController {
	@Autowired
	private ChalUserDao chalUserDao;	
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ChalUserService userService;
	
	@Autowired
	private AttachmentService attachService;

	@Autowired
	private ChalConfirmDao confirmDao;
	
	@Autowired
	private ChalDao chalDao;	
	
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
	@RequestMapping("/join_success")
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
			session.setAttribute(SessionConstant.NICK, findDto.getUserNick());
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
		session.removeAttribute("loginNick");
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public String myPage(@ModelAttribute ChalUserDto chalUserDto,
			@ModelAttribute AttachmentDto attachmentDto,
			@ModelAttribute ChalMyDetailDto chalMyDetailDto,
			Model model,
			HttpSession session) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		
		model.addAttribute("myDto", chalUserDao.selectOne(userId));
		//참가중인 챌린지 조회
		model.addAttribute("chalDto" , chalUserDao.selectAllMyDetail(userId));
		//참가종료 챌린지 조회
		model.addAttribute("chalEndDto" , chalUserDao.selectEndAllMyDetail(userId));
		//내가 개설한 챌린지 조회
		model.addAttribute("createDto" , chalUserDao.selectCreateAllMyDetail(userId));
		//전체 참가자 평균 달성률
		model.addAttribute("avgDto", confirmDao.confirmCnt(chalMyDetailDto.getChalNo()));
		
		model.addAttribute("progressDto",
				confirmDao.myConfirmCnt(chalMyDetailDto.getChalNo(), userId));
		return "chalUser/mypage";
	}
	
	@GetMapping("/mypage/edit") // 프로필 수정
	public String editInfo(HttpSession session,
			Model model) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
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
		
		//수정 성공 시, DB 수정일시 컬럼 자동 업데이트 
		if(chalUserDao.myInfoUpdate(userDto)) {			
			chalUserDao.updateModifiedTime(userId);
		};
		attr.addAttribute("userId", userId);
		return "redirect:/user/mypage";
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
	
	@GetMapping("/mypage/edit/auth") // 프로필 수정 전 비밀번호 확인
	public String editAuth(Model model,
			HttpSession session) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("userDto", chalUserDao.selectOne(userId));			
		return "chalUser/edit_auth";
	}
	
	@PostMapping("/mypage/edit/auth")
	public String editAuth(@ModelAttribute ChalUserDto inputDto,
			RedirectAttributes attr) {
		ChalUserDto findDto = chalUserDao.selectOne(inputDto.getUserId());
		if(findDto == null) {
			return "redirect:/need_login";
		}
		boolean passwordMatch = findDto.getUserPw().equals(inputDto.getUserPw());
		if(!passwordMatch) {
			return "redirect:auth?error";
		}else {
			return "redirect:/user/mypage/edit";
		}
	}
	
	@GetMapping("/mypage/edit/pw") // 비밀번호 변경
	public String editPw(Model model,
			HttpSession session) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("userDto", chalUserDao.selectOne(userId));			
		return "chalUser/edit_pw";
	}
	
	@PostMapping("/mypage/edit/pw") 
	public String editPw(@ModelAttribute ChalUserDto inputDto,
			HttpSession session,
			RedirectAttributes attr) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		if(loginId.equals(inputDto.getUserId())) {
			if(chalUserDao.updatePw(inputDto.getUserPw(), inputDto.getUserId())) {
				//수정 성공 시, DB 수정일시 컬럼 자동 업데이트 
				chalUserDao.updateModifiedTime(loginId);
				return "redirect:/user/mypage";
			}else {
				throw new TargetNotFoundException();
			}
		}else {
			throw new TargetNotFoundException();
		}
	}

	
	@GetMapping("/leave") // 탈퇴
	public String leave(
			HttpSession session,
			@ModelAttribute LeaveCountDto leaveCountDto) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		if(chalUserDao.delete(userId)) {
			//내가 개설하고 나만 참가 중인(참가자=1명) 챌린지 삭제
			chalDao.deleteChalOnlyMe(userId);
			
			session.removeAttribute(SessionConstant.ID);
			chalUserDao.leaveCounting(leaveCountDto); // 탈퇴수 카운팅 메소드
			return "chalUser/leave";
		}else {
			throw new TargetNotFoundException();
		}
	}
	
	@GetMapping("/find_id")
	public String findId() {
		return "chalUser/find_id";
	}
	
	@PostMapping("/find_id")
	public String findId(Model model, @RequestParam String userEmail) {
		List<ChalUserDto> userDto = chalUserDao.selectEmail(userEmail);
		if(!userDto.isEmpty()) {			
			model.addAttribute("idList", userDto);
			return "chalUser/find_id_result";
		} else {			
			return "redirect:find_id?error";
		}
	}

	@GetMapping("/find_pw")
	public String findPw() {
		return "chalUser/find_pw";
	}
	
	@PostMapping("/find_pw") // 비밀번호 찾기
	public String findPw(
			Model model, 
			@RequestParam String userId,
			@RequestParam String userEmail,
			RedirectAttributes attr) {
		ChalUserDto userDto = chalUserDao.findPw(userId, userEmail);
		if(userDto != null) {			
			model.addAttribute("userDto", userDto);
			attr.addAttribute("userId", userId);
			return "redirect:reset_pw";
		} else {			
			return "redirect:find_pw?error";
		}
	}
	
	@GetMapping("/reset_pw") // 비밀번호 재설정
	public String resetPw(Model model,
			@RequestParam(required = false) String userId) {
		model.addAttribute("userDto", chalUserDao.selectOne(userId));			
		return "chalUser/reset_pw";
	}
	
	@PostMapping("/reset_pw") 
	public String resetPw(
			@RequestParam(required = false) String userId,
			@RequestParam String newPw,
			@RequestParam String newPwCheck
			) {
		boolean check = newPw.equals(newPwCheck);
		if(check) {
			if(chalUserDao.updatePw(newPw, userId)) {
				//수정 성공 시, DB 수정일시 컬럼 자동 업데이트 
				chalUserDao.updateModifiedTime(userId);
			};
			return "redirect:login";
		} else {
			return "redirect:reset_pw?error";
		}
	}
}