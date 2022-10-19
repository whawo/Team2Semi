package com.kh.fourweeks.repository;

import com.kh.fourweeks.entity.ChalUserDto;

public interface ChalUserDao {
	void join(ChalUserDto chalUserDto);
	ChalUserDto selectOne(String userId);
	ChalUserDto selectNick(String userNick);
}
