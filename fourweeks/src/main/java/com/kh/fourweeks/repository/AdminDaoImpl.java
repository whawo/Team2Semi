package com.kh.fourweeks.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.AdminDto;
import com.kh.fourweeks.entity.NoticeDto;
import com.kh.fourweeks.vo.ChalConfirmVO;

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
	
	private ResultSetExtractor<NoticeDto> NoticeOneextractor = (rs) -> {
		if(rs.next()) {			
			return NoticeDto.builder()
					.noticeNo(rs.getInt("notice_no"))
					.adminId(rs.getString("admin_id"))
					.noticeTitle(rs.getString("notice_title"))
					.noticeContent(rs.getString("notice_content"))
					.noticeTime(rs.getDate("notice_time"))
					.noticeModified(rs.getDate("notice_modified"))
					.build();
		} else {
			return null;
		}
	};
	
	
	private RowMapper<NoticeDto> NoticeMapper = (rs, idx) -> {
		return NoticeDto.builder()
				.noticeNo(rs.getInt("notice_no"))
				.adminId(rs.getString("admin_id"))
				.noticeTitle(rs.getString("notice_title"))
				.noticeContent(rs.getString("notice_content"))
				.noticeTime(rs.getDate("notice_time"))
				.noticeModified(rs.getDate("notice_modified"))
				.build();
	};

	
	
	@Override
	public NoticeDto selectNoticeOne(int noticeNo) {
		
		String sql = "select * from notice where notice_no = ?";
		Object[] param = {noticeNo};
		
		return jdbcTemplate.query(sql, NoticeOneextractor ,param);
	}

	@Override
	public List<NoticeDto> selectNoticeAll() {
		
		String sql = "select * from notice order by notice_no desc";
		
		return jdbcTemplate.query(sql, NoticeMapper);
	}
	

	@Override
	public List<NoticeDto> selectNoticeAll(String keyword) {

		String sql = "select * from notice "
				+ "where instr(notice_title, ?) > 0";
            Object[] param = {keyword};
      return jdbcTemplate.query(sql, NoticeMapper, param);
	}

	@Override
	public void insert(NoticeDto dto) {
		
		String sql = "insert into"
				+ " notice(notice_no, admin_id,"
				+ " notice_title, notice_content, notice_time, notice_modified)"
				+ " values(?, ?, ?, ?, sysdate, null)";
		
		Object[] param = {dto.getNoticeNo(), dto.getAdminId(), dto.getNoticeTitle(),
				          dto.getNoticeContent()};
		
		jdbcTemplate.update(sql, param);
	}

	@Override
	public boolean update(NoticeDto dto) {
		
		
		String sql ="update notice set notice_title = ?,"
				+ "notice_content = ?, notice_modified = sysdate"
				+ " where notice_no = ?";
		Object[] param = {
				dto.getNoticeTitle(), dto.getNoticeContent(), dto.getNoticeNo()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	
}
