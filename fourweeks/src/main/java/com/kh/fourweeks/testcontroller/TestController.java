package com.kh.fourweeks.testcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class TestController {
@Autowired
private JdbcTemplate jdbcTemplate;
}
