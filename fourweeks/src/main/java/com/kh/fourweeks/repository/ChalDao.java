package com.kh.fourweeks.repository;

import com.kh.fourweeks.entity.ChalDto;

public interface ChalDao {
	int chalSeq(); //챌린지 개설 시퀀스
	void insert(ChalDto chalDto); //챌린지 개설
}
