package com.kh.fourweeks.repository;
import java.util.List;

import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ParticipantDto;
import com.kh.fourweeks.vo.ChalDetailVO;
import com.kh.fourweeks.vo.ChalListSearchVO;
import com.kh.fourweeks.vo.ChalListVO;

public interface ChalDao {
	int chalSeq(); //챌린지 개설 시퀀스
	void insert(ChalDto chalDto); //챌린지 개설
	void addParticipant(ParticipantDto partDto); //참가자에 개설자 자동 추가
	void connectAttachment(int chalNo, int attachmentNo); //chal_img 테이블에 첨부파일 정보 연결
    ChalDto selectOne(int chalNo);//상세페이지 조회 기능(단일)
    ChalDetailVO selectEndDday(int chalNo);//종료일, 남은일수 조회 메소드

    
    List<ChalListVO> selectList(ChalListSearchVO vo);
    List<ChalListVO> list(ChalListSearchVO vo);
    List<ChalListVO> search(ChalListSearchVO vo);
    
	int count(ChalListSearchVO vo);
	int searchCount(ChalListSearchVO vo);
	int listCount(ChalListSearchVO vo);

}
