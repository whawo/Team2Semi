<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/headerNo.jsp">
	<jsp:param value="아이디 찾기" name="title" />
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<style>

/* row 모음 */
.row-1{
margin-left: 91px;
}
.row-2{
padding-left: 323px;
}

/* p 모음  */
.p1{
font-size: 24px;
font-weight: 700;
color: #3f3f3f;
padding-top: 40px;
}
.p2{
font-size: 14px;
color: #3f3f3f;
}

/* input 박스 */
.find-box{
border: 2px solid #AAAAAA;
border-radius: 0.5em;
width: 600px;
height: 58px;
}
/* btn  */
.btn1{
width: 600px;
margin-top: 10px;
}
/* find */
.find{
color: #3f3f3f;
font-size:12px;
}
/* error */
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
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">



	$(function() {
		$("input[name=userEmail]").on("blur", function() {
			var userEmail = $(this).val();
			$(this).removeClass("fail");
			if (!userEmail) {
				$(this).addClass("fail");
			}
		});
	});
</script>
<div class="container-794">
	<div class="row center mt-92">
	<p class="p1">아이디 찾기</p>
	</div>
	
	<div class="row center">
    	<p class="p2">등록된 이메일을 입력해주세요.</p>
    </div>
	
	<form action="find_id" method="post" class="create-form">
		<div class="row  row-1">
			<input type="text" name="userEmail" class="input short-hover find-box" placeholder="예) id@4weeks.com">
			<span class="fail-message">이메일을 입력해주세요.</span>
			<c:if test="${param.error != null}">
			     <br><span class="find-error">입력된 회원정보가 존재하지 않습니다. 비회원일 경우 회원가입 후 이용해주세요.</span>
		     </c:if>			
		     <button type="submit"  class="largebtn btn1" id="largebutton1">확인</button>
		</div>
	</form>

	<section class="row row-2">
		<a class="find" href="/find_pw">비밀번호 찾기</a>
		<em class="divi">|</em>
		<a class="find" href="/join">회원가입</a>
	</section>
</div>