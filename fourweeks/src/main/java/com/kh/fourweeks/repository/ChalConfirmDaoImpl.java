package com.kh.fourweeks.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.entity.NoticeDto;
import com.kh.fourweeks.vo.ChalConfirmVO;
import com.kh.fourweeks.vo.ConfirmAbleChalListVO;
import com.kh.fourweeks.vo.ConfirmDaysVO;

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
	public int noticeSequence() {
		String sql = "select notice_seq.nextval from dual";
		int noticeNo = jdbcTemplate.queryForObject(sql, int.class);
		return noticeNo;
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
		String sql = "update chal_confirm set "
				+ "confirm_title = ?, confirm_content = ?, "
				+ "modified_date = sysdate "
				+ "where confirm_no = ?";
		Object[] param = {confirmDto.getConfirmTitle(), 
				confirmDto.getConfirmContent(), confirmDto.getConfirmNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	@Override
	public boolean updateNotice(NoticeDto noticeDto) {
		String sql = "update notice set "
				+ "notice_title = ?, notice_content = ?, "
				+ "notice_modified = sysdate "
				+ "where notice_no = ?";
		Object[] param = {noticeDto.getNoticeTitle(), 
				noticeDto.getNoticeContent(), noticeDto.getNoticeNo()};
		return jdbcTemplate.update(sql, param) > 0;
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
	public void confirmAttachment(int confirmNo, int attachmentNo) {
		String sql = "insert into confirm_img(confirm_no, attachment_no) values(?, ?)";
		Object[] param = {confirmNo, attachmentNo};
		
		jdbcTemplate.update(sql, param);
	}
	
	@Override
	public void noticeAttachment(int noticeNo, int attachmentNo) {
		String sql = "insert into notice_img(notice_no, attachment_no) values(?, ?)";
		Object[] param = {noticeNo, attachmentNo};
		
		jdbcTemplate.update(sql, param);
	}
	
	@Override
	public ChalConfirmVO selectOne(int confirmNo) {
		String sql = "select distinct "
				+ "C.*, "
				+ "U.user_nick, "
				+ "count(R.reply_no) over(partition by C.confirm_no) reply_count "
				+ "from chal_confirm C "
				+ "left outer join chal_user U on C.user_id = U.user_id "
				+ "left outer join reply R on C.confirm_no = R.confirm_no "
				+ "where C.confirm_no = ?";
		Object[] param = {confirmNo};
		return jdbcTemplate.query(sql, listVOExtractor, param);
	}
	
	@Override
	public List<ChalConfirmVO> myConfirmList(ChalConfirmVO vo) {
		String sql = "select * from("
						+ "select TMP.*, rownum rn from("
							+ "select distinct "
								+ "C.*, "
								+ "U.user_nick, "
								+ "count(R.reply_no) over(partition by C.confirm_no) reply_count "
							+ "from chal_confirm C "
								+ "left outer join chal_user U on C.user_id = U.user_id "
								+ "left outer join reply R on C.confirm_no = R.confirm_no "
								+ "where C.chal_no = ? and U.user_id = ? "
								+ "order by C.confirm_no desc"
						+ ")TMP"
					+ ")where rn between ? and ?";
		Object[] param = {
				vo.getChalNo(), vo.getUserId(),
				vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listVOMapper, param);
	}
	
	@Override
	public int myConfirmCnt(int chalNo, String userId) {
		String sql = "select count(*) cnt "
				+ "from chal_confirm "
				+ "where chal_no = ? and user_id = ?";
		Object[] param = {chalNo, userId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public boolean delete(int confirmNo) {
		String sql = "delete chal_confirm where confirm_no = ?";
		Object[] param = {confirmNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	@Override
	public boolean updateReadcount(int confirmNo) {
		String sql = "update chal_confirm "
				+ "set confirm_read = confirm_read + 1 "
				+ "where confirm_no = ?"; 
		Object[] param = {confirmNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	@Override
	public ChalConfirmVO read(int confirmNo) {
		this.updateReadcount(confirmNo);
		return this.selectOne(confirmNo);
	}
	
	private RowMapper<ChalConfirmVO> listVOMapper = (rs, idx) -> {
		return ChalConfirmVO.builder()
				.confirmNo(rs.getInt("confirm_no"))
				.chalNo(rs.getInt("chal_no"))
				.userId(rs.getString("user_id"))
				.confirmTitle(rs.getString("confirm_title"))
				.confirmContent(rs.getString("confirm_content"))
				.confirmRead(rs.getInt("confirm_read"))
				.confirmLike(rs.getInt("confirm_like"))
				.confirmDate(rs.getDate("confirm_date"))
				.modifiedDate(rs.getDate("modified_date"))
				.userNick(rs.getString("user_nick"))
				.replyCount(rs.getInt("reply_count"))
				.build();
	};
	
	private ResultSetExtractor<ChalConfirmVO> listVOExtractor = (rs) -> {
		if(rs.next()) {			
			return ChalConfirmVO.builder()
					.confirmNo(rs.getInt("confirm_no"))
					.chalNo(rs.getInt("chal_no"))
					.userId(rs.getString("user_id"))
					.confirmTitle(rs.getString("confirm_title"))
					.confirmContent(rs.getString("confirm_content"))
					.confirmRead(rs.getInt("confirm_read"))
					.confirmLike(rs.getInt("confirm_like"))
					.confirmDate(rs.getDate("confirm_date"))
					.modifiedDate(rs.getDate("modified_date"))
					.userNick(rs.getString("user_nick"))
					.replyCount(rs.getInt("reply_count"))
					.build();
		} else {
			return null;
		}
	};
	
	@Override
	public List<ChalConfirmVO> allConfirmList(ChalConfirmVO vo) {
		String sql = "select * from("
						+ "select TMP.*, rownum rn from("
							+ "select distinct "
								+ "C.*, "
								+ "U.user_nick, "
								+ "count(R.reply_no) over(partition by C.confirm_no) reply_count "
							+ "from chal_confirm C "
								+ "left outer join chal_user U on C.user_id = U.user_id "
								+ "left outer join reply R on C.confirm_no = R.confirm_no "
							+ "where C.chal_no = ? order by C.confirm_no desc"
						+ ")TMP"
					+ ")where rn between ? and ?";
		Object[] param = {vo.getChalNo(), vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listVOMapper, param);
	}
	
	@Override
	public List<ChalConfirmVO> allConfirmTopN(ChalConfirmVO vo) {
		String sql = "select * from("
						+ "select TMP.*, rownum rn from ("
							+ "select distinct "
							+ "C.*, U.user_nick, count(R.reply_no) over(partition by C.confirm_no) reply_count "
							+ "from chal_confirm C "
							+ "left outer join chal_user U on C.user_id = U.user_id "
							+ "left outer join reply R on C.confirm_no = R.confirm_no "
							+ "where C.chal_no = ? "
							+ "order by C.confirm_no desc"
						+ ")TMP"
					+ ") where rn between ? and ?";
		Object[] param = {vo.getChalNo(), vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, listVOMapper, param);
	}
	
	@Override
	public int confirmCnt(int chalNo) {// nvl 추가
		String sql = "select nvl(count(*),0) cnt "
				+ "from chal_confirm "
				+ "where chal_no = ?";
		Object[] param = {chalNo};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	private RowMapper<ConfirmDaysVO> myConfirmDaysMapper = (rs, idx) -> {
		return ConfirmDaysVO.builder()
				.confirmDays(rs.getInt("confirm_days"))
				.build();
	};
	
	@Override
	public List<ConfirmDaysVO> myConfirmDays(int chalNo, String userId) {
		String sql = "select trunc(f.confirm_date - c.start_date + 1) confirm_days from chal_confirm f left outer join chal c on f.chal_no = c.chal_no where f.chal_no = ? and f.user_id = ?";
		Object[] param = {chalNo, userId};
		return jdbcTemplate.query(sql, myConfirmDaysMapper, param);
	}
}
