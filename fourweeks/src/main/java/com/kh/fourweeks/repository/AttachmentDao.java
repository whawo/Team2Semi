package com.kh.fourweeks.repository;

import java.util.List;

import com.kh.fourweeks.entity.AttachmentDto;

public interface AttachmentDao {
	int sequence();
	void insert(AttachmentDto attachementDto);
	List<AttachmentDto> selectList();
	AttachmentDto selectOne(int attachmentNo);
	boolean delete(int attachmentNo);
	AttachmentDto selectDetail(int attachmentNo);
}
