package com.kh.fourweeks.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.fourweeks.entity.ChalDto;

@Repository
public class ChalDaoImpl implements ChalDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int chalSeq() {
		String sql = "select chal_seq.nextval from dual";
		int chalNo = jdbcTemplate.queryForObject(sql, int.class);
		return chalNo;
	}
	
	@Override
	public void insert(ChalDto chalDto) {
		String sql = "insert into chal("
				+ "chal_no, user_id, chal_title, "
				+ "chal_content, chal_topic, start_date) "
				+ "values(?, ?, ?, ?, ?, ?)";
		Object[] param = {	chalDto.getChalNo(),
							chalDto.getChalNo(), chalDto.getUserId(),
							chalDto.getChalTitle(), chalDto.getChalContent(), 
							chalDto.getChalTopic(), chalDto.getStartDate()};
		
		jdbcTemplate.update(sql, param);
	}
}
