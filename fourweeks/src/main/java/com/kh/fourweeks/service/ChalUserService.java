package com.kh.fourweeks.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.fourweeks.entity.ChalUserDto;

public interface ChalUserService {
	String myInfoEdit(ChalUserDto userDto, MultipartFile attachment) throws IllegalStateException, IOException; //유저 프로필 이미지 수정
	boolean remove(String userId); // 유저 프로필 이미지 첨부파일 + 데이터 삭제
}
