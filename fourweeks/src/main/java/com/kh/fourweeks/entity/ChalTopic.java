package com.kh.fourweeks.entity;
import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChalTopic {

	private String chalTopic;
	private Date createDate;
}
