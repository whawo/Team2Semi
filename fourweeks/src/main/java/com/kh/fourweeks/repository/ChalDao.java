package com.kh.fourweeks.repository;
import java.util.List;

import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.entity.ParticipantDto;
import com.kh.fourweeks.vo.ChalDetailVO;
import com.kh.fourweeks.vo.ChalListSearchVO;
import com.kh.fourweeks.vo.ChalListVO;

public interface ChalDao {
	int chalSeq(); //챌린지 개설 시퀀스
	void insert(ChalDto chalDto); //챌린지 개설
	void addParticipant(ParticipantDto partDto); //참가자에 개설자 자동 추가

	void insertParticipant(ParticipantDto partDto);// 참가하기 메소드
	
	//첨부파일 관련 메소드
	void chalAttachment(int chalNo, int attachmentNo); //chal_img 테이블에 첨부파일 정보 연결
    
	//조회 관련 메소드
	ChalDto selectOne(int chalNo);//상세페이지 조회 기능(단일)
	ChalDetailVO selectEndDday(int chalNo);//종료일, 남은일수 조회 메소드
	ChalMyDetailDto selectMy(String userId, int chalNo);//내 인증글 조회기능
	
	// 메인페이지 참가자 많은 순 조회 메소드
	List<ChalListVO> listOfLargePerson(ChalListSearchVO vo);
	
	// 챌린지 참가자 상세 조회 메소드
	List<ChalMyDetailDto> selectAllDetail(int chalNo);


    // 모집중 조회+검색
  	List<ChalListVO> selectList(ChalListSearchVO vo);
  	List<ChalListVO> list(ChalListSearchVO vo); 
  	List<ChalListVO> beNotInKeywordList(ChalListSearchVO vo); 
  	List<ChalListVO> search(ChalListSearchVO vo); 
  	List<ChalListVO> searchForAllType(ChalListSearchVO vo); 
  	List<ChalListVO> searchForOnlyType(ChalListSearchVO vo); 
  	
  	
    int count(ChalListSearchVO vo);
    int searchCount(ChalListSearchVO vo); 
    int listCount(ChalListSearchVO vo);
    int searchForAllTypeCount(ChalListSearchVO vo);
    int searchForOnlyTypeCount(ChalListSearchVO vo);
	
    // 참가자 인원수 증가
    public boolean updateChalPerson(int chalNo);
    

  List<ParticipantDto> selectParticipant(int chalNo);//참가여부 확인 추가(민재)
  ParticipantDto selectParticipantOne(int chalNo, String userId);//참가여부 확인 테스트용 추가(민재)
	
	
}
