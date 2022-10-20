package com.kh.fourweeks.repository;

import com.kh.fourweeks.entity.ChalConfirmDto;

public interface ChalConfirmDao {
	int sequence();
	void write(ChalConfirmDto confirmDto);
	boolean update(ChalConfirmDto confirmDto);
	
}
