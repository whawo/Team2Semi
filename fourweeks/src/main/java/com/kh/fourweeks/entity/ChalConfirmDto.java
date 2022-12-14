package com.kh.fourweeks.entity;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChalConfirmDto {
	private int confirmNo;
	private int chalNo;
	private String userId;
	private String confirmTitle;
	private String confirmContent;
	private int confirmRead;
	private int confirmLike;
	private Date confirmDate;
	private Date modifiedDate;
}
