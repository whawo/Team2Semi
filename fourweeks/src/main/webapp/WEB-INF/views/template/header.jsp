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
   a {
        color : #6c7aef;
        text-decoration-line: none;
    }
    a:hover {
        color : #6c7aef;
        font-weight: bold;
    }
    #navbutton1{
        border-color: #6c7aef; /*추가*/
        background-color: #6c7aef;
        color: white;
    }
    #navbutton2{
    border:solid;
    border-color: #6c7aef;
    border-width: 2px 2px 2px 2px;
    background-color: white;
    color: #6c7aef;
	}
	.navbtn{
    border: none;
    font-size: 14px;
    padding: 0.90em; /* 글자 크기의 0.9배 */
    cursor: pointer;
    display: inline-block;
    text-align:center;
    text-decoration: none;
    border-radius: 0.5em;
    width: 130px;
    height:40px;
}
    </style>
</head>
<body>
   <main>
   	<div class="container-1200">
      <nav>
         <ul class="row dropdown-menu float-container">
            <c:choose>
               <c:when test="${login}">
               	  <li class="float-left"><img src="/images/logo_top_icon.png" width="60"></li>
                  <li class="float-left"><a href="/">전체 챌린지</a></li>
                  <li class="float-left"><a href="/chal/create">챌린지 개설</a></li>
                  <li class="float-left"><a href="/chal/confirm">챌린지 인증</a></li>
                  <li class="float-left"><a href="#">문의하기</a></li>
                  <li class="float-right"><a href="#">${user_img} ${loginId}</a>
                     <ul>
                        	<li class="float-right"><a href="/member/mypage" >마이페이지</a></li>
                        	<li class="float-right"><a href="/logout">로그아웃</a></li>
                     </ul>
                    </li>
               </c:when>
               <c:otherwise>
               	  <li class="float-left"><img src="/images/logo_top_icon.png" width="60"></li>
                  <li class="float-left"><a href="#">전체 챌린지</a></li>
                  <li class="float-left"><a href="/login">챌린지 개설</a></li>
                  <li class="float-left"><a href="/login">챌린지 인증</a></li>
                  <li class="float-left"><a href="#">문의하기</a></li>
                 <li class="float-right">
                	<a href="/join" class="navbtn" id="navbutton1">회원가입</a>
            	</li>
                 <li class="float-right">
                	<a href="/login" class="navbtn" id="navbutton2">로그인</a>
            	</li>
                  </ul>
               </c:otherwise>
            </c:choose>
         </ul>
      </nav>



