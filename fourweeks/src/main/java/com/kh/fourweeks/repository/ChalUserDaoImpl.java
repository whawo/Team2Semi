package com.kh.fourweeks.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.ChalUserDto;

@Repository
public class ChalUserDaoImpl implements ChalUserDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void join(ChalUserDto chalUserDto) {
		String sql = "insert into "
				+ "chal_user"
					+ "(user_id, user_nick, user_pw, user_email, create_date) "
				+ "values "
					+ "(?, ?, ?, ?, sysdate)";
		Object[] param = {
				chalUserDto.getUserId(),
				chalUserDto.getUserNick(),
				chalUserDto.getUserPw(),
				chalUserDto.getUserEmail()};
		jdbcTemplate.update(sql, param);
	}
	
	private ResultSetExtractor<ChalUserDto> extractor = new ResultSetExtractor<ChalUserDto>() {
		@Override
		public ChalUserDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				ChalUserDto chalUserDto = new ChalUserDto();
				chalUserDto.setUserId(rs.getString("user_id"));
				chalUserDto.setUserNick(rs.getString("user_nick"));
				chalUserDto.setUserPw(rs.getString("user_pw"));
				chalUserDto.setUserEmail(rs.getString("user_email"));
				chalUserDto.setCreateDate(rs.getDate("create_date"));
				chalUserDto.setModifiedDate(rs.getDate("modified_date"));
				chalUserDto.setLoginDate(rs.getDate("login_date"));
				return chalUserDto;
			} else {
				return null;
			}
		}
	};
	// 회원 단일 조회 & 아이디 중복 검사를 위한 메소드(비동기)
	@Override
	public ChalUserDto selectOne(String userId) {
		String sql = "select * from chal_user where user_id = ?";
		Object[] param = {userId};
		return jdbcTemplate.query(sql, extractor, param);
	}
	// 닉네임 중복검사를 위한 메소드(비동기)
	@Override
	public ChalUserDto selectNick(String userNick) {
		String sql = "select * from chal_user where user_nick = ?";
		Object[] param = {userNick};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	@Override
	public boolean updateLoginTime(String userId) {
		String sql = "update "
						+ "chal_user "
					+ "set "
						+ "login_date = sysdate "
					+ "where "
						+ "user_id = ?";
		Object[] param = {userId};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	
	
	
	
	
}
