package com.kh.fourweeks.repository;

import com.kh.fourweeks.entity.UserConfirmLikeDto;

public interface UserConfirmLikeDao {
	void insert(UserConfirmLikeDto dto);
	void delete(UserConfirmLikeDto dto);
	boolean check(UserConfirmLikeDto dto);
	int count(int confirmNo);
	void refresh(int confirmNo);
}
