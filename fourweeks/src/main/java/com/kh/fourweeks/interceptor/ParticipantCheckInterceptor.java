package com.kh.fourweeks.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.fourweeks.constant.SessionConstant;
import com.kh.fourweeks.entity.ParticipantDto;
import com.kh.fourweeks.repository.ParticipantDao;

@Component
public class ParticipantCheckInterceptor implements HandlerInterceptor{
	@Autowired
	private ParticipantDao participantDao;
	
	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
		throws Exception {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute(SessionConstant.ID);
		int chalNo = Integer.parseInt(request.getParameter("chalNo"));
		ParticipantDto participantDto = participantDao.selectOne(chalNo, userId);
		boolean isParticipant = userId.equals(participantDto.getUserId()) && chalNo == participantDto.getChalNo();
		if (isParticipant) {
			return true;
		}
		
		response.sendError(403);
		return false;
	}
}
