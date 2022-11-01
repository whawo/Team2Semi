package com.kh.fourweeks.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.fourweeks.constant.SessionConstant;

@Component
public class UserInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler
			)
			throws Exception {
		// 인터셉터 확인용 프린트
		System.out.println("user interceptor");
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		if (loginId == null) {
			// 비로그인시 로그인 페이지로 보냄
			response.sendRedirect("/need_login");
			return false;
		} else {
			return true;
		}
	}
}
