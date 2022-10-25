package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.entity.ChalUserDto;
import com.kh.fourweeks.vo.ChalDetailVO;

public interface ChalUserDao {
	void join(ChalUserDto chalUserDto); // 회원가입 메소드
	ChalUserDto selectOne(String userId); // 유저 단일조회 메소드
	ChalUserDto selectNick(String userNick); // 유저 단일조회 메소드
	boolean updateLoginTime(String userId); // 로그인 시각 자동갱신 메소드
	
	//참가중인 모든챌린지 조회 메소드
	List<ChalMyDetailDto> selectAllMyDetail(String userId);
}
