package com.kh.fourweeks.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private ResultSetExtractor<AdminDto> extractor = (rs) -> {
		if(rs.next()) {			
			return AdminDto.builder()
					.adminId(rs.getString("admin_id"))
					.adminPw(rs.getString("admin_pw"))
					.adminAdd(rs.getDate("admin_add"))
					.adminLogin(rs.getDate("admin_login"))
					.build();
		} else {
			return null;
		}
	};
	
	@Override
	public AdminDto selectOne(String adminId) {
		String sql = "select * from chal_admin where admin_id = ?";
		Object[] param = {adminId};
		return jdbcTemplate.query(sql, extractor, param );
	}
	
	@Override
	public void updateLoginTime(String adminId) {
		String sql = "update chal_admin set admin_login = sysdate where admin_id = ?";
		Object[] param = {adminId};
		jdbcTemplate.update(sql, param);
	}
}
