package com.kh.fourweeks.testcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class TestController {
@Autowired
private JdbcTemplate jdbcTemplate;
}
