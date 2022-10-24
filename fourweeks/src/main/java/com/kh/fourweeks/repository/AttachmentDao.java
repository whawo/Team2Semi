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
	
	int selectConfirmImg(int confirmNo); //인증글 번호로 첨부파일 번호 조회
	AttachmentDto confirmImgInfo(int confirmNo); //인증글 번호로 첨부파일 정보 조회
	int selectChalImg(int chalNo); //챌린지 번호로 첨부파일 번호 조회
}
