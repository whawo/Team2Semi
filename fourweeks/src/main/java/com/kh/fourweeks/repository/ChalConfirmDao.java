package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.vo.ConfirmAbleChalListVO;

public interface ChalConfirmDao {
	//인증글 쓰기(+수정) 관련 메소드
	int sequence();
	void write(ChalConfirmDto confirmDto);
	boolean update(ChalConfirmDto confirmDto);
	
	//첨부파일 관련 메소드
	void confirmAttachment(int confirmNo, int attachmentNo, String userId); //confirm_img 테이블에 첨부파일 정보 연결
	
	//조회 관련 메소드
	List<ConfirmAbleChalListVO> selectList(String userId); //인증글 작성 가능한 챌린지 조회
	
}
