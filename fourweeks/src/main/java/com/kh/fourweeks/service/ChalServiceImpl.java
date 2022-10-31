package com.kh.fourweeks.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.fourweeks.entity.AttachmentDto;
import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.error.TargetNotFoundException;
import com.kh.fourweeks.repository.AdminDao;
import com.kh.fourweeks.repository.AttachmentDao;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.repository.ChalDao;
import com.kh.fourweeks.vo.NoticeVO;

@Service
public class ChalServiceImpl implements ChalService {
	@Autowired
	private ChalDao chalDao;
	
	@Autowired
	private ChalConfirmDao confirmDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private AdminDao adminDao;

	private final File dir = new File(System.getProperty("user.home") + "/upload");
	
	
	@Override
	public int create(ChalDto chalDto, MultipartFile attachment) throws IllegalStateException, IOException {
		//번호 미리 생성
		int chalNo = chalDao.chalSeq();
		chalDto.setChalNo(chalNo);
		
		//개설(등록)
		chalDao.insert(chalDto);
		
		//챌린지 개설 후 파일이 있다면 
		//해당 파일을 등록(attachment) & 저장 
		//& 연결(chal_img)
		//- 첨부파일이 없어도 리스트에는 1개의 객체가 들어있음 -> isEmpty()로 검사
		if(!attachment.isEmpty()) {
			//DB 등록
			int attachmentNo = attachmentDao.sequence();
			attachmentDao.insert(AttachmentDto.builder()
							.attachmentNo(attachmentNo)
							.attachmentName(attachment.getOriginalFilename())
							.attachmentType(attachment.getContentType())
							.attachmentSize(attachment.getSize())
							.build());
					
			//파일 저장
			File target = new File(dir, String.valueOf(attachmentNo));
			attachment.transferTo(target); //예외 전가
					
			//+ 연결 테이블에 연결 정보 저장(챌린지 번호, 첨부파일 번호)
			//chal_img에 insert
			chalDao.chalAttachment(chalNo, attachmentNo);
		}
		return chalNo;
	}

