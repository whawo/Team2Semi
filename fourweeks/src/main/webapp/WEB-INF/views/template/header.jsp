<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="login" value="${loginId != null}"></c:set>
<c:set var="admin" value="${loginGrade == '관리자'}"></c:set>
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
	/* 이거 지우면 위로 더 올라오니깐 삭제하지 마세요  */
	border: 1px dotted transparent;
	list-style:none;
	}
	.head-a{
        font-size: 16px;
        font-weight:normal;
   		color:#6c7aef;
        cursor: pointer;
    }
    haed-a-hover:hover{
	    font-weight: bold;
	    text-decoration-line: underline;
    }
	.4weeks-inner{
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
	.logo-margin {
		margin-top : 5px;
	}
	
	/*  */
	head-line{
	border-bottom:1px solid #d9d9d9;
	width:800px;
	}
	.user-img {
	border-radius: 50%;
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
});
</script>
<body>
<div class="container-1200 head-line">
   	 <div class="row 4weeks-inner"> 
   		<div class="row 4weeks-nav">
   			<ul class="list-nav">
	   			<li class="nav-item"><a href="/"><img src="/images/top_logo.png" width="60" class="logo-margin"></a></li>
	   			
   				<c:choose>
					<c:when test="${login}">
	   					<li class="nav-item"><a href="/chal/list">전체 챌린지</a></li>
	   					<li class="nav-item"><a href="/chal/create">챌린지 개설</a></li>
		                <li class="nav-item"><a href="/confirm/write">챌린지 인증</a></li>
		                <li class="nav-item"><a href="javascript:void(Tawk_API.toggle())">문의하기</a></li>
		           	 	<li class="nav-item">
		           	 		<a href="/mypage">
		           	 		<img class="user-img" src="/profile/download?userId=${loginId}" width="35" height="35">
		           	 		<span>${loginNick}</span>
		           	 		</a>
		           	 	</li>
	           	 		<li class="nav-item"><a href="/mypage">마이페이지</a></li>
	           	 		<li class="nav-item"><a href="/logout">로그아웃</a></li>
					</c:when>
					<c:otherwise>
		               	<li class="nav-item"><a href="/chal/list">전체 챌린지</a></li>
		  				<li class="nav-item"><a href="/need_login">챌린지 개설</a></li>
		                <li class="nav-item"><a href="/need_login">챌린지 인증</a></li>
		                <li class="nav-item"><a href="javascript:void(Tawk_API.toggle())">문의하기</a></li>
		                
		           	 	<li class="nav-item"><a class="head-a head-a-hover" href="/join">회원가입</a></li>
		           	 	<li class="nav-item"><a class="head-a head-a-hover" href="/login" >로그인</a></li>
					</c:otherwise>
				</c:choose>
	 		</ul>
   		</div>
   	</div>
 </div>
</body>

