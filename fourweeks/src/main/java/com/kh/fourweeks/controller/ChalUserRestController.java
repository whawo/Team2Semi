package com.kh.fourweeks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.fourweeks.entity.ChalUserDto;
import com.kh.fourweeks.repository.ChalUserDao;

@CrossOrigin(origins = {"http://127.0.0.1:5500"})
@RequestMapping("/rest/join")
@RestController
public class ChalUserRestController {
	
	@Autowired
	private ChalUserDao chalUserDao;
	
	@RequestMapping("/id")
	public String findId(@RequestParam String userId) {
		ChalUserDto chalUserDto = chalUserDao.selectOne(userId);
		if(chalUserDto == null) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}
		// http://localhost:8888/rest/join/id?userId=test01 -> 출력가능
	}
	
	@RequestMapping("/nick")
	public String findNick(@RequestParam String userNick) {
		ChalUserDto chalUserDto = chalUserDao.selectNick(userNick);
		if(chalUserDto == null) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}
		// http://localhost:8888/rest/join/nick?userNick=테스트01 -> 출력가능
	}
}