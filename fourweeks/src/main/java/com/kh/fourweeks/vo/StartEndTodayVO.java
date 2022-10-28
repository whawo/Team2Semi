package com.kh.fourweeks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//오늘 시작/종료하는 챌린지 수 통계용
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StartEndTodayVO {
	private int scnt;
	private int ecnt;
}
