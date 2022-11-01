<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="login" value="${loginId != null}"></c:set>
<c:set var="admin" value="${loginGrade == '관리자'}"></c:set>
<html>
<head>
<title>
	<c:choose>
		<c:when test="${param.title != null}">
			${param.title}
		</c:when>
		<c:otherwise>
			4weeks
		</c:otherwise>
	</c:choose>
</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/layout.css">
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="stylesheet" type="text/css" href="/css/commons1.css">
  	
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
  	
<!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->
<style>
	.header-fixed{
		z-index:100;
		border-bottom: 2px solid #d9d9d9;
	}
	.user-img {
	border-radius: 50%;
	margin-right: 0.5em; /* padding(값을 한쪽에만 주면 찌그러짐) -> margin */
	}
	.user-img > .user-img-position {
	
	}
</style>
<script type="text/javascript">
	// 채팅 API 소스 코드
	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
	(function(){
	var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
	s1.async=true;
	s1.src='https://embed.tawk.to/6358bb84daff0e1306d4011a/1gg99p084';
	s1.charset='UTF-8';
	s1.setAttribute('crossorigin','*');
	s0.parentNode.insertBefore(s1,s0);
	})();
</script>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	//프로필 이미지가 없으면 기본 아이콘으로 대체
	$(function(){
		$(".user-img").on("error", function(){
			$(this).replaceWith("<i class='fa-solid fa-circle-user'></i>");
		});
	});
	
	//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function (event) {
        if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
          	location.href = location.href;
        }
    });
</script>
</head>

<body>
	<header class="container-1200 header-fixed">
		<a href="/"><img src="/images/top_logo.png" width="100"></a>
		<nav>
			<ul class="dropdown-nav">
				<c:choose>
					<c:when test="${login}">
						<li><a href="/chal/list">전체 챌린지</a></li>
	   					<li><a href="/chal/create">챌린지 개설</a></li>
		                <li><a href="/confirm/write">챌린지 인증</a></li>
		                <li><a href="javascript:void(Tawk_API.toggle())">문의하기</a></li>
		                <li class="right-menu">
							<img src = "/user/profile/download?userId=${loginId}" width="50" height="50" class="user-img"> ${loginNick}
							<ul>
								<li><a href="/user/mypage">마이페이지</a></li>
								<li><a href="/user/logout">로그아웃</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/chal/list">전체 챌린지</a></li>
		  				<li><a href="/need_login">챌린지 개설</a></li>
		                <li><a href="/need_login">챌린지 인증</a></li>
		                <li><a href="javascript:void(Tawk_API.toggle())">문의하기</a></li>
		                <li class="right-menu">
							로그인
							<ul>
								<li><a href="/user/login">로그인</a></li>
								<li><a href="/user/join">회원가입</a></li>
							</ul>
						</li>
		           	 	
					</c:otherwise>
				</c:choose>	
			</ul>
		</nav>
	</header>