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
<link rel="stylesheet" type="text/css" href="/css/commons1.css">
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<style>
	div, ul, li{
	border: 1px dotted gray;
	list-style:none;
	}
	4weeks-inner{
		position: relative;
		width:1200px;
		padding: 0 30px;
		margin: 0 auto;		
	}
	.4weeks-nav{
		overflow: hidden;
		position: relative;
		padding: 11px 270px 11px 0;
}
.list-nav{
	float: left;
	font-size:15px;
	line-height: 30px;
	font-weight: 700;
	color: black;
	letter-spacing: -.3px;
}
.nav-item{
float:left;
}
.list-nav .nav-item{
	margin-left: 20px;
} 


</style>
    </style>
</head>
<body>
   <main>
<div class="container-1200">
   	 <div class="row 4weeks-inner"> 
   		<div class="row 4weeks-nav">
   			<ul class="list-nav"> 
   			<c:choose>
               <c:when test="${login}">
   			
   				<il class="nav-item">
   					<img src="/images/join_success.png" width="60">
   					</il>
   					<il class="nav-item">
   					<a href="/">전체 챌린지</a>
   					</il>
   					<il class="nav-item">
	                <a href="/chal/create">챌린지 개설</a>
	                </il>
	                <il class="nav-item">
	                <a href="/chal/confirm">챌린지 인증</a>
	                </il>
	                <il class="nav-item">
	           	 	<a href="#">문의하기</a>
	           	 	</il>
	           	 	<li class="nav-item right-item">
	           	 	<a href="#">${user_img} ${loginId}</a>
	           	 	</li>
	           	 		<ul>
	           	 			<li class="nav-item right-item"><a href="마이페이지이이이">마이페이지</a></li>
	           	 			<li><a href="/logout">로그아웃</a></li>
	           	 		</ul>
					 </c:when>
               <c:otherwise>
               <il class="nav-item">
   					<a href="/">전체 챌린지</a>
   					</il>
   					<il class="nav-item">
	                <a href="/chal/create">챌린지 개설</a>
	                </il>
	                <il class="nav-item">
	                <a href="/chal/confirm">챌린지 인증</a>
	                </il>
	                <il class="nav-item">
	           	 	<a href="#">문의하기</a>
	           	 	</il>
	           	 	<li class="nav-item">
	           	 	<a href="/join">회원가입</a>
	           	 	</li>
	           	 	<li class="nav-item">
	           	 	<a href="/login" >로그인</a>
					</li>
			</c:otherwise>
			</c:choose>
	 </ul>
   		</div>
   	</div>
 </div>
   	</body>
