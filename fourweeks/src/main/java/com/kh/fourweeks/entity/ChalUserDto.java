package com.kh.fourweeks.entity;
import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChalUserDto {
	private String userId, userNick, userPw, userEmail;
	private Date createDate, modifiedDate, loginDate;
}
