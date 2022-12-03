package com.kh.fourweeks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//프로필 이미지 설정 여부 조회용
@Data  @Builder @NoArgsConstructor @AllArgsConstructor
public class HasUserImgVO {
	private String userId;
	private int attachmentNo;
}
