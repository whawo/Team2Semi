package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.entity.ChalUserDto;

public interface ChalUserDao {
	void join(ChalUserDto chalUserDto); // 회원가입 메소드
	ChalUserDto selectOne(String userId); // 유저 단일조회 메소드
	ChalUserDto selectNick(String userNick); // 유저 단일조회 메소드
	List<ChalUserDto> selectEmail(String userEmail); // 이메일로 가입된 아이디 조회(다수 가능)
	ChalUserDto findPw(String userId, String userEmail); // 아이디, 이메일로 비밀번호 조회
	boolean updateLoginTime(String userId); // 로그인 시각 자동갱신 메소드
	boolean delete(String userId); // 탈퇴(테이블 데이터 삭제)
	

	//프로필 수정용 메소드
	boolean myInfoUpdate(ChalUserDto userDto); // 프로필 정보 변경
	void userAttachment(int attachmentNo, String userId); // user_img 테이블에 첨부파일 정보 연결
	boolean updatePw(String newPw, String userId); //비밀번호 변경

	//참가중인 모든챌린지 조회 메소드
	List<ChalMyDetailDto> selectAllMyDetail(String userId);
}
