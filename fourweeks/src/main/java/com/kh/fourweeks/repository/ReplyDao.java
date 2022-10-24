package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.ReplyDto;
import com.kh.fourweeks.vo.ReplyListVO;

public interface ReplyDao {
	void insert(ReplyDto replyDto);
	List<ReplyListVO> selectList(int confirmNo);
	ReplyDto selectOne(int replyNo);
	boolean update(ReplyDto replyDto);
	boolean delete(int replyNo);
	boolean updateBlind(int replyNo, boolean blind);
}
