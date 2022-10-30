package com.kh.fourweeks;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.fourweeks.entity.ChalUserDto;
import com.kh.fourweeks.repository.ChalUserDao;

@SpringBootTest
public class CahlUserDummyTest {
	@Autowired
	private ChalUserDao chalUserDao;
	
	@Test
	public void before() throws ParseException {
		String begin = "2022-01-01"; // 시작날짜
		String end = "2022-10-27"; // 종료날짜
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date beginDate = formatter.parse(begin);
		java.util.Calendar start = java.util.Calendar.getInstance();
		start.setTime(beginDate);
		Random r = new Random(); // 랜덤아이디
		while(true) {
			String dateStr = formatter.format(start.getTime());
				int ranId = r.nextInt(999999)+10000; // 10000~999999까지 숫자 생성
				chalUserDao.join(ChalUserDto.builder()
						.userId("abc" + ranId)
						.userNick("abc" + ranId)
						.userPw("abc" + ranId)
						.userEmail("asd"+ranId+"@naver.com")
						.createDate(java.sql.Date.valueOf(dateStr))
						.build());
			if(dateStr.equals(end)) {
				break; // 종료날짜때 스탑
			} else {
				start.add(java.util.Calendar.DATE, 1); // 1일씩 추가
			}
		}
	}
}
