package com.kh.fourweeks.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserJoinedVO {
	private int userCount;
	private String joinDate;
}
