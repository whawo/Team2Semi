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

import com.kh.fourweeks.vo.HalfStartVO;
import com.kh.fourweeks.vo.JoinedAndLeaveVO;
import com.kh.fourweeks.vo.MonthlyTopicVO;
import com.kh.fourweeks.vo.PartByTopicVO;
import com.kh.fourweeks.vo.StartEndTodayVO;
import com.kh.fourweeks.vo.UserJoinedVO;
import com.kh.fourweeks.vo.UserLeaveVO;

@Repository
public class ChalReportDaoImpl implements ChalReportDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private ResultSetExtractor<StartEndTodayVO> startExtractor = (rs) -> {
		if(rs.next()) {
			return StartEndTodayVO.builder()
					.scnt(rs.getInt("scnt"))
					.ecnt(rs.getInt("ecnt"))
					.build();
			
		} else {
			return null;
		}
	};
			
	@Override
	public StartEndTodayVO todayCnt() {
		String sql = "select "
						+ "(select count(*) scnt "
							+ "from chal c "
							+ "where to_char(start_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd')"
						+ ") scnt, "
						+ "(select count(*) ecnt "
							+ "from chal c "
							+ "where to_char(start_date + 27, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd')"
						+ ") ecnt "
					+ "from dual";
		return jdbcTemplate.query(sql, startExtractor);
	}

	
	private RowMapper<HalfStartVO> halfMapper = (rs, idx) -> {
			return HalfStartVO.builder()
					.startMonth(rs.getString("start_month"))
					.cnt(rs.getInt("cnt"))
					.build();
	};
	
	@Override
	public List<HalfStartVO> halfCnt() {
		String sql = "select "
						+ "to_char(b.dt, 'yyyy-mm') as start_month, "
						+ "nvl(sum(a.cnt), 0) cnt "
					+ "from ("
						+ "select "
							+ "to_char(start_date, 'YYYY-MM-DD') as start_date, "
							+ "count(*) cnt "
						+ "from chal "
						+ "where start_date "
							+ "between add_months(to_date(to_char(sysdate, 'yyyy-mm-dd'),'yyyy-mm-dd'),-5) "
							+ "and to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') group by start_date"
						+ ") a, ( "
						+ "select "
							+ "add_months(to_date(to_char(sysdate, 'yyyy-mm-dd'),'yyyy-mm-dd'),-5) + level - 1 as dt "
							+ "from dual "
								+ "connect by level <= (to_date(to_char(sysdate, 'yyyy-mm-dd'),'yyyy-mm-dd') "
								+ "- add_months(to_date(to_char(sysdate, 'yyyy-mm-dd'),'yyyy-mm-dd'),-5) + 1)"
						+ ") b "
						+ "where b.dt = a.start_date(+) "
						+ "group by to_char(b.dt, 'yyyy-mm') "
						+ "order by start_month asc";
		return jdbcTemplate.query(sql, halfMapper);
	}
	private RowMapper<MonthlyTopicVO> monthlyMapper = (rs, idx) -> {
		return MonthlyTopicVO.builder()
				.chalTopic(rs.getString("chal_topic"))
				.chalCnt(rs.getInt("chal_cnt"))
				.build();
	};
	
	@Override
	public List<MonthlyTopicVO> topicLastMonth() {
		String sql = "select t.chal_topic, nvl(c.cnt,0) chal_cnt "
					+ "from chal_topic t "
						+ "left outer join ("
							+ "select distinct chal_topic, count(chal_no) over(partition by chal_topic) cnt "
							+ "from chal "
							+ "where to_char(add_months(start_date, -1), 'yyyy-mm') = to_char(sysdate, 'yyyy-mm')"
						+ ") c "
						+ "on c.chal_topic = t.chal_topic "
						+ "order by chal_topic asc";
		return jdbcTemplate.query(sql, monthlyMapper);
	}
	
	@Override
	public List<MonthlyTopicVO> topicThisMonth() {
		String sql = "select t.chal_topic, nvl(c.cnt,0) chal_cnt "
				+ "from chal_topic t "
					+ "left outer join ("
						+ "select distinct chal_topic, count(chal_no) over(partition by chal_topic) cnt "
						+ "from chal "
						+ "where to_char(start_date, 'yyyy-mm') = to_char(sysdate, 'yyyy-mm')"
					+ ") c "
					+ "on c.chal_topic = t.chal_topic "
					+ "order by chal_topic asc";
		return jdbcTemplate.query(sql, monthlyMapper);
	}
  
	
	private RowMapper<UserJoinedVO> joinedMapper = (rs, idx) -> {
      return UserJoinedVO.builder()
          .joinDate(rs.getString("join_date"))
	      .userCount(rs.getInt("user_count"))
          .build();
	};
  
  	private RowMapper<UserLeaveVO> leaveMapper = (rs, idx) -> {
	  return UserLeaveVO.builder()
	          .leaveDate(rs.getString("leave_date"))
	          .leaveCount(rs.getInt("leave_count"))
	          .build();
  	};


  	private ResultSetExtractor<JoinedAndLeaveVO> joinedAndLeaveExtractor = (rs) -> {
		if(rs.next()) {
			return JoinedAndLeaveVO.builder()
					.joinedCnt(rs.getInt("joined_cnt"))
					.leaveCnt(rs.getInt("leave_cnt"))
					.build();
			
		} else {
			return null;
		}
	};
  
    @Override
    public List<UserJoinedVO> joinedCnt() {
      String sql = "select to_char(D.dt, 'yyyy-mm') as join_date, nvl(sum(J.cnt), 0) user_count from (select to_char(create_date, 'yyyy-mm-dd') as join_date, count(*) cnt from chal_user where create_date between to_date('2020-01-01', 'yyyy-mm-dd') and to_date('2022-12-31', 'yyyy-mm-dd') group by create_date) J, (select to_date('2022-01-01', 'yyyy-mm-dd') + level - 1 as dt from dual connect by level <= (sysdate - to_date('2022-01-01', 'yyyy-mm-dd') + 1)) D where D.dt = J.join_date(+) group by to_char(D.dt, 'yyyy-mm') order by to_char(D.dt, 'yyyy-mm')";
      return jdbcTemplate.query(sql, joinedMapper);
    }
    
    @Override
    public List<UserLeaveVO> leaveCnt() {
    	String sql = "select "
    			+ "to_char(D.dt, 'yyyy-mm') as leave_date, "
    			+ "nvl(sum(L.cnt), 0) leave_count "
    			+ "from ("
    			+ "select "
    			+ "to_char(leave_date, 'yyyy-mm-dd') as leave_date, "
    			+ "count(*) cnt "
    			+ "from "
    			+ "leave_count "
    			+ "where "
    			+ "leave_date between to_date('2020-01-01', 'yyyy-mm-dd') and to_date('2022-12-31', 'yyyy-mm-dd') group by leave_date) L, ("
    			+ "select "
    			+ "to_date('2022-01-01', 'yyyy-mm-dd') + level - 1 as dt "
    			+ "from "
    			+ "dual connect by level <= (sysdate - to_date('2022-01-01', 'yyyy-mm-dd') + 1)) D where D.dt = L.leave_date(+)"
    			+ "group by to_char(D.dt, 'yyyy-mm') order by to_char(D.dt, 'yyyy-mm')";
    	return jdbcTemplate.query(sql, leaveMapper);
    }
    
    @Override
    public JoinedAndLeaveVO todaysInfoOfUsers() {
    	String sql = "select"
    			+ "(select count(*) joined_cnt from chal_user where to_char(create_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd')) joined_cnt, "
    			+ "(select count(*) leave_cnt from leave_count where to_char(leave_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd')) leave_cnt "
    			+ "from dual";
    	return jdbcTemplate.query(sql, joinedAndLeaveExtractor);
    }
    
    private RowMapper<PartByTopicVO> partMapper = (rs, idx) -> {
		return PartByTopicVO.builder()
				.chalTopic(rs.getString("chal_topic"))
				.partCnt(rs.getInt("part_cnt"))
				.build();
	};
	
	@Override
	public List<PartByTopicVO> partAvgThisMonth() {
		String sql = "select t.chal_topic, nvl(c.cnt,0) part_cnt "
					+ "from chal_topic t "
					+ "left outer join ("
						+ "select distinct chal_topic, round(avg(chal_person) over(partition by chal_topic), 1) cnt "
						+ "from chal "
						+ "where to_char(start_date, 'yyyy-mm') = to_char(sysdate, 'yyyy-mm')) c "
					+ "on c.chal_topic = t.chal_topic "
					+ "order by chal_topic asc";
		return jdbcTemplate.query(sql, partMapper);
	}
	
	@Override
	public double todayConfirmRate() {
		String sql = "select round(confirm_cnt / part_cnt, 2) as rate "
					+ "from("
						+ "select "
						+ "(select count(*) "
						+ "from chal_confirm f "
						+ "inner join chal c on f.chal_no = c.chal_no "
						+ "where to_char(f.confirm_date, 'yyyy-mm-dd') = to_char(sysdate, 'yyyy-mm-dd')) confirm_cnt, "
						+ "(select count(*) "
						+ "from participant p "
						+ "inner join chal c on p.chal_no = c.chal_no "
						+ "where c.start_date between sysdate-27 and sysdate) part_cnt "
						+ "from dual)";
		return jdbcTemplate.queryForObject(sql, double.class);
	}
  }
