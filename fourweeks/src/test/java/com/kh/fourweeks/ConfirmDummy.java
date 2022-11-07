package com.kh.fourweeks;

import java.sql.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.fourweeks.entity.ChalConfirmDto;
import com.kh.fourweeks.repository.ChalConfirmDao;

@SpringBootTest
public class ConfirmDummy {
	@Autowired
	private ChalConfirmDao confirmDao;
	
	@Test
	public void before() {
		for(int i=1; i < 20; i++) 
			confirmDao.write(ChalConfirmDto.builder()
					.confirmNo(i+300)
					.chalNo(161)
					.userId("user1234")
					.confirmTitle(i+"일차")
					.confirmContent("day"+i+"인증")
					.build());
	}
	
//	@AfterEach
//	public void after() {
//		chalConfirmDao.clear();
//	}
}
