package com.kh.fourweeks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//최근 6개월 시작 챌린지 수 통계용
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class HalfStartVO {
	private String startMonth;
	private int cnt;
}
