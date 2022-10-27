<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 변경" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>

/*
	디자인 해야할 것: 
	- 마지막에 취소 변경 크기 맞추기 

  */
    div{
		 border: 1px dotted gray;
    }
        body{
            font-family: sans-serif;
        }
        
/*  row 모음 */
.row-id{
 margin-left: 100px;
}
        
/* 스팬 모음 */
.sp-1{
padding-left: 30px;
font-size:16px;
font-weight:700;
} 
.sp-2{
padding-left: 30px;
font-size:16px;
font-weight:700;
}
.sp-3{
padding-left: 82px;
font-size:16px;
font-weight:700;
}
 
 /* 인풋 박스 모음  */
 .id-box{
 border: 1px solid transparent;
 width: auto;
 margin-left: 3px;
 }
 .pw-box1{
 padding-left: 20px; /* 플레이스 홀더  옆으로 띄우기*/
 width: 500px;
  margin-left: 50px;
 }
  .pw-box2{
 padding-left: 20px; /* 플레이스 홀더  옆으로 띄우기*/
 width: 500px;
  margin-left: 30px;
 }
 /* 에러 모음 */
 .error1{
 color: #eb6f7f;
 padding-left: 20px;
 }
.error2{
 color: #eb6f7f;
 padding-left: 220px;
 } 
 
 /*  disabled */
input[name="userId"]:disabled{
background-color:transparent;
}
</style>

 <div class="container-794">
	 <div class="row center">
	 	<h2>비밀번호 변경 </h2>
	 </div>
	<!-- 회원가입처럼 새 비밀번호와 새 비밀번호 확인이 일치해야 form 전송되도록 설정 필요(jQuery) -->    
	<form action="pw" method="post">
		<div class="row  center row-id">
			<span class="sp-1">아이디</span><input class="input short-text-box id-box" name="userId"  value="${userDto.userId}" disabled>
		</div>	
		<div class="row center">
		<span class="sp-2">새 비밀번호 </span><input class="input short-text-box pw-box1"  type="password"  name="userPw"  placeholder="8~16자의 영문/숫자"><br>
		     <span class="error1">8~16자 이내 영문 소문자/대문자,숫자,특수문자(!@#$)로 입력해주세요.</span>
		</div>
	<div class="row ">
		     <span class="sp-3">새 비밀번호 확인 </span><input class="input short-text-box pw-box2"  type="password"  name="userPw"  placeholder="8~16자의 영문/숫자"><br>
		     <span class="error2">비밀번호를 다시 입력해주세요.</span>
	</div>
	<div class="row center">
		     <a class="smallbtn cancel-btn"   id="smallbutton3"href="/mypage">취소</a>
		     <button class="save-btn" type="submit">변경</button>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>