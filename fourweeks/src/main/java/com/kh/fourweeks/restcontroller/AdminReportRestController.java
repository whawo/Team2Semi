package com.kh.fourweeks.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.fourweeks.repository.ChalReportDao;
import com.kh.fourweeks.vo.HalfStartVO;
import com.kh.fourweeks.vo.JoinedAndLeaveVO;
import com.kh.fourweeks.vo.MonthlyTopicVO;
import com.kh.fourweeks.vo.PartByTopicVO;
import com.kh.fourweeks.vo.StartEndTodayVO;
import com.kh.fourweeks.vo.UserJoinedVO;
import com.kh.fourweeks.vo.UserLeaveVO;
import com.kh.fourweeks.vo.VisitVO;

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
	@GetMapping("/chal/topic_last")
	public List<MonthlyTopicVO> topicLastMonth() {
		return chalReportDao.topicLastMonth(); 
	}
	
	@GetMapping("/chal/topic_this")
	public List<MonthlyTopicVO> topicThisMonth() {
		return chalReportDao.topicThisMonth(); 
	}
	
	@GetMapping("/chal/today_user")
	public JoinedAndLeaveVO todayUserCnt() {
		return chalReportDao.todaysInfoOfUsers();
	}
  
	@GetMapping("/chal/user")
	public List<UserJoinedVO> userCnt() {
		return chalReportDao.joinedCnt();
	}

	@GetMapping("/chal/today_confirm_rate")
	public double todayConfirmRate() {
		return chalReportDao.todayConfirmRate();
	}
	
	@GetMapping("/chal/part_topic")
	public List<PartByTopicVO> partByTopic() {
		return chalReportDao.partAvgThisMonth();
	};
	
	@GetMapping("/chal/leave_user")
	public List<UserLeaveVO> leaveCnt() {
		return chalReportDao.leaveCnt();
	}
	@GetMapping("/chal/users_visit")
	public List<VisitVO> visitCnt() {
		return chalReportDao.visitCnt();
	}
}
