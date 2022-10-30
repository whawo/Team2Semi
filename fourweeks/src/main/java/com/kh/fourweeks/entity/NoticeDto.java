package com.kh.fourweeks.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeDto {

	int noticeNo;
	String adminId;
	String noticeTitle;
	String noticeContent;
	Date noticeTime;
	Date noticeModified;
	
}
