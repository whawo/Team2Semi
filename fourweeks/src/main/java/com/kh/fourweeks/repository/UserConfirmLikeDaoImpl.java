package com.kh.fourweeks.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.UserConfirmLikeDto;

@Repository
public class UserConfirmLikeDaoImpl implements UserConfirmLikeDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(UserConfirmLikeDto dto) {
		String sql = "insert into confirm_like(user_id, confirm_no) values(?, ?)";
		Object[] param = {dto.getUserId(), dto.getConfirmNo()};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public void delete(UserConfirmLikeDto dto) {
		String sql = "delete confirm_like where user_id = ? and confirm_no = ?";
		Object[] param = {dto.getUserId(), dto.getConfirmNo()};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public boolean check(UserConfirmLikeDto dto) {
		String sql = "select count(*) from confirm_like where user_id = ? and confirm_no = ?";
		Object[] param = {dto.getUserId(), dto.getConfirmNo()};
		int count = jdbcTemplate.queryForObject(sql, int.class, param);
		return count == 1;
	}

	@Override
	public int count(int confirmNo) {
		String sql = "select count(*) from confirm_like where confirm_no = ?";
		Object[] param = {confirmNo};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public void refresh(int confirmNo) {
		String sql = "update chal_confirm set confirm_like = ("
						+ "select count(*) from confirm_like where confirm_no = ?"
					+ ") where confirm_no = ?";
		Object[] param = {confirmNo, confirmNo};
		jdbcTemplate.update(sql, param);
	}
	
	

}
