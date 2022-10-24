package com.kh.fourweeks.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChalAllDetailVO {

	private String chalTitle, chalContent;
	private Date startDate;
	private int participantNo;
	private int chalNo;
	private String userId;
	private Date participantJoin;
}
