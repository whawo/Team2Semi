package com.kh.fourweeks.repository;

import com.kh.fourweeks.entity.ParticipantDto;

public interface ParticipantDao {
	ParticipantDto selectOne(int chalNo, String userId);
}
