package com.kh.fourweeks.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.vo.ConfirmAbleChalListVO;

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
				+ "confirm_no, chal_no, user_id, "
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
	
	private RowMapper<ConfirmAbleChalListVO> mapper = (rs, idx) -> {
		return ConfirmAbleChalListVO.builder()
				.userId(rs.getString("user_id"))
				.chalNo(rs.getInt("chal_no"))
				.chalTitle(rs.getString("chal_title"))
				.howConfirm(rs.getString("how_confirm"))
				.build();
	};
	
	@Override
	public List<ConfirmAbleChalListVO> selectList(String userId) {
		String sql = "select U.user_id, P.chal_no, C.chal_title, C.how_confirm "
				+ "from chal_user U, participant P, chal C "
				+ "where U.user_id = P.user_id and P.chal_no = C.chal_no "
				+ "and ceil(C.start_date - sysdate) between -27 and 0 "
				+ "and U.user_id = ?";
		Object[] param = {userId};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public void confirmAttachment(int confirmNo, int attachmentNo, String userId) {
		String sql = "insert into confirm_img(confirm_no, attachment_no, user_id) values(?, ?, ?)";
		Object[] param = {confirmNo, attachmentNo, userId};
		
		jdbcTemplate.update(sql, param);
	}
	
}
