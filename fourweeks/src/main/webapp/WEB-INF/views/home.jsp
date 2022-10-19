<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4WEEKS</title>
	</head>
	<body>
		<div>메인</div>
		<!-- 테스트용 코드 -->
		<c:choose>
			<c:when test="${loginId != null}">
				접속아이디: ${sessionScope.loginId}
				<a href="/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="join">회원가입</a>
				<a href="login">로그인</a>
			</c:otherwise>
		</c:choose>
	</body>
</html>