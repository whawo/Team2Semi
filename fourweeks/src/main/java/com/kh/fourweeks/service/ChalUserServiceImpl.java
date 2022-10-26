package com.kh.fourweeks.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fourweeks.entity.AttachmentDto;
import com.kh.fourweeks.entity.ChalUserDto;
import com.kh.fourweeks.error.TargetNotFoundException;
import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalUserDao;

@Service
public class ChalUserServiceImpl implements ChalUserService {
	@Autowired
	private ChalUserDao userDao;
	
	@Autowired
	private AttachmentDao attachmentDao;

	private final File dir = new File(System.getProperty("user.home") + "/upload");
	
	@Override
	public String myInfoEdit(ChalUserDto userDto, MultipartFile attachment) throws IllegalStateException, IOException {
		if(userDao.myInfoUpdate(userDto)) {
			//프로필 수정 후 파일이 있다면 등록(attachment) & 저장 & 연결(confirm_img)
			if(!attachment.isEmpty()) {
				//기존 첨부파일이 있는지 검사, 있으면 테이블 데이터 & 실제 파일 삭제
				AttachmentDto attachDto = attachmentDao.userImgInfo(userDto.getUserId());
				if(attachDto != null) {
					this.remove(userDto.getUserId());
				}
				int attachmentNo = attachmentDao.sequence();
				//DB 등록
				attachmentDao.insert(AttachmentDto.builder()
						.attachmentNo(attachmentNo)
						.attachmentName(attachment.getOriginalFilename())
						.attachmentType(attachment.getContentType())
						.attachmentSize(attachment.getSize())
						.build());
				
				//파일 저장
				File target = new File(dir, String.valueOf(attachmentNo));
				attachment.transferTo(target); //예외 전가
				//+ 연결 테이블에 연결 정보 저장(첨부파일 번호, 유저아이디)
				//user_img에 insert
				userDao.userAttachment(attachmentNo, userDto.getUserId());	
			}
			//수정 후 첨부파일이 없는 경우
			//  1) 원래 없고, 새로 추가도 안한 경우
			//  2) 원래 있고, 변경을 안한 경우
			// 현 상태를 유지하면되므로 별도의 처리를 하지 않음
		} else {
			throw new TargetNotFoundException();
		}
		return userDto.getUserId();
	}
	
	@Override
	public boolean remove(String userId) {
		//이미지 삭제하려는 유저 아이디의 첨부파일 번호를 조회
		AttachmentDto attachDto = attachmentDao.userImgInfo(userId);
		int attachmentNo = attachDto.getAttachmentNo();
		
		//첨부파일(attachment) 테이블 데이터 삭제
		boolean result = attachmentDao.delete(attachmentNo);
		//실제 파일 삭제
		String filename = String.valueOf(attachmentNo);
		File target = new File(dir, filename);
		target.delete();
		
		return result;	
	}
	
}
