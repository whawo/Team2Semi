package com.kh.fourweeks.entity;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChalUserDto {
	private String userId, userNick, userPw, userEmail;
	private Date createDate, modifiedDate, loginDate;
}
