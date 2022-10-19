package com.kh.fourweeks.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChalDto {
	private int chalNo;
	private String userId;
	private String chalTitle;
	private String chalContent;
	private int chalPerson;
	private String chalTopic;
	private Date startDate;
	
	
}
