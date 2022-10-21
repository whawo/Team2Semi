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

    List<ChalListVO> selectList(ChalListSearchVO vo); // 전체 조회 or 검색 조회인지 판정하는 메소드
    List<ChalListVO> list(ChalListSearchVO vo); // 전체조회일시 실행될 메소드
    List<ChalListVO> search(ChalListSearchVO vo); // 검색 조회일시 실행될 메소드
    
	int count(ChalListSearchVO vo); // 전체 조회의 페이지 카운트 or 검색 조회의 페이지 카운트 판정하는 메소드
	int searchCount(ChalListSearchVO vo); // 검색 조회시 페이지를 카운트하는 메소드
	int listCount(ChalListSearchVO vo); // 전체 조회시 페이지를 카운트하는 메소드


}
