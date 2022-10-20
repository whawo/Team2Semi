<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="login" value="${loginId != null}"></c:set>
<c:set var="admin" value="${mg == '관리자'}"></c:set>
<html>
<head>
<title>4weeks</title>
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
</head>
<body>
	<main>
		<nav>
			<ul class="dropdown-menu">
				<c:choose>
					<c:when test="${login}">
						<li><a href="/">전체 챌린지</a></li>
						<li><a href="#">챌린지 개설</a></li>
						<li><a href="#">챌린지 인증</a></li>
						<li><a href="#">문의하기</a></li>
						<li class="right-menu"><a href="#">${user_img} ${loginId}</a>
							<ul>
								<c:if test="${login && admin}">
									<li><a href="/admin/home">관리자페이지</a></li>
								</c:if>
								<li><a href="/member/mypage">마이페이지</a></li>
								<li><a href="/member/logout">로그아웃</a></li>
							</ul></li>
					</c:when>
					<c:otherwise>
						<li><a href="/">전체 챌린지</a></li>
						<li><a href="/login">챌린지 개설</a></li>
						<li><a href="/login">챌린지 인증</a></li>
						<li><a href="/login">문의하기</a></li>
						<li class="right-menu"><a href="/member/login">로그인</a>
							<ul>
								<li><a href="/member/join">회원가입</a></li>
							</ul></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<!-- 사이드바 + 컨텐츠 -->
		<section class="w-100">