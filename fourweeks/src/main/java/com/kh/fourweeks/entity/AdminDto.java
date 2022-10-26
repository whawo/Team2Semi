package com.kh.fourweeks.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AdminDto {
	private String adminId;
	private String adminPw;
	private Date adminAdd;
	private Date adminLogin;
}
