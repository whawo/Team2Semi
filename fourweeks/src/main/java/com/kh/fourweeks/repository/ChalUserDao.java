package com.kh.fourweeks.repository;

import com.kh.fourweeks.entity.ChalUserDto;

public interface ChalUserDao {
	void join(ChalUserDto chalUserDto); // 회원가입 메소드
	ChalUserDto selectOne(String userId); // 유저 단일조회 메소드
	ChalUserDto selectNick(String userNick); // 유저 단일조회 메소드
	boolean updateLoginTime(String userId); // 로그인 시각 자동갱신 메소드
	
	//프로필 수정용 메소드
	boolean myInfoUpdate(ChalUserDto userDto);
	void userAttachment(int attachmentNo, String userId); // user_img 테이블에 첨부파일 정보 연결
}
