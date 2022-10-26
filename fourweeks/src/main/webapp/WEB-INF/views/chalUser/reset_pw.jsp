<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 재설정" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<style>
    div{
		 border: 1px dotted transparent;
    }
        body{
            font-family: sans-serif;
        }
        a{
        line-height:32px;
        }
        .p-1{
            font-size: 24px;
            font-weight: bold;
            color: #3F3F3F;
            margin-top:50px;
            margin-bottom:22px;
        }
        .p-2{
            font-size: 12px;
            color:#3F3F3F;
            margin-bottom: 50px;

        }
        .btn1{
            margin-top: 40px;
        }
        .fa{
            color:black
        }
        .color{
            color: #425F57;
        }
        
</style>

 <div class="container-794">
	 <div class="row center">
	     <p class="p-1">비밀번호 재설정</p>
	 </div>
	 
	 <div class="row center">
	 	비밀번호 재설정을 위한 본인 확인이 완료되었습니다.
	 	<br> 새로운 비밀번호를 등록 후 사용해주세요.
	 </div>
	<!-- 회원가입처럼 새 비밀번호와 새 비밀번호 확인이 일치해야 form 전송되도록 설정 필요(jQuery) -->    
	<form action="reset_pw" method="post">
		<div class="row center">
			<input type="hidden" name="userId" value="${userDto.userId}">
 		     아이디 : ${userDto.userId}
		     <br><br>
		     새 비밀번호 : <input type="password" name="userPw" required placeholder="8~16자의 영문/숫자">
		     <br>
		     <span class="fail-message">8~16자 이내 영문 소문자/대문자,숫자,특수문자(!@#$)로 입력해주세요.</span>
		     <br><br>
		     새 비밀번호 확인 : <input type="password" required>
		     <br><br>
		     <span class="fail-message">비밀번호를 다시 입력해주세요.</span>
		     
		     <br><br>
		     <button type="submit">변경</button>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>