package com.kh.fourweeks.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.service.ChalService;
import com.kh.fourweeks.service.ChalUserService;
import com.kh.fourweeks.vo.ChalDetailVO;
import com.kh.fourweeks.vo.ConfirmDaysVO;

@RestController
@RequestMapping("/rest/chal")
public class ChalRestController {
	@Autowired
	private ChalConfirmDao confirmDao;
	
	@Autowired
	private ChalService chalService;
	
	@Autowired
	private ChalDao chalDao;
	
	@Autowired
	private ChalUserService chalUserService;
	
	@GetMapping("/confirm_days") //인증글 작성일차 가져오기
	public List<ConfirmDaysVO> myConfirmDays(@ModelAttribute ChalMyDetailDto chalMyDetailDto, HttpSession session) {
		return confirmDao.myConfirmDays(chalMyDetailDto.getChalNo(), (String)session.getAttribute(SessionConstant.ID));
	}
	
	@GetMapping("/chal_end_date") //챌린지 종료일 가져오기(타이머용)
	public ChalDetailVO chalEndDate (int chalNo) {
		return chalDao.selectEndDday(chalNo);
	}
	
	@GetMapping("/chal_detail")	//챌린지 객체에서 시작일 가져오기(타이머용)
	public ChalDto chalDetail (int chalNo) {
		return chalDao.selectOne(chalNo);
	}
	
	@GetMapping("/confirm_img/delete") //인증글 수정 > 이미지 삭제 시 실제 데이터 삭제
	public boolean confirmImgDelete(int confirmNo) {
		return chalService.remove(confirmNo);
	}
	

	@GetMapping("/user_img/delete") //프로필 수정 > 이미지 삭제 시 실제 데이터 삭제
	public boolean userImgDelete(String userId, HttpSession session) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		return chalUserService.remove(loginId);
	}
}
