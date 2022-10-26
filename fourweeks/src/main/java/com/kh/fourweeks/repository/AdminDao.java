package com.kh.fourweeks.repository;

import com.kh.fourweeks.entity.AdminDto;

public interface AdminDao {
	//어드민 계정 insert, delete, update는 DB 최고 권한자가 DB에서 직접 처리
	AdminDto selectOne(String adminId); // 어드민 단일조회

	void updateLoginTime(String adminId); // 로그인 일시 자동 갱신
}
