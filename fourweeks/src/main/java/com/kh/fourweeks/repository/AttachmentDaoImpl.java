package com.kh.fourweeks.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.AttachmentDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int attach_seq() {
		String sql = "select attachment_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public void insert(AttachmentDto attachmentDto) {
		String sql = "insert into attachment("
				+ "attachment_no, attachment_name, "
				+ "attachment_type, attachment_size) "
				+ "values(?,?,?,?,?)";
		Object[] param = {attachmentDto.getAttachmentNo(),
				attachmentDto.getAttachmentName(),
				attachmentDto.getAttachmentType(),
				attachmentDto.getAttachmentSize()};
		
		jdbcTemplate.update(sql, param);
	}
	
	private RowMapper<AttachmentDto> mapper = (rs, idx) -> {
		return AttachmentDto.builder()
				.attachmentNo(rs.getInt("attachement_no"))
				.attachmentName(rs.getString("attachement_name"))
				.attachmentType(rs.getString("attachement_type"))
				.attachmentSize(rs.getLong("attachement_size"))
				.build();
	};
	
	private ResultSetExtractor<AttachmentDto> extractor = (rs) -> {
		if(rs.next()) {
			return AttachmentDto.builder()
					.attachmentNo(rs.getInt("attachement_no"))
					.attachmentName(rs.getString("attachement_name"))
					.attachmentType(rs.getString("attachement_type"))
					.attachmentSize(rs.getLong("attachement_size"))
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
	
	
}
