package com.kh.fourweeks;

import java.sql.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.fourweeks.entity.ChalDto;
import com.kh.fourweeks.repository.ChalDao;

@SpringBootTest
public class ChalDummy {
	@Autowired
	private ChalDao chalDao;
	
	@Test
	public void before() {
		for(int i=301; i < 306; i++) 
			chalDao.insert(ChalDto.builder()
					.chalNo(i)
					.userId("test02")
					.chalTitle(i+"번째 챌린지 테스트용이지롱")
					.chalContent("챌린지"+i+"챌린지~~")
					.howConfirm("챌린지"+i+"챌린지~~")
					.chalTopic("운동")
					.startDate(Date.valueOf("2022-11-01"))
					.build());
	}
//	@AfterEach
//	public void after() {
//		chalConfirmDao.clear();
//	}
}
