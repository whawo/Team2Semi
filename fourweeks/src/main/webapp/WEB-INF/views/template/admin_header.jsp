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
			4weeks admin
		</c:otherwise>
	</c:choose>
</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/css_admin/reset.css">
<link rel="stylesheet" type="text/css" href="/css_admin/layout.css">
<link rel="stylesheet" type="text/css" href="/css_admin/commons.css">
  	
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<style>
</style>
<!-- jquery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- moment 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>

<!-- chart.js 라이브러리-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
<script type="text/javascript">    
	$(function() {
		$(".today").text(moment().format("YY.MM.DD(ddd)"));
	});
</script>
</head>
<body>
<aside>
	<div class="row mb-30">
		<a href="/admin/home"><img src="/images/top_logo.png" width="100"></a>
	</div>
	<div class="row center">
		<i class="fa-solid fa-user-lock fa-2x"></i>
		<h3>${loginId}</h3>
	</div>
	<div class="row center mb-30">
		<span class="today"></span>
	</div>
	<div class="row">
		<a href="/admin/report/user"><i class="fa-solid fa-user me-10"></i>유저 통계</a>
	</div>
	<div class="row">
		<a href="/admin/report/chal"><i class="fa-solid fa-calendar me-10"></i>챌린지 통계</a>
	</div>
	<div class="row">
		<a href="https://dashboard.tawk.to/#/dashboard/6358850adaff0e1306d3fc24" target="_blank"><i class="fa-solid fa-comment me-10"></i>유저 문의</a>
	</div>
	<div class="row mb-50">
		<a href="/admin/list"><i class="fa-solid fa-pen-to-square me-10"></i>공지</a>
	</div>
	<hr>
	<div class="row">
		<a href="/admin/logout"><i class="fa-solid fa-power-off me-10"></i>로그아웃</a>
	</div>
</aside>
	
<!-- 본문 
<div id="dashboard">
</div>
</body>
</html>
-->
