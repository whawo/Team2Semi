package com.kh.fourweeks.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.ReplyDto;
import com.kh.fourweeks.vo.ReplyListVO;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ReplyDto> mapper = (rs, idx) -> {
		return ReplyDto.builder()
				.replyNo(rs.getInt("reply_no"))
				.confirmNo(rs.getInt("confirm_no"))
				.userId(rs.getString("user_id"))
				.replyContent(rs.getString("reply_content"))
				.replyDate(rs.getDate("reply_date"))
				.replyUpdate(rs.getDate("reply_update"))
				.replyBlind(rs.getBoolean("reply_blind"))
				.build();
	};
	
	private RowMapper<ReplyListVO> listMapper = (rs, idx) -> {
		return ReplyListVO.builder()
				.replyNo(rs.getInt("reply_no"))
				.confirmNo(rs.getInt("confirm_no"))
				.userId(rs.getString("user_id"))
				.replyContent(rs.getString("reply_content"))
				.replyDate(rs.getDate("reply_date"))
				.replyUpdate(rs.getDate("reply_update"))
				.replyBlind(rs.getBoolean("reply_blind"))
				.userId(rs.getString("user_id"))
				.build();
	};
	
	private ResultSetExtractor<ReplyDto> extractor = (rs) -> {
		if(rs.next()) {
			return ReplyDto.builder()
					.replyNo(rs.getInt("reply_no"))
					.confirmNo(rs.getInt("confirm_no"))
					.userId(rs.getString("user_id"))
					.replyContent(rs.getString("reply_content"))
					.replyDate(rs.getDate("reply_date"))
					.replyUpdate(rs.getDate("reply_update"))
					.replyBlind(rs.getBoolean("reply_blind"))
					.build();
		} else {
			return null;
		}
	};
	
	@Override
	public void insert(ReplyDto replyDto) {
		String sql = "insert into reply("
				+ "reply_no, confirm_no, user_id, reply_content"
				+ ") values(reply_seq.nextval, ?, ?, ?)";
		Object[] param = {replyDto.getReplyNo(), replyDto.getConfirmNo(),
				replyDto.getUserId(), replyDto.getReplyContent()};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public List<ReplyListVO> selectList(int confirmNo) {
		String sql = "select * from reply where confirm_no = ?";
		Object[] param = {confirmNo};
		return jdbcTemplate.query(sql, listMapper, param);
	}

	@Override
	public ReplyDto selectOne(int replyNo) {
		String sql = "select * from reply where reply_no = ?";
		Object[] param = {replyNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public boolean update(ReplyDto replyDto) {
		String sql = "update reply set reply_content = ? where reply_no = ?";
		Object[] param = {replyDto.getReplyContent(), replyDto.getReplyNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public boolean delete(int replyNo) {
		String sql = "delete reply where reply_no = ?";
		Object[] param = {replyNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public boolean updateBlind(int replyNo, boolean blind) {
		String sql = "update reply set reply_blind = ? where reply_no = ?";
		String replyBlind = blind ? "Y" : null;
		Object[] param = {replyBlind, replyNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	
}
