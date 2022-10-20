package com.kh.fourweeks.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.ChalDto;
@Repository
public class ChalDaoImpl implements ChalDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;



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
	
}
