package com.kh.fourweeks.entity;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChalUserDto {

	private String userId;
	private String userPw;
	private String userNick;
	private String userEmail;
	private Date createDate;
	private Date modifiedDate;
	private Date loginDate;
	
}
