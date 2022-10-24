package com.kh.fourweeks.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fourweeks.entity.AttachmentDto;
import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.error.TargetNotFoundException;
import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.repository.ChalDao;

@Service
public class ChalServiceImpl implements ChalService {
	@Autowired
	private ChalDao chalDao;
	
	@Autowired
	private ChalConfirmDao confirmDao;
	
	@Autowired
	private AttachmentDao attachmentDao;

	private final File dir = new File(System.getProperty("user.home") + "/upload");
	
	
	@Override
	public int create(ChalDto chalDto, List<MultipartFile> attachment) throws IllegalStateException, IOException {
		//번호 미리 생성
		int chalNo = chalDao.chalSeq();
		chalDto.setChalNo(chalNo);
		
		//개설(등록)
		chalDao.insert(chalDto);
		
		//챌린지 개설 후 파일이 있다면 
		//해당 파일을 등록(attachment) & 저장 
		//& 연결(chal_img)
		//- 첨부파일이 없어도 리스트에는 1개의 객체가 들어있음 -> isEmpty()로 검사
		for(MultipartFile file : attachment) {
			if(!file.isEmpty()) {
				//DB 등록
				int attachmentNo = attachmentDao.sequence();
				attachmentDao.insert(AttachmentDto.builder()
								.attachmentNo(attachmentNo)
								.attachmentName(file.getOriginalFilename())
								.attachmentType(file.getContentType())
								.attachmentSize(file.getSize())
								.build());
						
				//파일 저장
				File target = new File(dir, String.valueOf(attachmentNo));
				file.transferTo(target); //예외 전가
						
				//+ 연결 테이블에 연결 정보 저장(챌린지 번호, 첨부파일 번호)
				//chal_img에 insert
				chalDao.chalAttachment(chalNo, attachmentNo);
			}
		}
		return chalNo;
	}

	@Override
	public int confirm(ChalConfirmDto confirmDto, List<MultipartFile> attachment)
			throws IllegalStateException, IOException {
		//번호 미리 생성
		int confirmNo = confirmDao.sequence();
		confirmDto.setConfirmNo(confirmNo);
		
		//인증글 등록
		confirmDao.write(confirmDto);
		
		//인증글 등록 후 파일이 있다면 
		//해당 파일을 등록(attachment) & 저장 
		//& 연결(confirm_img)
		//- 첨부파일이 없어도 리스트에는 1개의 객체가 들어있음 -> isEmpty()로 검사
		for(MultipartFile file : attachment) {
			if(!file.isEmpty()) {
				//DB 등록
				int attachmentNo = attachmentDao.sequence();
				attachmentDao.insert(AttachmentDto.builder()
								.attachmentNo(attachmentNo)
								.attachmentName(file.getOriginalFilename())
								.attachmentType(file.getContentType())
								.attachmentSize(file.getSize())
								.build());
						
				//파일 저장
				File target = new File(dir, String.valueOf(attachmentNo));
				file.transferTo(target); //예외 전가
						
				//+ 연결 테이블에 연결 정보 저장(인증글 번호, 첨부파일 번호, 유저아이디)
				//chal_img에 insert
				confirmDao.confirmAttachment(confirmNo, attachmentNo, confirmDto.getUserId());
			}
		}
		return confirmNo;
	}

	@Override
	public boolean remove(int confirmNo) {
		//이미지 삭제하려는 인증글의 첨부파일 번호를 조회
		int attachmentNo = attachmentDao.selectConfirmImg(confirmNo);
		
		//첨부파일(attachment) 테이블 데이터 삭제
		boolean result = attachmentDao.delete(attachmentNo);
		//실제 파일 삭제
		String filename = String.valueOf(attachmentNo);
		File target = new File(dir, filename);
		target.delete();
		
		return result;	
	}
	
	@Override
	public int confirmEdit(ChalConfirmDto confirmDto, List<MultipartFile> attachment)
			throws IllegalStateException, IOException {
		if(confirmDao.update(confirmDto)) {
			//인증글 수정 후 파일이 있다면 등록(attachment) & 저장 & 연결(confirm_img)
			for(MultipartFile file : attachment) {
				if(!file.isEmpty()) {
					//기존 첨부파일이 있는지 검사, 있으면 테이블 데이터 & 실제 파일 삭제
					AttachmentDto attachDto = attachmentDao.confirmImgInfo(confirmDto.getConfirmNo());
					if(attachDto != null) {
						this.remove(confirmDto.getConfirmNo());
					}
					int attachmentNo = attachmentDao.sequence();
					//DB 등록
					attachmentDao.insert(AttachmentDto.builder()
							.attachmentNo(attachmentNo)
							.attachmentName(file.getOriginalFilename())
							.attachmentType(file.getContentType())
							.attachmentSize(file.getSize())
							.build());
					
					//파일 저장
					File target = new File(dir, String.valueOf(attachmentNo));
					file.transferTo(target); //예외 전가
					System.out.println("confirmNo = " + confirmDto.getConfirmNo() + ", attachmentNo = "+ attachmentNo + ", userId = "+confirmDto.getUserId());;;
					//+ 연결 테이블에 연결 정보 저장(인증글 번호, 첨부파일 번호, 유저아이디)
					//chal_img에 insert
					confirmDao.confirmAttachment(confirmDto.getConfirmNo(), attachmentNo, confirmDto.getUserId());	
				}else {//수정 후 첨부파일이 없다면
					//기존 첨부파일이 있는지 검사, 있으면 테이블 데이터 & 실제 파일 삭제
					AttachmentDto attachDto = attachmentDao.confirmImgInfo(confirmDto.getConfirmNo());
					if(attachDto != null) {
						this.remove(confirmDto.getConfirmNo());
					}
				}
			}
		}else {
			throw new TargetNotFoundException();
		}
		
		return confirmDto.getConfirmNo();
	}
}
