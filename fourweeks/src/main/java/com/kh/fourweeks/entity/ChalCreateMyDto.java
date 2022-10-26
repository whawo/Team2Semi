package com.kh.fourweeks.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChalCreateMyDto {
	
	private String chalTitle, chalContent, howConfirm;//
	private Date startDate;//
	private int chalPerson;//
	private int chalNo;//
	private String userId;//
	private String chalTopic;//
	private String endDate;//
	private String dDay;//
	private String endDDay;//
	private int cnt;//

}
