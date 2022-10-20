package com.kh.fourweeks.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.fourweeks.entity.ChalDto;

public interface ChalService {
	int create(ChalDto chalDto, List<MultipartFile> attachment) 
			throws IllegalStateException, IOException;
}
