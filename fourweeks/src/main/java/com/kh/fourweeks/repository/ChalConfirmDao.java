package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.vo.ConfirmAbleChalListVO;

public interface ChalConfirmDao {
	//인증글 쓰기(+수정) 관련 메소드
	int sequence();
	void write(ChalConfirmDto confirmDto);
	boolean update(ChalConfirmDto confirmDto);
	boolean delete(int confirmNo);
	
	//첨부파일 관련 메소드
	void confirmAttachment(int confirmNo, int attachmentNo, String userId); //confirm_img 테이블에 첨부파일 정보 연결
	
	//조회 관련 메소드
	List<ConfirmAbleChalListVO> selectList(String userId); //인증글 작성 가능한 챌린지 조회
	ChalConfirmDto selectOne(int confirmNo); //인증글 상세 조회
	List<ChalConfirmDto> myConfirmList(String userId, int chalNo); //챌린지별 내 인증글 목록 조회
	int confirmCnt(String userId, int chalNo); //인증글 개수 조회
}