	@Override
	public int confirm(ChalConfirmDto confirmDto, MultipartFile attachment)
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
		if(!attachment.isEmpty()) {
			//DB 등록
			int attachmentNo = attachmentDao.sequence();
			attachmentDao.insert(AttachmentDto.builder()
							.attachmentNo(attachmentNo)
							.attachmentName(attachment.getOriginalFilename())
							.attachmentType(attachment.getContentType())
							.attachmentSize(attachment.getSize())
							.build());
					
			//파일 저장
			File target = new File(dir, String.valueOf(attachmentNo));
			attachment.transferTo(target); //예외 전가
					
			//+ 연결 테이블에 연결 정보 저장(인증글 번호, 첨부파일 번호, 유저아이디)
			//chal_img에 insert
			confirmDao.confirmAttachment(confirmNo, attachmentNo);	
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
	public int confirmEdit(ChalConfirmDto confirmDto, MultipartFile attachment)
			throws IllegalStateException, IOException {
		if(confirmDao.update(confirmDto)) {
			//인증글 수정 후 파일이 있다면 등록(attachment) & 저장 & 연결(confirm_img)
			if(!attachment.isEmpty()) {
				//기존 첨부파일이 있는지 검사, 있으면 테이블 데이터 & 실제 파일 삭제
				AttachmentDto attachDto = attachmentDao.confirmImgInfo(confirmDto.getConfirmNo());
				if(attachDto != null) {
					this.remove(confirmDto.getConfirmNo());
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
				//+ 연결 테이블에 연결 정보 저장(인증글 번호, 첨부파일 번호, 유저아이디)
				//chal_img에 insert
				confirmDao.confirmAttachment(confirmDto.getConfirmNo(), attachmentNo);	
			}
			//수정 후 첨부파일이 없는 경우
			//  1) 원래 없고, 새로 추가도 안한 경우
			//  2) 원래 있고, 변경을 안한 경우
			// 현 상태를 유지하면되므로 별도의 처리를 하지 않음
		} else {
			throw new TargetNotFoundException();
		}
		return confirmDto.getConfirmNo();
	}
	
	@Override
	public int noticeCreate(NoticeVO noticeDto, MultipartFile attachment) throws IllegalStateException, IOException {
		//번호 미리 생성
		int noticeNo = chalDao.noticeSeq();
		noticeDto.setNoticeNo(noticeNo);
		
		//개설(등록)
		adminDao.insert(noticeDto);
		
		//챌린지 개설 후 파일이 있다면 
		//해당 파일을 등록(attachment) & 저장 
		//& 연결(chal_img)
		//- 첨부파일이 없어도 리스트에는 1개의 객체가 들어있음 -> isEmpty()로 검사
		if(!attachment.isEmpty()) {
			//DB 등록
			int attachmentNo = attachmentDao.sequence();
			attachmentDao.insert(AttachmentDto.builder()
							.attachmentNo(attachmentNo)
							.attachmentName(attachment.getOriginalFilename())
							.attachmentType(attachment.getContentType())
							.attachmentSize(attachment.getSize())
							.build());
					
			//파일 저장
			File target = new File(dir, String.valueOf(attachmentNo));
			attachment.transferTo(target); //예외 전가
					
			//+ 연결 테이블에 연결 정보 저장(챌린지 번호, 첨부파일 번호)
			//chal_img에 insert
			chalDao.noticeAttachment(noticeNo, attachmentNo);
		}
		return noticeNo;
	}
	
	
	//공지글 이미지 조회
	@Override
	public int notice(NoticeVO noticeDto, MultipartFile attachment)
			throws IllegalStateException, IOException {
		//번호 미리 생성
		int noticeNo = confirmDao.noticeSequence();
		noticeDto.setNoticeNo(noticeNo);
		
		//인증글 등록
		adminDao.insert(noticeDto);
		
		//인증글 등록 후 파일이 있다면 
		//해당 파일을 등록(attachment) & 저장 
		//& 연결(confirm_img)
		//- 첨부파일이 없어도 리스트에는 1개의 객체가 들어있음 -> isEmpty()로 검사
		if(!attachment.isEmpty()) {
			//DB 등록
			int attachmentNo = attachmentDao.sequence();
			attachmentDao.insert(AttachmentDto.builder()
							.attachmentNo(attachmentNo)
							.attachmentName(attachment.getOriginalFilename())
							.attachmentType(attachment.getContentType())
							.attachmentSize(attachment.getSize())
							.build());
					
			//파일 저장
			File target = new File(dir, String.valueOf(attachmentNo));
			attachment.transferTo(target); //예외 전가
					
			//+ 연결 테이블에 연결 정보 저장(인증글 번호, 첨부파일 번호, 유저아이디)
			//chal_img에 insert
			confirmDao.noticeAttachment(noticeNo, attachmentNo);	
		}
		return noticeNo;
	}
	
	@Override
	public boolean removeNotice(int noticeNo) {
		//이미지 삭제하려는 인증글의 첨부파일 번호를 조회
		int attachmentNo = attachmentDao.selectNoticeImg(noticeNo);
		
		//첨부파일(attachment) 테이블 데이터 삭제
		boolean result = attachmentDao.delete(attachmentNo);
		//실제 파일 삭제
		String filename = String.valueOf(attachmentNo);
		File target = new File(dir, filename);
		target.delete();
		
		return result;	
	}
	
	@Override
	public int noticeEdit(NoticeVO noticeDto, MultipartFile attachment)
			throws IllegalStateException, IOException {
		if(confirmDao.updateNotice(noticeDto)) {
			//인증글 수정 후 파일이 있다면 등록(attachment) & 저장 & 연결(confirm_img)
			if(!attachment.isEmpty()) {
				//기존 첨부파일이 있는지 검사, 있으면 테이블 데이터 & 실제 파일 삭제
				AttachmentDto attachDto = attachmentDao.noticeImgInfo(noticeDto.getNoticeNo());
				if(attachDto != null) {
					this.removeNotice(noticeDto.getNoticeNo());
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
				//+ 연결 테이블에 연결 정보 저장(인증글 번호, 첨부파일 번호, 유저아이디)
				//chal_img에 insert
				confirmDao.noticeAttachment(noticeDto.getNoticeNo(), attachmentNo);	
			}
			//수정 후 첨부파일이 없는 경우
			//  1) 원래 없고, 새로 추가도 안한 경우
			//  2) 원래 있고, 변경을 안한 경우
			// 현 상태를 유지하면되므로 별도의 처리를 하지 않음
		} else {
			throw new TargetNotFoundException();
		}
		return noticeDto.getNoticeNo();
	}
}
