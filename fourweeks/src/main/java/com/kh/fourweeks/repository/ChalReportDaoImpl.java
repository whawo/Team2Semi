package com.kh.fourweeks.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.vo.HalfStartVO;
import com.kh.fourweeks.vo.StartEndTodayVO;

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
	
}
