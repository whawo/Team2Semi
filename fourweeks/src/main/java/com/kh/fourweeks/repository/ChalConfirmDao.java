package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.vo.ChalConfirmVO;
import com.kh.fourweeks.vo.ConfirmAbleChalListVO;
import com.kh.fourweeks.vo.ConfirmDaysVO;
import com.kh.fourweeks.vo.NoticeVO;

public interface ChalConfirmDao {
	//인증글 쓰기(+수정) 관련 메소드
	int sequence();
    int noticeSequence();
	void write(ChalConfirmDto confirmDto);
	boolean update(ChalConfirmDto confirmDto);
	boolean delete(int confirmNo);
	
	//첨부파일 관련 메소드
	
	//조회 관련 메소드
	List<ConfirmAbleChalListVO> selectList(String userId); //인증글 작성 가능한 챌린지 조회
	ChalConfirmVO selectOne(int confirmNo); //인증글 상세 조회
	List<ChalConfirmVO> myConfirmList(ChalConfirmVO vo); //챌린지별 내 인증글 목록 조회
	int myConfirmCnt(int chalNo, String userId); //내 인증글 개수 조회
	
	ChalConfirmVO read(int confirmNo); //인증글 상세 조회+조회수 증가
	boolean updateReadcount(int confirmNo); //인증글 조회수 증가
	
	List<ChalConfirmVO> allConfirmList(ChalConfirmVO vo); //챌린지별 참가자 전체 인증글 목록 조회
	List<ChalConfirmVO> allConfirmTopN(ChalConfirmVO vo); //챌린지별 참가자 전체 인증글 topN개 조회
	int confirmCnt(int chalNo); //참가자 인증글 개수 조회
	boolean updateNotice(NoticeVO noticeDto);
	void confirmAttachment(int confirmNo, int attachmentNo);
	void noticeAttachment(int noticeNo, int attachmentNo);
	
	List<ConfirmDaysVO> myConfirmDays(int chalNo, String userId); //챌린지 번호와 유저 아이디로 작성된 인증글 n일차로 조회 
}
