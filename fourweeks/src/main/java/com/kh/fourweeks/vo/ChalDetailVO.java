package com.kh.fourweeks.vo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChalDetailVO {
	private String endDate;
	private String dDay;
	private int chalNo;
	private String endDday;
}
