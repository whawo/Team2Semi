package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.vo.ConfirmAbleChalListVO;

public interface ChalConfirmDao {
	int sequence();
	void write(ChalConfirmDto confirmDto);
	boolean update(ChalConfirmDto confirmDto);

	List<ConfirmAbleChalListVO> selectList(String userId);
}
