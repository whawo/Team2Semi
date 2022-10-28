package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.vo.HalfStartVO;
import com.kh.fourweeks.vo.StartEndTodayVO;

public interface ChalReportDao {
	StartEndTodayVO todayCnt(); //오늘 시작/종료 챌린지 수
	List<HalfStartVO> halfCnt(); //최근 6개월 시작 챌린지 수
}
