package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.vo.HalfStartVO;
import com.kh.fourweeks.vo.JoinedAndLeaveVO;
import com.kh.fourweeks.vo.MonthlyTopicVO;
import com.kh.fourweeks.vo.PartByTopicVO;
import com.kh.fourweeks.vo.StartEndTodayVO;
import com.kh.fourweeks.vo.UserJoinedVO;
import com.kh.fourweeks.vo.UserLeaveVO;

public interface ChalReportDao {
	StartEndTodayVO todayCnt(); //오늘 시작/종료 챌린지 수
	List<HalfStartVO> halfCnt(); //최근 6개월 시작 챌린지 수
	List<MonthlyTopicVO> topicLastMonth(); //지난 달 주제별 시작 챌린지 수
	List<MonthlyTopicVO> topicThisMonth(); //이번 달 주제별 시작 챌린지 수
	List<PartByTopicVO> partAvgThisMonth(); //이번 달 주제별 참가자 수 평균
	JoinedAndLeaveVO todaysInfoOfUsers();
	List<UserJoinedVO> joinedCnt(); // 2022.01 ~ 오늘까지 가입자 수 (월별)
	List<UserLeaveVO> leaveCnt(); // 2022.01 ~ 오늘까지 탈퇴자 수 (월별)
	
	double todayConfirmRate(); //오늘 인증률(진행 중 챌린지의 오늘 인증글 수 / 참가자 수)
}
