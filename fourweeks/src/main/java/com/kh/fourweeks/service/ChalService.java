package com.kh.fourweeks.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.NoticeDto;

public interface ChalService {
	int create(ChalDto chalDto, MultipartFile attachment) 
			throws IllegalStateException, IOException; //챌린지 썸네일(챌린지 개설)
	
	int confirm(ChalConfirmDto confirmDto, MultipartFile attachment) 
			throws IllegalStateException, IOException; //인증샷 (챌린지 인증)
	
	boolean remove(int confirmNo); //인증글 수정 > 인증샷 삭제
	
	int confirmEdit(ChalConfirmDto confirmDto, MultipartFile attachment)
			throws IllegalStateException, IOException; //인증글 수정+인증샷;
	
	
	int notice(NoticeDto noticeDto, MultipartFile attachment) 
			throws IllegalStateException, IOException;

	int noticeCreate(NoticeDto noticeDto, MultipartFile attachment) throws IllegalStateException, IOException;

	boolean removeNotice(int noticeNo);

	int noticeEdit(NoticeDto noticeDto, MultipartFile attachment) throws IllegalStateException, IOException;
}
