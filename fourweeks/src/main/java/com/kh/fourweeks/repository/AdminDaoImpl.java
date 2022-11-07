package com.kh.fourweeks.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.AdminDto;
import com.kh.fourweeks.entity.NoticeDto;
import com.kh.fourweeks.vo.NoticeListSearchVO;
import com.kh.fourweeks.vo.NoticeVO;

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
	
	private ResultSetExtractor<NoticeVO> NoticeOneextractor = (rs) -> {
		if(rs.next()) {			
			return NoticeVO.builder()
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
	
	
	private RowMapper<NoticeVO> NoticeMapper = (rs, idx) -> {
		return NoticeVO.builder()
				.noticeNo(rs.getInt("notice_no"))
				.adminId(rs.getString("admin_id"))
				.noticeTitle(rs.getString("notice_title"))
				.noticeContent(rs.getString("notice_content"))
				.noticeTime(rs.getDate("notice_time"))
				.noticeModified(rs.getDate("notice_modified"))
				.build();
	};

	
	
	@Override
	public NoticeVO selectNoticeOne(int noticeNo) {
		
		String sql = "select * from notice where notice_no = ?";
		Object[] param = {noticeNo};
		
		return jdbcTemplate.query(sql, NoticeOneextractor ,param);
	}
	
	
	
	@Override
	public void insert(NoticeVO dto) {
		
		String sql = "insert into"
				+ " notice(notice_no, admin_id,"
				+ " notice_title, notice_content, notice_time, notice_modified)"
				+ " values(?, ?, ?, ?, sysdate, null)";
		
		Object[] param = {dto.getNoticeNo(), dto.getAdminId(), dto.getNoticeTitle(),
				          dto.getNoticeContent()};
		
		jdbcTemplate.update(sql, param);
	}

	@Override
	public boolean update(NoticeVO dto) {
		
		
		String sql ="update notice set notice_title = ?,"
				+ " notice_content = ?, notice_modified = sysdate"
				+ " where notice_no = ?";
		Object[] param = {
				dto.getNoticeTitle(), dto.getNoticeContent(), dto.getNoticeNo()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	public List<NoticeVO> selectList(NoticeListSearchVO vo) {
	    if(vo.isSearch()) {//검색이라면
	    	return selectNoticeSearch(vo);
	    }else {
	    	return selectNoticeAll(vo);
	    }
	}

	@Override
	public List<NoticeVO> selectNoticeSearch(NoticeListSearchVO vo) {
		
		String sql ="select * from (select TMP.*, rownum rn from"
				+ " (select * from notice where instr(notice_title, ?) > 0)"
				+ " TMP)"
				+ " where rn between ? and ?";
            Object[] param = {vo.getKeyword(),vo.startRow(), vo.endRow() };
		
		return jdbcTemplate.query(sql, NoticeMapper,param);
	}
	
	

	@Override
	public List<NoticeVO> selectNoticeAll(NoticeListSearchVO vo) {

		String sql = "select * from (select TMP.*, rownum rn from"
				+ " (select * from notice order by notice_no desc)TMP)"
				+ " where rn between ? and ?";
            Object[] param = {vo.startRow(), vo.endRow()};
      return jdbcTemplate.query(sql, NoticeMapper, param);
	}


	@Override
	public int count(NoticeListSearchVO vo) {
		if(vo.isSearch()) {
			return searchCount(vo);
		}else {
			return listCount(vo);
		}
	}

	@Override
	public int searchCount(NoticeListSearchVO vo) {
		String sql = "select count(*) "
				+ "from notice "
				+ "where instr(notice_title, ?) > 0";
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public int listCount(NoticeListSearchVO vo) {
		String sql = "select count(*) from notice";
		return jdbcTemplate.queryForObject(sql, int.class);

	}
	
	@Override
	public List<NoticeVO> selectNoticeTopN(int begin, int end) {
		String sql = "select * from(select TMP.*, rownum rn from (select * from notice order by notice_no desc)TMP) where rn between ? and ?";
		Object[] param = {begin, end};
		
		return jdbcTemplate.query(sql, NoticeMapper, param);
	}
	
}
