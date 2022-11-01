package com.kh.fourweeks.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.vo.ChalDetailVO;
import com.kh.fourweeks.vo.ConfirmDaysVO;

@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@RestController
@RequestMapping("/rest/chal")
public class ChalRestController {
	@Autowired
	private ChalConfirmDao confirmDao;
	
	
	@Autowired
	private ChalDao chalDao;
	
	@GetMapping("/confirm_days")
	public List<ConfirmDaysVO> myConfirmDays(@ModelAttribute ChalMyDetailDto chalMyDetailDto, HttpSession session) {
		return confirmDao.myConfirmDays(chalMyDetailDto.getChalNo(), (String)session.getAttribute(SessionConstant.ID));
	}
	
	@GetMapping("/chal_end_date")
	public ChalDetailVO chalEndDate (int chalNo) {
		return chalDao.selectEndDday(chalNo);
	}
	
	@GetMapping("/chal_detail")
	public ChalDto chalDetail (int chalNo) {
		return chalDao.selectOne(chalNo);
	}
}
