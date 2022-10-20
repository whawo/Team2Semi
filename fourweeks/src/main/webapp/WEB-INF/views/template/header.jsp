<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="login" value="${loginId != null}"></c:set>
<c:set var="admin" value="${mg == '관리자'}"></c:set>

<html>
<head>
<title><c:choose>
		<c:when test="${param.title != null}">
					${param.title}
				</c:when>
		<c:otherwise>
					홈페이지
				</c:otherwise>
	</c:choose></title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/commons.css">
<link rel="stylesheet" type="text/css" href="/css/layout.css">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/js/checkbox.js"></script>
</head>
<body>

	<!-- main은 영역의 시작과 끝을 의미 -->
		<!-- 상단 헤더 -->
		<header> </header>

		<!-- 메뉴 -->
		<nav>
			<!-- 메뉴 : 반드시 절대 경로로 작성 -->
			<ul class="dropdown-menu">
				<li><a href="/">전체 챌린지</a></li>
				<li><a href="/">챌린지 개설</a></li>
				<li><a href="/">챌린지 인증</a></li>
				<li><a href="/">문의하기</a></li>
				<li class="right-menu"><a href="#">${loginId} 님</a>
					<ul>
						<li><a href="/member/mypage">마이페이지</a></li>
						<li><a href="/member/logout">로그아웃</a></li>
					</ul>
					</li>
					</ul>
		</nav>

		<!-- 사이드바 + 컨텐츠 -->
		<section class="w-100">