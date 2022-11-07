package com.kh.fourweeks.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.ReplyDto;
import com.kh.fourweeks.repository.ReplyDao;
import com.kh.fourweeks.vo.ReplyListVO;

//댓글 비동기 처리 컨트롤러
@RestController
@RequestMapping("/rest/reply")
public class ReplyRestController {
	@Autowired
	private ReplyDao replyDao;
	
	//댓글 등록
	@PostMapping("/write")
	public void replyWrite(@ModelAttribute ReplyDto replyDto,
			HttpSession session) {
		String userId = (String)session.getAttribute(SessionConstant.ID);
		replyDto.setUserId(userId);
		replyDao.insert(replyDto);
	}
	
	//댓글 삭제
	@PostMapping("/delete")
	public boolean replyDelete(@RequestParam int replyNo) {
		return replyDao.delete(replyNo);
	}
	
	//댓글 목록
	@PostMapping("/list")
	public List<ReplyListVO> replyList(@RequestParam int confirmNo) {
		return replyDao.selectList(confirmNo);
	}
}
