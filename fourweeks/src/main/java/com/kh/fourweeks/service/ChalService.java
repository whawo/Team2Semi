package com.kh.fourweeks.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.entity.ChalDto;

public interface ChalService {
	int create(ChalDto chalDto, List<MultipartFile> attachment) 
			throws IllegalStateException, IOException; //챌린지 썸네일(챌린지 개설)
	
	int confirm(ChalConfirmDto confirmDto, List<MultipartFile> attachment) 
			throws IllegalStateException, IOException; //인증샷 (챌린지 인증)
}
