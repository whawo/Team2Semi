<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
	</head>
	<body>
		<form action="join" method="post">
			<!-- 유저 아이디 입력창 -->
			<input name="userId" type="text" autocomplete="off" placeholder="아이디">
			<!-- 유저 닉네임 입력창 -->
			<input name="userNick" type="text" autocomplete="off" placeholder="닉네임">
			<!-- 비밀번호 1차 입력창 입력창 -->
			<input name="userPw" type="password" placeholder="비밀번호">
			<!-- 비밀번호 2차 확인 입력창 -->
			<input type="password" placeholder="비밀번호 확인">
			<!-- 본인 확인 이메일 입력창 -->
			<input name="userEmail" type="email" autocomplete="off" placeholder="이메일">
			<button type="submit">회원가입</button>
		</form>
		<div>
			위 내용의 개인정보를 제공함에 동의합니다.
		</div>
		<span>
			이미 4weeks 계정이 있으신가요?
		</span>
		<span>
			<a href="login">로그인</a>
		</span>
	</body>
</html>