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
	
		// 미사용
//  	private RowMapper<ChalDto> mapper = new RowMapper<ChalDto>() {
//		@Override
//		public ChalDto mapRow(ResultSet rs, int rowNum) throws SQLException {
//			return ChalDto.builder()
//					.chalNo(rs.getInt("chal_no"))
//					.userId(rs.getString("user_id"))
//					.chalTitle(rs.getString("chal_title"))
//					.chalContent(rs.getString("chal_content"))
//					.howConfirm(rs.getString("how_confirm"))
//					.chalPerson(rs.getInt("chal_person"))
//					.chalTopic(rs.getString("chal_topic"))
//					.startDate(rs.getDate("start_date"))
//					.build();
//		}
//	};
	
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
						.build();
			}else {
				return null;
			}
			
		}
	};
	
	@Override
	public ChalDetailVO selectEndDday(int chalNo) {
		String sql ="select chal_no, ceil(start_date-sysdate) d_day,"
				+ " to_char(start_date +27+ 23/24 + 59/(24*60) "
				+ "+ 59/(24*60*60), 'yyyy-mm-dd')"
				+ " end_date from chal where chal_no = ?";
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
	
	// 메인화면
	//	- 챌린지 참가자 많은 8개
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
						+ "chal_person < 11"
					+ "order by "
						+ "chal_person asc, "
						+ "chal_no desc"
					+ ")TMP"
					+ ") where rn between 1 and 8";
		return jdbcTemplate.query(sql, listMapper);
	}
	
	// 모집중
	//	- 출력할 화면 판정 메소드
	@Override
	public List<ChalListVO> selectList(ChalListSearchVO vo) {
		
		if (vo.isSearch() == 1) { // 전체리스트
			return list(vo);
		} else if(vo.isSearch() == 2) { // 타입(전체) 키워드 없이 검색 버튼 누를시
			return list(vo);
		} else if(vo.isSearch() == 3){ // 타입(전체)+키워드 검색시
			return searchForAllType(vo);
		} else if(vo.isSearch() == 4){ // 타입(주제)+키워드 없이 검색 버튼 누를시 : 메인페이지 메소드와 겹침
			return searchForOnlyType(vo);
		}	else { // 타입(주제) + 키워드 검색시
			return search(vo);
		}
	}
	
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
								+ "ceil(start_date-sysdate) > 0"
							+ "and "
								+ "chal_person < 11"
							+ "order by "
								+ "d_day asc, "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
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
								+ "instr(chal_topic, #1) > 0 "
							+ "and "
								+ "ceil(start_date-sysdate) > 0 "
							+ "and "
								+ "chal_person < 11 "
							+ "order by "
								+ "d_day asc, "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword(), vo.startRow(), vo.endRow()};
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
								+ "instr(#1, ?) > 0 "
							+ "and "
								+ "ceil(start_date-sysdate) > 0 "
							+ "and "
								+ "chal_person < 11"
							+ "order by "
								+ "d_day asc, "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
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
								+ "instr(chal_topic, #1) > 0 "
							+ "and "
								+ "ceil(start_date-sysdate) > 0 "
							+ "and "
								+ "chal_person < 11 "
							+ "order by "
								+ "d_day asc, "
								+ "chal_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.startRow(), vo.endRow()};
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
		String sql = "select count(*) from chal where ceil(start_date-sysdate) > 0 and chal_person < 11";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	@Override
	public int searchCount(ChalListSearchVO vo) {
		String sql = "select count(*) from chal where instr(chal_topic, #1) > 0 and instr(chal_title, ?) > 0 and ceil(start_date-sysdate) > 0 and chal_person < 11";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	@Override
	public int searchForAllTypeCount(ChalListSearchVO vo) {
		String sql = "select count(*) from chal where instr(#1, ?) > 0 and ceil(start_date-sysdate) > 0 and chal_person < 11";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	@Override
	public int searchForOnlyTypeCount(ChalListSearchVO vo) {
		String sql = "select count(*) from chal where instr(chal_topic, #1) > 0 and ceil(start_date-sysdate) > 0 and chal_person < 11";
		sql = sql.replace("#1", vo.getType());
		return jdbcTemplate.queryForObject(sql, int.class);
	}
}
