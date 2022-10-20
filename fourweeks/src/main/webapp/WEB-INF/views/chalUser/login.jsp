<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
	</head>
	<body>
		<div>
			로그인
		</div>
		<div>
			가입하신 아이디와 비밀번호를 입력해주세요.
		</div>
		<div>
			비밀번호는 대소문자를 구분합니다.
		</div>
		<form action="login" method="post">
			<div>
				<input name="userId" type="text" placeholder="아이디" autocomplete="off">
			</div>
			<div>
				<input name="userPw" type="password" placeholder="비밀번호">
			</div>
			<div>
				<button type="submit">로그인</button>
			</div>
			<c:if test="${param.error != null}">
				<h2 style="color:red">입력한 정보가 맞지 않습니다.</h2>
			</c:if>
		</form>
		
		<div>
			<%-- 헬퍼텍스트 --%>
			아이디 또는 비밀번호를 잘못 입력했습니다.
		</div>
		<div>
			<%-- 헬퍼텍스트 --%>
			입력하신 내용을 다시 확인해주세요.
		</div>
		<span>
			<a href="#">비밀번호 찾기</a>
		</span>
		<span>
			<a href="#">비밀번호 찾기</a>
		</span>
		<span>
			<a href="join">회원가입</a>
		</span>
	</body>
</html>