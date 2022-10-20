package com.kh.fourweeks.repository;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ParticipantDto;
public interface ChalDao {
	int chalSeq(); //챌린지 개설 시퀀스
	void insert(ChalDto chalDto); //챌린지 개설
	void addParticipant(ParticipantDto partDto); //참가자에 개설자 자동 추가
	void connectAttachment(int chalNo, int attachmentNo); //chal_img 테이블에 첨부파일 정보 연결
	ChalDto selectOne(int chalNo);//상세페이지 조회 기능(단일)
}
