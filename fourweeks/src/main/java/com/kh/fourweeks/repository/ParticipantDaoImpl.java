package com.kh.fourweeks.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.ParticipantDto;

@Repository
public class ParticipantDaoImpl implements ParticipantDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private ResultSetExtractor<ParticipantDto> extractor = new ResultSetExtractor<ParticipantDto>() {
		@Override
		public ParticipantDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				ParticipantDto participantDto = new ParticipantDto();
				participantDto.setChalNo(rs.getInt("chal_no"));
				participantDto.setParticipantJoin(rs.getDate("participant_join"));
				participantDto.setParticipantNo(rs.getInt("participant_no"));
				participantDto.setUserId(rs.getString("user_id"));
				return participantDto;
			} else {
				return null;
			}
		}
	};
	
	@Override
	public ParticipantDto selectOne(int chalNo, String userId) {
		String sql = "select * from participant where chal_no = ? and user_id = ?";
		Object[] param = {chalNo, userId};
		return jdbcTemplate.query(sql, extractor, param);
	}
}
