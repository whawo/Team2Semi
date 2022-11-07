<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css_admin/commons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
        
</style>
    
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
     
</script>
    
<div class="row container-400">
	<div class="row center">
		<h1>로그인</h1>
	</div>

	<form action="login" method="post">
		<div class="row">
			<input type="text" name="adminId" class="input w-100" placeholder="아이디" required autocomplete="off">
			<span class="fail-message">아이디를 입력해주세요.</span> <br> <br>
		</div>	
		
		<div class="row">
			<input type="password" name="adminPw" class="input w-100" placeholder="비밀번호" required >
			<span class="fail-message">비밀번호를 입력해주세요.</span> <br> <br>
		</div>
        
		<!--  아이디/비밀번호가 일치하지 않을때. -->
		<c:if test="${param.error != null}">
			<div class="row center login-error">
				<span class="error-span">아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.</span>
			</div>
		</c:if>
		
		<div class="row">
			<button type="submit" class="btn btn-positive">로그인</button>
		</div>
	</form>	
	
</div>