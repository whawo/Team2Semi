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
a{
color: #3f3f3f;
}
.row-1{
margin-bottom: 10px;
}
.row-2{
padding-bottom: 50px;
}
 .row-3{
 padding-right: 40px;
        }
.row-4{
padding-top: 30px;
}
.row-5{
margin-left: 96px;
}
 .p1{
 font-size: 24px;
 font-weight: 700;
 color: #3f3f3f;
 }
 .p2{
  font-size: 14px;
 color: #3f3f3f;
 }
 .btn1{
 border: 1px solid #6c7aef;
 border-radius: 0.5em;
 background-color: #6c7aef;
 color: #FFF;
 font-size: 16px;
 width: 500px;
 height: 58px;
 cursor:pointer;
 margin-top: 30px;
 }
 .lab1{
font-size: 20px;
color: #3f3f3f;
 cursor:pointer;
 }
 .custom-rad{
border: 2px solid #e5e5e5;
padding: 40px 177px ;
border-radius: 0.5em;
margin-left: 33px;
 }
 label.custom-rad input[type="radio"]{
 opacity: 0;
 }
  label.custom-rad input[type="radio"]  ~ .help-el{
 border: 2px solid #a8b0e9;
 }
 label.custom-rad input[type="radio"] ~ .help-el {
 background-color: #FFF;
 border: 2px solid #a8b0e9;
 border-radius: 50%;
 display: inline-block; 
 margin-right: 4px;
 padding: 9px;
 position: relative;
 top:5px;
 }
 label.custom-rad input[type="radio"]:checked  ~ .help-el{
 border: 2px solid #6c7aef;
 }
 label.custom-rad input[type="radio"]:checked ~ .help-el:after{
 background-color: #6c7aef;
 border-radius: 50%;
 content: " ";
 font-size: 30px;
 height: 14px;
 left:2px;
 position: absolute;
 top:2px;
 width:14px;
 }
 
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
    
</script>
<div class="container-794">
    <div class="row-1 center mt-92">
		<p class="p1">아이디 찾기</p>
	</div>
    
	<form action="/login" method="get">
		<div class="row-2 center">
			<p class="p2">고객님의 정보와 일치하는 아이디 목록입니다.</p>
		</div>	
		<div class="row row-3 center">
                             <c:forEach var="userDto" items="${idList}">
                             <label class="custom-rad">
                             		<input class="rab1" id="radio-id" name="userId" type="radio" value="${userDto.userId}">
                             		<label class="help-el"></label>
                             		<label for="radio-id" class="lab1">${userDto.userId}</label>
                  			         <input type="hidden"   name="userId"   value="${userDto.userId}">
                  			 </label>
                             </c:forEach>
            </div>
            <div class="row-4 center">
				<button class="btn1" type="submit">로그인</button>
            </div>
	</form>
	
	<section class="row-5 center">
		<a class="find" href="/find_pw">비밀번호 찾기</a>
		<em class="divi">|</em>
		<a class="find" href="/join">회원가입</a>
	</section>
 </div>