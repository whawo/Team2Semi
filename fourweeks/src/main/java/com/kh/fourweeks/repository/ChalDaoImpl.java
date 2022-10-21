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
import com.kh.fourweeks.entity.ChalUserDto;
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
	
	@Override
	public List<ChalListVO> selectList(ChalListSearchVO vo) {
		if(vo.isSearch()) {
			return search(vo);
		} else {
			return list(vo);
		} 
	}
	
	// 모집중: 시작임박일 순, 임박일이 동일하다면 최신 개설순
	@Override
	public List<ChalListVO> list(ChalListSearchVO vo) {
		String sql = "select * from("
				+ "select rownum rn, TMP.* from("
				+ "select * from ("
				+ "select TMP.* from ("
				+ "select "
				+ "chal_no, chal_title, "
				+ "chal_person, "
				+ "ceil(start_date-sysdate) d_day, "
				+ "to_char(start_date +27 +23/24 +59/(24*60) +59/(24*60*60), 'yyyy-mm-dd day') end_date, "
				+ "chal_topic "
				+ "from "
				+ "chal "
				+ "order by "
				+ "d_day asc, chal_no desc"
				+ ") TMP"
				+ ") where d_day > 0 and chal_person < 11"
				+ ") TMP"
				+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	
	@Override
	public List<ChalListVO> search(ChalListSearchVO vo) {
		String sql = "select * from("
						+ "select rownum rn, TMP.* from("
							+ "select * from ("
								+ "select TMP.* from ("
								+ "select chal_no, "
								+ "chal_title, "
								+ "chal_person, "
								+ "ceil(start_date-sysdate) d_day, "
								+ "to_char(start_date +28+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd day') end_date, "
								+ "chal_topic from chal where instr(#1, ?) > 0 order by d_day asc, chal_no desc)"
							+ "TMP) where d_day > 0 and chal_person < 11)"
							+ "TMP) where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword(), vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listMapper, param);
	}
	
	
	
	@Override
	public int count(ChalListSearchVO vo) {
		if (vo.isSearch()) {
			return searchCount(vo);
		} else {
			return listCount(vo);
		}
	}
	@Override
	public int listCount(ChalListSearchVO vo) {
		String sql = "select count(*) from chal";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	@Override
	public int searchCount(ChalListSearchVO vo) {
		String sql = "select count(*) from chal where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
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
	

	@Override
	public List<ParticipantDto> selectParticipant(int chalNo) {//조민재 추가
		
		String sql ="select * from participant where chal_no=?";
		Object[] param = {chalNo};
		return jdbcTemplate.query(sql, participantMapper,param);
	}

	@Override
	public List<ParticipantDto> selectParticipantOne(int chalNo, String userId) {//조민재 추가
		String sql ="select * from participant where chal_no= ? and user_id = ?";
		Object[] param = {chalNo, userId};
		return jdbcTemplate.query(sql, participantMapper,param);
	}
	


}
