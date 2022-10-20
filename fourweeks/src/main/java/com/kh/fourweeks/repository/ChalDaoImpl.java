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
	public void connectAttachment(int chalNo, int attachmentNo) {
		String sql = "insert into chal_img(chal_no, attachment_no) values(?, ?)";
		Object[] param = {chalNo, attachmentNo};
		
		jdbcTemplate.update(sql, param);
	}
  	private RowMapper<ChalDto> mapper = new RowMapper<ChalDto>() {
		@Override
		public ChalDto mapRow(ResultSet rs, int rowNum) throws SQLException {
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
		}
	};
	
	
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
	
	
	
	private RowMapper<ChalDetailVO> detailMapper = new RowMapper<ChalDetailVO>() {
		@Override
		public ChalDetailVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ChalDetailVO.builder()
					.endDate(rs.getString("end_date"))
					.dDay(rs.getString("d_day"))
					.chalNo(rs.getInt("chal_no"))
					.build();
		}
	};
	
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
				+ " to_char(start_date +28+ 23/24 + 59/(24*60) "
				+ "+ 59/(24*60*60), 'yyyy-mm-dd')"
				+ " end_date from chal where chal_no = ?";
		Object[] param = {chalNo};
		return jdbcTemplate.query(sql, detailExtractor, param);
	}
	
	
}
