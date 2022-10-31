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
		for(int i=1; i < 30; i++) 
			chalDao.insert(ChalDto.builder()
					.chalNo(i+3333)
					.userId("user07")
					.chalTitle(i+"번째 챌린지 테스트용이지롱")
					.chalContent("챌린지"+i+"챌린지~~")
					.howConfirm("챌린지"+i+"챌린지~~")
					.chalTopic("취미")
					.startDate(Date.valueOf("2022-11-02"))
					.build());
	}
//	@AfterEach
//	public void after() {
//		chalConfirmDao.clear();
//	}
}
