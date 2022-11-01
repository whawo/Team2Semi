package com.kh.fourweeks.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.vo.OnePerDayVO;

@Component
public class OnePerDayInterceptor implements HandlerInterceptor{
	@Autowired
	private ChalConfirmDao chalConfirmDao;
	
	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute(SessionConstant.ID);
		int chalNo = Integer.parseInt(request.getParameter("chalNo"));
		OnePerDayVO judge = chalConfirmDao.selectOneList(chalNo, userId);
		
		if (judge == null) {
			return true;
		} 
			response.sendError(403);
			return false;
		
	}
}
