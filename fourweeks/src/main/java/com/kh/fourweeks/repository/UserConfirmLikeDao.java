package com.kh.fourweeks.repository;

import com.kh.fourweeks.entity.UserConfirmLikeDto;

public interface UserConfirmLikeDao {
	void insert(UserConfirmLikeDto dto); //좋아요 등록
	void delete(UserConfirmLikeDto dto); //좋아요 취소 시 삭제
	boolean check(UserConfirmLikeDto dto); //좋아요 여부 확인(좋아요 했으면 1, 아니면 0)
	int count(int confirmNo); //인증글 좋아요 개수 조회
	void refresh(int confirmNo); //chal_confirm 테이블 좋아요 개수 업데이트
}
