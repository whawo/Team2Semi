package com.kh.fourweeks.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.ReplyDto;
import com.kh.fourweeks.repository.ReplyDao;

@Component
public class ReplyOwnerCheckInterceptor implements HandlerInterceptor{
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute(SessionConstant.ID);
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		String referer = request.getHeader("Referer");
		ReplyDto replyDto = replyDao.selectOne(replyNo);
		
		if(userId.equals(replyDto.getUserId())) {
			if(referer != null && referer.contains("/confirm/detail")) {
				return true;
			}
		}
		
		response.sendError(403);
		return false;
	}
}
