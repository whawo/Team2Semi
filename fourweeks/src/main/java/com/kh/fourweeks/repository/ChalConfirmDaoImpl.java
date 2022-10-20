package com.kh.fourweeks.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.ChalConfirmDto;

@Repository
public class ChalConfirmDaoImpl implements ChalConfirmDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int sequence() {
		String sql = "select confirm_seq.nextval from dual";
		int confirmNo = jdbcTemplate.queryForObject(sql, int.class);
		return confirmNo;
	}

	@Override
	public void write(ChalConfirmDto confirmDto) {
		String sql = "insert into chal_confirm("
				+ "confirm_no, chal_no, user_id"
				+ "confirm_title, confirm_content) "
				+ "values(?, ?, ?, ?, ?)";
		Object[] param = {
							confirmDto.getConfirmNo(),
							confirmDto.getChalNo(),
							confirmDto.getUserId(),
							confirmDto.getConfirmTitle(),
							confirmDto.getConfirmContent()};
		
		jdbcTemplate.update(sql, param);
	}

	@Override
	public boolean update(ChalConfirmDto confirmDto) {
		
		return false;
	}
	
	
}
