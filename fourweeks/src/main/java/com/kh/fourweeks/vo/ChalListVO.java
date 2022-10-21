package com.kh.fourweeks.vo;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ChalListVO {
	private int chalNo;
	private int chalPerson;
	private String chalTitle;
	private String chalTopic;
	private String dDay;
	private String endDate;
	private int rn;
}
