<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	body {
		padding-top: 92px;
	}
	.header-fixed{
		z-index:100;
		border-bottom: 2px solid #d9d9d9;
	}
</style>
</head>
<body>
<body>
	<header class="container-1200 header-fixed">
		<a href="/" class="logo"><img src="/images/top_logo.png" width="60"></a>
		<!-- 스타일 유지를 위해서 틀 남겨야 함 -->
		<nav>
			<ul class="dropdown-nav">
				
						<li></li>
		  				<li></li>
		                <li></li>
		                <li></li>
		                
		           	 	<li></li>
		           	 	<li></li>

			</ul>
		</nav>
	</header>