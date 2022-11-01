package com.kh.fourweeks.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.fourweeks.interceptor.AdminIntercepter;
import com.kh.fourweeks.interceptor.ConfirmOwnerCheckInterceptor;
import com.kh.fourweeks.interceptor.MyAccountCheckInterceptor;
import com.kh.fourweeks.interceptor.OnePerDayInterceptor;
import com.kh.fourweeks.interceptor.ParticipantCheckInterceptor;
import com.kh.fourweeks.interceptor.ReplyOwnerCheckInterceptor;
import com.kh.fourweeks.interceptor.UserInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{
	
	@Autowired
	private UserInterceptor userInterceptor;
	
	@Autowired
	private AdminIntercepter adminInterceptor; 
	
	@Autowired
	private ReplyOwnerCheckInterceptor replyOwnerCheckInterceptor;
	
	@Autowired
	private ConfirmOwnerCheckInterceptor confirmOwnerCheckInterceptor;
	
	@Autowired
	private MyAccountCheckInterceptor myAccountCheckInterceptor;
	
	@Autowired
	private ParticipantCheckInterceptor participantCheckInterceptor;
	
//	@Autowired
//	private OnePerDayInterceptor onePerDayInterceptor; 
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 비회원과 회원을 구분
		registry.addInterceptor(userInterceptor)
								.addPathPatterns(
										"/chal/**", // 챌린지 전부 차단
										"/confirm/**", // 인증 전부 차단
										"/user/**", // 유저 전부 차단
										"/admin/**"
										)
								.excludePathPatterns(
										"/chal/list", // 리스트 조회 가능
										"/chal/detail", // 디테일 조회 가능
										"/user/join*", // 가입 가능
										"/user/login", // 로그인 가능
										"/user/find_id", // 아이디 찾기 가능
										"/user/find_pw", // 비밀번호 찾기 가능
										"/user/reset_pw", // 비밀번호 변경 가능
										"/user/leave" // 탈퇴 가능
										);
		// 관리자 구분
		registry.addInterceptor(adminInterceptor)
								.addPathPatterns(
										"/admin/**",
										"/confirm/reply/blind"
										);
		// 본인이 쓴 댓글만 삭제&수정 가능
		registry.addInterceptor(replyOwnerCheckInterceptor)
								.addPathPatterns(
										"/confirm/reply/delete",
										"/confirm/reply/edit"
										);
		// 본인이 올린 챌린지만 수정 가능
		registry.addInterceptor(confirmOwnerCheckInterceptor)
								.addPathPatterns(
										"/confirm/edit"
										);
		 // 본인의 정보만 수정 가능
		registry.addInterceptor(myAccountCheckInterceptor)
								.addPathPatterns(
										"/user/mypage/**",
										"/user/leave"
										);
		// 참가자가 아니라면 조회 불가
		registry.addInterceptor(participantCheckInterceptor)
								.addPathPatterns(
										"/chal/mychal**",
										"/chal/mychal/**"
										);
		
//		// 인증글을 한번이라도 작성했다면
//		registry.addInterceptor(onePerDayInterceptor)
//								.addPathPatterns(
//										"/confirm/write"
//										);
		
		
	}
}
