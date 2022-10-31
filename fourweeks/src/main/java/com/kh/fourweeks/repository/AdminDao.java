package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.AdminDto;
import com.kh.fourweeks.vo.NoticeListSearchVO;
import com.kh.fourweeks.vo.NoticeVO;

public interface AdminDao {
	//어드민 계정 insert, delete, update는 DB 최고 권한자가 DB에서 직접 처리
	AdminDto selectOne(String adminId); // 어드민 단일조회ㅁ

	void updateLoginTime(String adminId); // 로그인 일시 자동 갱신
	
	NoticeVO selectNoticeOne(int noticeNo); // 공지글 하나 조회
	
	List<NoticeVO> selectNoticeAll( NoticeListSearchVO vo); // 공지글 전체 조회
	
	List<NoticeVO> selectNoticeSearch(NoticeListSearchVO vo); //공지글 검색
	
	void insert(NoticeVO dto);
	
	boolean update(NoticeVO dto);
	
	//Dao
	List<NoticeVO> selectList(NoticeListSearchVO vo);
	//검색과 목록의 총 결과 데이터 개수를 구하는 메소드
	int count(NoticeListSearchVO vo);
	int searchCount(NoticeListSearchVO vo);
	int listCount(NoticeListSearchVO vo);
	
	
}
