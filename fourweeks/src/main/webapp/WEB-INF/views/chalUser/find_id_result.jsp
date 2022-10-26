<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/headerNo.jsp">
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<style>
 
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
    
</script>
<div class="container-794">
    <div class="row center">
		아이디 찾기
	</div>
    
	<form action="/login" method="get">
		<div class="row center">
			고객님의 정보와 일치하는 아이디 목록입니다.
		    <br><br>
		    <c:forEach var="userDto" items="${idList}">
		    	<input id="radio-id" name="userId" type="radio" value="${userDto.userId}"><label for="radio-id">${userDto.userId}</label><br>
		    </c:forEach>
			<br><br>
			<button type="submit">로그인</button>
		</div>
	</form>
	
	<section class="row center">
		<a class="find" href="/find_pw">비밀번호 찾기</a>
		<em class="divi">|</em>
		<a class="find" href="/join">회원가입</a>
	</section>
 </div>