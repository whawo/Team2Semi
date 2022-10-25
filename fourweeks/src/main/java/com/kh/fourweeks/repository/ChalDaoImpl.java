package com.kh.fourweeks.repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.entity.ChalMyDetailDto;
import com.kh.fourweeks.entity.ParticipantDto;
import com.kh.fourweeks.vo.ChalDetailVO;
import com.kh.fourweeks.vo.ChalListSearchVO;
import com.kh.fourweeks.vo.ChalListVO;
@Repository

public class ChalDaoImpl implements ChalDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int chalSeq() {
		String sql = "select chal_seq.nextval from dual";
		int chalNo = jdbcTemplate.queryForObject(sql, int.class);
		return chalNo;
	}
	
	@Override
	public void insert(ChalDto chalDto) {
		String sql = "insert into chal("
				+ "chal_no, user_id, chal_title, "
				+ "chal_content, how_confirm, chal_topic, start_date) "
				+ "values(?, ?, ?, ?, ?, ?, ?)";
		Object[] param = {	chalDto.getChalNo(),
							chalDto.getUserId(), chalDto.getChalTitle(), 
							chalDto.getChalContent(), chalDto.getHowConfirm(), 
							chalDto.getChalTopic(), chalDto.getStartDate()};
		
		jdbcTemplate.update(sql, param);
	}

	@Override
	public void addParticipant(ParticipantDto partDto) {
		String sql = "insert into participant(participant_no, chal_no, user_id) values(participant_seq.nextval, ?, ?)";
		Object[] param = {
							partDto.getChalNo(),
							partDto.getUserId()};
		
		jdbcTemplate.update(sql, param);
	}

	@Override
	public void chalAttachment(int chalNo, int attachmentNo) {
		String sql = "insert into chal_img(chal_no, attachment_no) values(?, ?)";
		Object[] param = {chalNo, attachmentNo};
		
		jdbcTemplate.update(sql, param);
	}
	
	private ResultSetExtractor<ChalDto> extractor = new ResultSetExtractor<ChalDto>() {
		@Override
		public ChalDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return ChalDto.builder()
						.chalNo(rs.getInt("chal_no"))
						.userId(rs.getString("user_id"))
						.chalTitle(rs.getString("chal_title"))
						.chalContent(rs.getString("chal_content"))
						.howConfirm(rs.getString("how_confirm"))
						.chalPerson(rs.getInt("chal_person"))
						.chalTopic(rs.getString("chal_topic"))
						.startDate(rs.getDate("start_date"))
						.build();
			}else {
				return null;
			}
		}
	};
	
	@Override
	public ChalDto selectOne(int chalNo) {
		String sql = "select * from chal where chal_no = ?";
		Object[] param = {chalNo};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	// 미사용
//	private RowMapper<ChalDetailVO> detailMapper = new RowMapper<ChalDetailVO>() {
//		@Override
//		public ChalDetailVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//			return ChalDetailVO.builder()
//					.endDate(rs.getString("end_date"))
//					.dDay(rs.getString("d_day"))
//					.chalNo(rs.getInt("chal_no"))
//					.build();
//		}
//	};
	
	private ResultSetExtractor<ChalDetailVO> detailExtractor = new ResultSetExtractor<ChalDetailVO>() {
		
		@Override
		public ChalDetailVO extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return  ChalDetailVO.builder()
						.endDate(rs.getString("end_date"))
						.dDay(rs.getString("d_day"))
						.chalNo(rs.getInt("chal_no"))
						.endDday(rs.getString("end_d_day"))
						.build();
			}else {
				return null;
			}
			
		}
	};
	
	@Override
	public ChalDetailVO selectEndDday(int chalNo) {
		String sql ="select "
				+ "chal_no, "
				+ "ceil(start_date-sysdate) d_day, "
				+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd') end_date, "
				+ "trunc((start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60))-sysdate) end_d_day "
				+ "from chal where chal_no = ?";
		Object[] param = {chalNo};
		return jdbcTemplate.query(sql, detailExtractor, param);
	}

	// 시작
	private RowMapper<ChalListVO> listMapper = new RowMapper<ChalListVO>() {
		@Override
		public ChalListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ChalListVO.builder()
					.chalNo(rs.getInt("chal_no"))
					.chalPerson(rs.getInt("chal_person"))
					.chalTitle(rs.getString("chal_title"))
					.chalTopic(rs.getString("chal_topic"))
					.dDay(rs.getString("d_day"))
					.endDate(rs.getString("end_date"))
					.rn(rs.getInt("rn"))
				.build();
		}
	};

	// 메인화면 추천 챌린지 조회 메소드
	@Override
	public List<ChalListVO> listOfLargePerson(ChalListSearchVO vo) {
		String sql = "select * from ("
				+ "select TMP.*, rownum rn from ("
					+ "select "
						+ "chal_no, "
						+ "chal_title,"
						+ "chal_topic,"
						+ "chal_person, "
						+ "ceil(start_date-sysdate) d_day, "
						+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
					+ "from "
						+ "chal "
					+ "where "
						+ "ceil(start_date-sysdate) > 0"
					+ "and "
						+ "chal_person < 11 "
					+ "order by "
						+ "chal_person desc, "
						+ "chal_no desc"
					+ ")TMP"
					+ ") where rn between 1 and 8";
		return jdbcTemplate.query(sql, listMapper);
	}
	
	// 모집중 챌린지 조회 판정 메소드
	@Override
	public List<ChalListVO> selectList(ChalListSearchVO vo) {
		if (vo.isSearch() == 1) { // 전체리스트
			return list(vo);
		} else if(vo.isSearch() == 2) { // 타입(전체) 키워드 없이 검색 버튼 누를시
			return beNotInKeywordList(vo);
		} else if(vo.isSearch() == 3){ // 타입(전체)+키워드 검색시
			return searchForAllType(vo);
		} else if(vo.isSearch() == 4){ // 타입(주제)+키워드 없이 검색 버튼 누를시 : 메인페이지 메소드와 겹침
			return searchForOnlyType(vo);
		}	else { // 타입(주제) + 키워드 검색시
			return search(vo);
		}
	}
	// 전체 챌린지 조회 판정 메소드
	public List<ChalListVO> selectListRecruited(ChalListSearchVO vo) {
		if (vo.isSearch() == 1) { // 전체리스트
			return listRecruited(vo);
		} else if(vo.isSearch() == 2) { // 타입(전체) 키워드 없이 검색 버튼 누를시
			return beNotInKeywordListRecruited(vo);
		} else if(vo.isSearch() == 3){ // 타입(전체)+키워드 검색시
			return searchForAllTypeRecruited(vo);
		} else if(vo.isSearch() == 4){ // 타입(주제)+키워드 없이 검색 버튼 누를시 : 메인페이지 메소드와 겹침
			return searchForOnlyTypeRecruited(vo);
		}	else { // 타입(주제) + 키워드 검색시
			return searchRecruited(vo);
		}
	}
	
	// 모집중 메소드
	@Override
	public List<ChalListVO> list(ChalListSearchVO vo) {
		String sql = "select * from ("
						+ "select TMP.*, rownum rn from ("
							+ "select "
								+ "chal_no, "
								+ "chal_title,"
								+ "chal_topic,"
								+ "chal_person, "
								+ "ceil(start_date-sysdate) d_day, "
								+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
							+ "from "
								+ "chal "
							+ "where "
								+ "ceil(start_date-sysdate) > -1 "
							+ "and "
								+ "chal_person < 11 "
							+ "order by "
								+ "d_day asc, "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	@Override
	public List<ChalListVO> beNotInKeywordList(ChalListSearchVO vo) {
		String sql = "select * from ("
				+ "select TMP.*, rownum rn from ("
					+ "select "
						+ "chal_no, "
						+ "chal_title,"
						+ "chal_topic,"
						+ "chal_person, "
						+ "ceil(start_date-sysdate) d_day, "
						+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
					+ "from "
						+ "chal "
					+ "where "
						+ "ceil(start_date-sysdate) > -1 "
					+ "and "
						+ "chal_person < 11 "
					+ "order by "
						+ "#1, "
						+ "chal_no desc"
					+ ")TMP"
					+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getAlignType());
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}

	@Override
	public List<ChalListVO> search(ChalListSearchVO vo) {
		String sql = "select * from ("
						+ "select TMP.*, rownum rn from ("
							+ "select "
								+ "chal_no, "
								+ "chal_title, "
								+ "chal_topic, "
								+ "chal_person, "
								+ "ceil(start_date-sysdate) d_day, "
								+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
							+ "from "
								+ "chal "
							+ "where "
								+ "instr(chal_title, ?) > 0 "
							+ "and "
								+ "instr(chal_topic, ?) > 0 "
							+ "and "
								+ "ceil(start_date-sysdate) > -1 "
							+ "and "
								+ "chal_person < 11 "
							+ "order by "
								+ "#1, "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getAlignType());
		Object[] param = {vo.getKeyword(),vo.getType(), vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	
	@Override
	public List<ChalListVO> searchForAllType(ChalListSearchVO vo) {
		String sql = "select * from ("
						+ "select TMP.*, rownum rn from ("
							+ "select "
								+ "chal_no, "
								+ "chal_title,"
								+ "chal_topic,"
								+ "chal_person, "
								+ "ceil(start_date-sysdate) d_day, "
								+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
							+ "from "
								+ "chal "
							+ "where "
								+ "instr(chal_title, ?) > 0 "
							+ "and "
								+ "ceil(start_date-sysdate) > -1 "
							+ "and "
								+ "chal_person < 11"
							+ "order by "
								+ "#1, "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getAlignType());
		Object[] param = {vo.getKeyword(), vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	@Override
	public List<ChalListVO> searchForOnlyType(ChalListSearchVO vo) {
		String sql = "select * from ("
						+ "select TMP.*, rownum rn from ("
							+ "select "
								+ "chal_no, "
								+ "chal_title, "
								+ "chal_topic, "
								+ "chal_person, "
								+ "ceil(start_date-sysdate) d_day, "
								+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
							+ "from "
								+ "chal "
							+ "where "
								+ "instr(chal_topic, ?) > 0 "
							+ "and "
								+ "ceil(start_date-sysdate) > -1 "
							+ "and "
								+ "chal_person < 11 "
							+ "order by "
								+ "#1, "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getAlignType());
		Object[] param = {vo.getType(), vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	
	// 전체 챌린지 조회
	@Override
	public List<ChalListVO> listRecruited(ChalListSearchVO vo) {
		String sql = "select * from ("
						+ "select TMP.*, rownum rn from ("
							+ "select "
								+ "chal_no, "
								+ "chal_title,"
								+ "chal_topic,"
								+ "chal_person, "
								+ "ceil(start_date-sysdate) d_day, "
								+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
							+ "from "
								+ "chal "
							+ "where "
								+ "chal_person < 11 "
							+ "order by "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	@Override
	public List<ChalListVO> beNotInKeywordListRecruited(ChalListSearchVO vo) {
		String sql = "select * from ("
				+ "select TMP.*, rownum rn from ("
					+ "select "
						+ "chal_no, "
						+ "chal_title,"
						+ "chal_topic,"
						+ "chal_person, "
						+ "ceil(start_date-sysdate) d_day, "
						+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
					+ "from "
						+ "chal "
					+ "where "
						+ "chal_person < 11 "
					+ "order by "
						+ "chal_no desc"
					+ ")TMP"
					+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}

	@Override
	public List<ChalListVO> searchRecruited(ChalListSearchVO vo) {
		String sql = "select * from ("
						+ "select TMP.*, rownum rn from ("
							+ "select "
								+ "chal_no, "
								+ "chal_title, "
								+ "chal_topic, "
								+ "chal_person, "
								+ "ceil(start_date-sysdate) d_day, "
								+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
							+ "from "
								+ "chal "
							+ "where "
								+ "instr(chal_title, ?) > 0 "
							+ "and "
								+ "instr(chal_topic, ?) > 0 "
							+ "and "
								+ "chal_person < 11 "
							+ "order by "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		Object[] param = {vo.getKeyword(),vo.getType(), vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	
	@Override
	public List<ChalListVO> searchForAllTypeRecruited(ChalListSearchVO vo) {
		String sql = "select * from ("
						+ "select TMP.*, rownum rn from ("
							+ "select "
								+ "chal_no, "
								+ "chal_title,"
								+ "chal_topic,"
								+ "chal_person, "
								+ "ceil(start_date-sysdate) d_day, "
								+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
							+ "from "
								+ "chal "
							+ "where "
								+ "chal_person < 11"
							+ "order by "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		Object[] param = {vo.getKeyword(), vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	@Override
	public List<ChalListVO> searchForOnlyTypeRecruited(ChalListSearchVO vo) {
		String sql = "select * from ("
						+ "select TMP.*, rownum rn from ("
							+ "select "
								+ "chal_no, "
								+ "chal_title, "
								+ "chal_topic, "
								+ "chal_person, "
								+ "ceil(start_date-sysdate) d_day, "
								+ "to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date "
							+ "from "
								+ "chal "
							+ "where "
								+ "instr(chal_topic, ?) > 0 "
							+ "and "
								+ "chal_person < 11 "
							+ "order by "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		Object[] param = {vo.getType(), vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	
	@Override
	public int count(ChalListSearchVO vo) {
		if (vo.isSearch() == 1) {
			return listCount(vo);
		} else if(vo.isSearch() == 2) {
			return listCount(vo);
		} else if(vo.isSearch() == 3) {
			return searchForAllTypeCount(vo);
		} else if(vo.isSearch() == 4) {
			return searchForOnlyTypeCount(vo);
		} else {
			return searchCount(vo);
		}
	}
	
	@Override
	public int listCount(ChalListSearchVO vo) {
		String sql = "select count(*) from chal where ceil(start_date-sysdate) > -1 and chal_person < 11";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	@Override
	public int searchCount(ChalListSearchVO vo) {
		String sql = "select count(*) from chal where instr(chal_topic, ?) > 0 and instr(chal_title, ?) > 0 and ceil(start_date-sysdate) > -1 and chal_person < 11";
		Object[] param = {vo.getType(), vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public int searchForAllTypeCount(ChalListSearchVO vo) {
		String sql = "select count(*) from chal where instr(chal_title, ?) > 0 and ceil(start_date-sysdate) > -1 and chal_person < 11";
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	@Override
	public int searchForOnlyTypeCount(ChalListSearchVO vo) {
		String sql = "select count(*) from chal where instr(chal_topic, ?) > 0 and ceil(start_date-sysdate) > -1 and chal_person < 11";
		Object[] param = {vo.getType()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	
	
	private RowMapper<ParticipantDto> participantMapper = new RowMapper<ParticipantDto>() {
		@Override
		public ParticipantDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			return ParticipantDto.builder()
					.participantNo(rs.getInt("participant_no"))
					.chalNo(rs.getInt("chal_no"))
					.userId(rs.getString("user_id"))
					.participantJoin(rs.getDate("participant_join"))
				.build();
		}
	};
   private ResultSetExtractor<ParticipantDto> participantExtractor = new ResultSetExtractor<ParticipantDto>() {
	      @Override
	      public ParticipantDto extractData(ResultSet rs) throws SQLException, DataAccessException {
	         if(rs.next()) {
	            return ParticipantDto.builder()
	                  .participantNo(rs.getInt("participant_no"))
	                  .chalNo(rs.getInt("chal_no"))
	                  .userId(rs.getString("user_id"))
	                  .participantJoin(rs.getDate("participant_join"))
	               .build();
	         } else {
	            return null;
	         }
	      }
	   };
	@Override
	public List<ParticipantDto> selectParticipant(int chalNo) {//조민재 추가
		
		String sql ="select * from participant where chal_no=?";
		Object[] param = {chalNo};
		return jdbcTemplate.query(sql, participantMapper,param);
	}
	
	

	@Override
	public ParticipantDto selectParticipantOne(int chalNo, String userId) {//조민재 추가
		String sql ="select * from participant where chal_no= ? and user_id = ?";
		Object[] param = {chalNo, userId};
		return jdbcTemplate.query(sql, participantExtractor, param);
	}

	private ResultSetExtractor<ChalMyDetailDto> myDetailExtractor = new ResultSetExtractor<ChalMyDetailDto>() {
		
		@Override
		public ChalMyDetailDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return  ChalMyDetailDto.builder()
						.chalTitle(rs.getString("chal_title"))
						.chalContent(rs.getString("chal_content"))
						.startDate(rs.getDate("start_date"))
						.participantNo(rs.getInt("participant_no"))
						.chalNo(rs.getInt("chal_no"))
						.userId(rs.getString("user_id"))
						.participantJoin(rs.getDate("participant_join"))
						.build();
			}else {
				return null;
			}
			
		}
	};
	
	private RowMapper<ChalMyDetailDto> allDetailMapper = new RowMapper<ChalMyDetailDto>() {
		@Override
		public ChalMyDetailDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return  ChalMyDetailDto.builder()
					.chalTitle(rs.getString("chal_title"))
					.chalContent(rs.getString("chal_content"))
					.startDate(rs.getDate("start_date"))
					.participantNo(rs.getInt("participant_no"))
					.chalNo(rs.getInt("chal_no"))
					.userId(rs.getString("user_id"))
					.participantJoin(rs.getDate("participant_join"))
					.build();
		}
	};
	
	
	@Override
	public ChalMyDetailDto selectMy(String userId, int chalNo) {
		String sql = "select * from my_chal_detail where user_id = ? and chal_no = ?";
		Object[] param = {userId, chalNo};
		return jdbcTemplate.query(sql, myDetailExtractor ,param);
	}
	
	
	@Override
	public List<ChalMyDetailDto> selectAllDetail(int chalNo) {
		String sql = "select * from my_chal_detail where chal_no = ?";
		Object[] param = {chalNo};
		return jdbcTemplate.query(sql, allDetailMapper, param);
	}

	@Override
	public void insertParticipant(ParticipantDto partDto) {
		//참가자 참가 메소드
		String sql ="insert into participant(participant_no, chal_no,"
				+ " user_id, participant_join)"
				+ " values(participant_seq.nextval,"
				+ " ?, ?, sysdate)";
		Object[] param = {partDto.getChalNo(), 
				          partDto.getUserId()};
		 jdbcTemplate.update(sql, param);
	}

	@Override
	public boolean updateChalPerson(int chalNo) {//참가자 증가 메소드

		String sql ="update chal set chal_person = chal_person +1 where chal_no= ?";
		
		Object[] param = {chalNo};
		
		
		return jdbcTemplate.update(sql, param)>0;
	}
	
	
}
