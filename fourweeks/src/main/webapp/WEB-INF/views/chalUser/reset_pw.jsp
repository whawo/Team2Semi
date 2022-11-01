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
        .row-1{
        	margin-left: 300px;
        }
        .row-2{
        	margin-left: 110px;
        }
        .row-3{
        	margin-left: 108px;
        }
        .row-4{
        	margin-top: 20px;
        	margin-bottom: 100px;
        }
        .p-1{
            font-size: 24px;
            font-weight: bold;
            color: #3F3F3F;
            margin-top:50px;
            margin-bottom:10px;
        }
        .p-2{
            font-size: 12px;
            color:#3F3F3F;
            margin-bottom: 4px;
        }
        .p-3{
        	 font-size: 12px;
         color:#3F3F3F;
         margin-bottom: 10px;
        }
        
        .sp-1{
        	font-size: 16px;
        	color: #3f3f3f;
        }
        .sp-2{
        font-size: 16px;
        	color: #3f3f3f;
        	font-weight: 700;
        }
        .sp-3{
        font-size: 16	px;
        	color: #3f3f3f;
        	font-weight: 700;
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
        .id-box{
        	border: 1px solid transparent;
        	width: 200px;
        	height: 58px;
        	padding-left: 30px;
        background-color: transparent;
        }
        .id-box::placeholder{
        	font-size: 16px;
        	font-weight: 700;
        	color: #3f3f3f;
        }
        
        .pw-box{
        	border:  2px solid #cfc9d5;
        	border-radius:0.5em;
        	width: 400px;
        	height: 58px;
        	padding-left: 10px;
        	margin-left: 42px;
        }
        
        .pw-box2{
        	border:  2px solid #cfc9d5;
        	border-radius:0.5em;
        	width: 400px;
        	height: 58px;
		padding-left: 10px;
        	margin-left: 12px;
        }
        
        .fail-message{
        color: #eb6f7f;
        font-size: 14px;
        padding-left: 126px;
        }
        .largebtn{
        	width: 525px;
        	margin-left: 106px;
        }
        
        .fail-message {
			display: none;
			padding-top: 0;
			padding-bottom: 7px;
		}
		
		.input.fail ~ .fail-message {
			display: block;
			font-size:12px;
		    color: #eb6f7f;
		}
		
		.input ~ .find-error {
			font-size:12px;
		    color: #eb6f7f;
		}
        .copyright{
        	margin-left: 820px;
        }
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
$(function() {
	$(".confirm-form").submit(function() {
		//정규식에 맞는지 아닌지 확인 
		var newPw = $("input[name=newPw]").val();
		var regex = /^[a-zA-Z0-9!@#$]{8,16}$/;
		var judge = regex.test(newPw);
		if(!judge){
			return false;
		}
		if(judge.length == 0){
			return false;
		}
		var rePw = $("input[name=newPwCheck]").val();
		if(newPw !== rePw){
			return false;
		}
		else{
			alert("비밀번호 변경에 성공했습니다.");
			return true;
		}
	});
});




/* 	// 변경에 성공했을 경우 alert으로 알림
	$(function() {
		$(".confirm-form").submit(function (e) {
			alert("비밀번호 변경에 성공했습니다.");
	    });
	});  */
</script>
 <div class="container-794">
 <div class="row center mt-92">
	     <p class="p-1">비밀번호 재설정</p>
	 </div>
	 
	 <div class="row center">
	 	<p class="p-2"> 비밀번호 재설정을 위한 본인 확인이 완료되었습니다.</p>
	 	<p class="p-3"> 새로운 비밀번호를 등록 후 사용해주세요.</p>
	 </div>
	 
	<!-- 회원가입처럼 새 비밀번호와 새 비밀번호 확인이 일치해야 form 전송되도록 설정 필요(jQuery) -->    
	<form action="reset_pw" method="post" class="confirm-form">
		<div class="row row-1">
			<input type="hidden" name="userId" value="${userDto.userId}">
 		     <span class="sp-1">아이디 : </span><input id="id-box"  class="id-box" placeholder="${userDto.userId}" disabled>
 		</div>
			<div class="row row-2">
		     <span class="sp-2">새 비밀번호 </span> 
		     <input type="password" name="newPw"  placeholder="8~16자의 영문/숫자/특수문자(!@#$)" class="pw-box short-hover"><br>
		     <span class="fail-message">8~16자 이내 영문 소문자/대문자,숫자,특수문자(!@#$)로 입력해주세요.</span>
		</div>
		 <div class="row row-3">
		 <span class="sp-3">새 비밀번호 확인</span> 
		     <input type="password" name="newPwCheck"  class="pw-box2 short-hover">
		   </div>
				<c:if test="${param.error != null}">
				  <span class="fail-message">비밀번호를 다시 입력해주세요.</span>
				</c:if>
		    <div class="row  row-4">
		     <button class="largebtn" type="submit" id="largebutton1">변경</button>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>