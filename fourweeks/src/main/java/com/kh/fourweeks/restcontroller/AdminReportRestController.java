package com.kh.fourweeks.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.fourweeks.repository.ChalReportDao;
import com.kh.fourweeks.vo.HalfStartVO;
import com.kh.fourweeks.vo.StartEndTodayVO;

@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@RestController
@RequestMapping("/admin/rest/report")
public class AdminReportRestController {
	@Autowired
	private ChalReportDao chalReportDao;
	
	@GetMapping("/chal/today")
	public StartEndTodayVO todayCnt() {
		return chalReportDao.todayCnt(); 
	}
	
	@GetMapping("/chal/half")
	public List<HalfStartVO> halfCnt() {
		return chalReportDao.halfCnt(); 
	}
}