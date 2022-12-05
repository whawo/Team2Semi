package com.kh.fourweeks.repository;
import java.util.List;

import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.entity.ParticipantDto;
import com.kh.fourweeks.vo.ChalDetailVO;
import com.kh.fourweeks.vo.ChalListSearchRecruitedVO;
import com.kh.fourweeks.vo.ChalListSearchVO;
import com.kh.fourweeks.vo.ChalListVO;
import com.kh.fourweeks.vo.ChalProgressSuccessVO;
import com.kh.fourweeks.vo.ChalProgressVO;
import com.kh.fourweeks.vo.ParticipantVO;

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

	//챌린지 참가자 진행률 조회 메소드
	List<ChalProgressVO> selectAllProgress(int chalNo);
	
	//챌린지 성공 참가자 진행률 조회 메소드
	 List<ChalProgressSuccessVO> selectSuccessAllProgress(int chalNo);
	//챌린지 실패 참가자 진행률 조회 메소드
	 List<ChalProgressSuccessVO> selectFailAllProgress(int chalNo);
	 
	//챌린지 완벽 참가자 진행률 조회 메소드
     List<ChalProgressSuccessVO> selectPerfectAllProgress(int chalNo);
    // 모집중 조회+검색
  	List<ChalListVO> selectList(ChalListSearchVO vo); // 유저의 반응에 따라 메소드를 판정
  	List<ChalListVO> list(ChalListSearchVO vo); // keyword, type, recruited가 null일때 실행됨
  	List<ChalListVO> beNotInKeywordList(ChalListSearchVO vo); // type은 chal_title을 선택, keyword는 공백으로 검색시 실행
  	List<ChalListVO> search(ChalListSearchVO vo); // type,keyword를 선택 후 검색하면 실행됨
  	List<ChalListVO> searchForAllType(ChalListSearchVO vo); // 전체 검색시 실행됨
  	List<ChalListVO> searchForOnlyType(ChalListSearchVO vo);  // 타입만 선택 후 검색시 실행됨
    int count(ChalListSearchVO vo); // 검색한 페이지를 판정
    int searchCount(ChalListSearchVO vo); // 주제와 검색어로 검색시 페이지수 조회
    int listCount(ChalListSearchVO vo); // 전체검색시 페이지수 조회
    int searchForAllTypeCount(ChalListSearchVO vo); // 전체검색시 페이지수 조회
    int searchForOnlyTypeCount(ChalListSearchVO vo); // 타입만 선택 후 검색시 해당 페이지수 조회
	
    // 전체 조회+검색 (Recruited == 전체페이지를 뜻함) (모집중 메소드와 나열 순서 상동)
    List<ChalListVO> selectListRecruited(ChalListSearchRecruitedVO vo);
  	List<ChalListVO> listRecruited(ChalListSearchRecruitedVO vo); 
  	List<ChalListVO> beNotInKeywordListRecruited(ChalListSearchRecruitedVO vo); 
  	List<ChalListVO> searchRecruited(ChalListSearchRecruitedVO vo); 
  	List<ChalListVO> searchForAllTypeRecruited(ChalListSearchRecruitedVO vo); 
  	List<ChalListVO> searchForOnlyTypeRecruited(ChalListSearchRecruitedVO vo);
    int countRecruited(ChalListSearchRecruitedVO vo);
    int searchCountRecruited(ChalListSearchRecruitedVO vo); 
    int listCountRecruited(ChalListSearchRecruitedVO vo);
    int searchForAllTypeCountRecruited(ChalListSearchRecruitedVO vo);
    int searchForOnlyTypeCountRecruited(ChalListSearchRecruitedVO vo);
  	
    // 참가자 인원수 증가
    public boolean updateChalPerson(int chalNo);
    List<ParticipantVO> selectParticipant(int chalNo);//참가여부 확인 추가(민재)
    ParticipantDto selectParticipantOne(int chalNo, String userId);//참가여부 확인 테스트용 추가(민재)
	int noticeSeq();
	void noticeAttachment(int noticeNo, int attachmentNo);
	
    //탈퇴 시, 내가 개설하고 나만 참가 중인(참가자=1명) 챌린지 삭제
    void deleteChalOnlyMe (String userId); 

}
