package com.kh.fourweeks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PartByTopicVO {
	private String chalTopic;
	private int partCnt;
}
