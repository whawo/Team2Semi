package com.kh.fourweeks.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.repository.ChalConfirmDao;
import com.kh.fourweeks.vo.ChalConfirmVO;

@Component
public class ConfirmOwnerCheckInterceptor implements HandlerInterceptor{

	@Autowired
	private ChalConfirmDao chalConfirmDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute(SessionConstant.ID);
		int confirmNo = Integer.parseInt(request.getParameter("confirmNo"));
		ChalConfirmVO chalConfirmVO = chalConfirmDao.selectOne(confirmNo);
		boolean isOwner = userId.equals(chalConfirmVO.getUserId());
		if(isOwner) {
			return true;
		}
		
		response.sendError(403);
		return false;
	}
}
