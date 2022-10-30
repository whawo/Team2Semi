package com.kh.fourweeks.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.vo.ConfirmDaysVO;

@RestController
@RequestMapping("/rest/chal")
public class ChalRestController {
	@Autowired
	private ChalConfirmDao confirmDao;
	
	@GetMapping("/confirm_days")
	public List<ConfirmDaysVO> myConfirmDays(@ModelAttribute ChalMyDetailDto chalMyDetailDto, HttpSession session) {
		return confirmDao.myConfirmDays(chalMyDetailDto.getChalNo(), (String)session.getAttribute(SessionConstant.ID));
	}
}
