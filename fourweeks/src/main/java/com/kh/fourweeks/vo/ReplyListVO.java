package com.kh.fourweeks.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReplyListVO {
	private int replyNo;
	private int confirmNo;
	private String userId;
	private String replyContent;
	private Date replyDate;
	private Date replyUpdate;
	private boolean replyBlind;
	private String userNick;
}
