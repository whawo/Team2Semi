package com.kh.fourweeks.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.AttachmentDto;
import com.kh.fourweeks.entity.ChalDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int sequence() {
		String sql = "select attachment_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public void insert(AttachmentDto attachmentDto) {
		String sql = "insert into attachment("
				+ "attachment_no, attachment_name, "
				+ "attachment_type, attachment_size) "
				+ "values(?,?,?,?)";
		Object[] param = {attachmentDto.getAttachmentNo(),
				attachmentDto.getAttachmentName(),
				attachmentDto.getAttachmentType(),
				attachmentDto.getAttachmentSize()};
		
		jdbcTemplate.update(sql, param);
	}
	
	private RowMapper<AttachmentDto> mapper = (rs, idx) -> {
		return AttachmentDto.builder()
				.attachmentNo(rs.getInt("attachment_no"))
				.attachmentName(rs.getString("attachment_name"))
				.attachmentType(rs.getString("attachment_type"))
				.attachmentSize(rs.getLong("attachment_size"))
				.build();
	};
	
	private ResultSetExtractor<AttachmentDto> extractor = (rs) -> {
		if(rs.next()) {
			return AttachmentDto.builder()
					.attachmentNo(rs.getInt("attachment_no"))
					.attachmentName(rs.getString("attachment_name"))
					.attachmentType(rs.getString("attachment_type"))
					.attachmentSize(rs.getLong("attachment_size"))
					.build();
		}else {
			return null;
		}
	};
	
	private ResultSetExtractor<AttachmentDto> detailExtractor = (rs) -> {//챌린지 상세 이미지 조회
		if(rs.next()) {
			return AttachmentDto.builder()
					.attachmentNo(rs.getInt("attachment_no"))
					.attachmentName(rs.getString("attachment_name"))
					.attachmentType(rs.getString("attachment_type"))
					.attachmentSize(rs.getLong("attachment_size"))
					.attachmentTime(rs.getDate("attachment_time"))
					.chalNo(rs.getInt("chal_no"))
					.build();
		}else {
			return null;
		}
	};
	
	
	@Override
	public List<AttachmentDto> selectList() {
		String sql = "select * from attachment";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public AttachmentDto selectOne(int attachmentNo) {
		String sql = "select * from attachment where attachment_no = ?";
		Object[] param = {attachmentNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public boolean delete(int attachmentNo) {
		String sql = "delete attachment where attachment_no = ?";
		Object[] param = {attachmentNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public AttachmentDto selectDetail(int chalNo) {//단일 챌린지 썸네일 조회 기능(view)
		String sql ="select * from chal_img_detail_view where chal_no = ?";
		Object[] param = {chalNo};
		return jdbcTemplate.query(sql, detailExtractor, param);	
		
		}

	@Override
	public int selectConfirmImg(int confirmNo) {
		String sql = "select attachment_no from confirm_img_view where confirm_no = ?";
		Object[] param = {confirmNo};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	@Override
	public AttachmentDto confirmImgInfo(int confirmNo) {
		String sql = "select * from confirm_info_view where confirm_no = ?";
		Object[] param = {confirmNo};
		return jdbcTemplate.query(sql, extractor, param);
	}
}
