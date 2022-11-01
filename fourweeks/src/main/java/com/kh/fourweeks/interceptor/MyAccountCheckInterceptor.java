package com.kh.fourweeks.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.ChalUserDto;
import com.kh.fourweeks.repository.ChalUserDao;

@Component
public class MyAccountCheckInterceptor implements HandlerInterceptor{
	
	@Autowired
	private ChalUserDao chalUserDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute(SessionConstant.ID);
		ChalUserDto chalUserDto = chalUserDao.selectOne(userId);
		boolean isOwner = userId.equals(chalUserDto.getUserId());
		if (isOwner) {
			return true;
		}
		
		response.sendError(403);
		return false;
	}

}
