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

import com.kh.fourweeks.entity.ChalCreateMyDto;
import com.kh.fourweeks.entity.ChalMyDetailDto;
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
	
	@Override
	public boolean myInfoUpdate(ChalUserDto userDto) {
		String sql = "update chal_user set user_nick = ?, user_email = ? where user_id = ?";
		Object[] param = {userDto.getUserNick(),
				userDto.getUserEmail(),
				userDto.getUserId()};
		return jdbcTemplate.update(sql, param) > 0;
	}

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
					.chalTopic(rs.getString("chal_topic"))
					.endDate(rs.getString("end_date"))
					.dDay(rs.getString("d_day"))
					.endDDay(rs.getString("end_d_day"))
					.cnt(rs.getInt("cnt"))
					.build();
		}
	};

	@Override
	public void userAttachment(int attachmentNo, String userId) {
		String sql = "insert into user_img(attachment_no, user_id) values(?, ?)";
		Object[] param = {attachmentNo, userId};
		
		jdbcTemplate.update(sql, param);
	}
	
	@Override
	public List<ChalMyDetailDto> selectAllMyDetail(String userId) {
		String sql ="select * from (select M.*, ceil(start_date-sysdate) d_day,"
				+ " to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd') end_date,"
				+ " trunc((start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60))-sysdate) end_d_day,"
				+ " nvl(C.cnt, 0) cnt from my_chal_detail M left outer join (select count(*) cnt,"
				+ " chal_no from chal_confirm where user_id = ? group by chal_no) C"
				+ " on M.chal_no = C.chal_no where user_id = ?)"
				+ " where end_d_day > 0";
		Object[] param = {userId, userId};
		return jdbcTemplate.query(sql, allDetailMapper, param);
	}
	
	
	
	@Override
	public List<ChalMyDetailDto> selectEndAllMyDetail(String userId) {
		String sql ="select * from (select M.*, ceil(start_date-sysdate) d_day,"
				+ " to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd') end_date,"
				+ " trunc((start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60))-sysdate) end_d_day,"
				+ " nvl(C.cnt, 0) cnt from my_chal_detail M left outer join (select count(*) cnt,"
				+ " chal_no from chal_confirm where user_id = ? group by chal_no) C"
				+ " on M.chal_no = C.chal_no where user_id = ?)"
				+ " where end_d_day < 0";
		Object[] param = {userId, userId};
		return jdbcTemplate.query(sql, allDetailMapper, param);
	}
	
	
	
	@Override
	public boolean updatePw(String newPw, String userId) {
		String sql = "update chal_user set user_pw = ? where user_id = ?";
		Object[] param = {newPw, userId};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	
	private RowMapper<ChalCreateMyDto> createDetailMapper = new RowMapper<ChalCreateMyDto>() {
		@Override
		public ChalCreateMyDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return  ChalCreateMyDto.builder()
					.chalTitle(rs.getString("chal_title"))
					.chalContent(rs.getString("chal_content"))
					.startDate(rs.getDate("start_date"))
					.chalNo(rs.getInt("chal_no"))
					.userId(rs.getString("user_id"))
					.chalTopic(rs.getString("chal_topic"))
					.endDate(rs.getString("end_date"))
					.dDay(rs.getString("d_day"))
					.endDDay(rs.getString("end_d_day"))
					.cnt(rs.getInt("cnt"))
					.build();
		}
	};
	
	
	
	
	@Override
	public List<ChalCreateMyDto> selectCreateAllMyDetail(String userId) {
		String sql ="select * from (select C.*,ceil(start_date-sysdate) d_day,"
				+ " to_char(start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60), 'yyyy-mm-dd') end_date,"
				+ " trunc((start_date +27+ 23/24 + 59/(24*60) + 59/(24*60*60))-sysdate) end_d_day,"
				+ " nvl(T.cnt, 0) cnt from chal C left outer join"
				+ " (select count(*) cnt, chal_no from chal_confirm where user_id = ? group by chal_no)"
				+ " T on C.chal_no = T.chal_no where C.user_id = ?)where end_d_day >0";
		
		Object[] param = {userId, userId};
		
		return jdbcTemplate.query(sql, createDetailMapper, param);
	}
}
