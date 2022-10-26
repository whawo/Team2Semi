<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4weeks</title>
</head>
<body>
<h1>어드민 홈</h1>
로그인하면 아이디 나옴
<c:if test="${loginId != null}">
	<h2>로그인 아이디: ${loginId}</h2>
	<a href="logout">로그아웃</a>
</c:if>
</body>
</html>