package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.AdminDto;
import com.kh.fourweeks.entity.NoticeDto;

public interface AdminDao {
	//어드민 계정 insert, delete, update는 DB 최고 권한자가 DB에서 직접 처리
	AdminDto selectOne(String adminId); // 어드민 단일조회

	void updateLoginTime(String adminId); // 로그인 일시 자동 갱신
	
	NoticeDto selectNoticeOne(int noticeNo); // 공지글 하나 조회
	
	List<NoticeDto> selectNoticeAll(); // 공지글 전체 조회
	
	List<NoticeDto> selectNoticeAll(String keyword); //공지글 검색
	
	void insert(NoticeDto dto);
	
	boolean update(NoticeDto dto);
	
	
}
