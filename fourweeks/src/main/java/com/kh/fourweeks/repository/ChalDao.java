package com.kh.fourweeks.repository;

import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ParticipantDto;

public interface ChalDao {
	int chalSeq(); //챌린지 개설 시퀀스
	void insert(ChalDto chalDto); //챌린지 개설
	void addParticipant(ParticipantDto partDto); //참가자에 개설자 자동 추가
}
