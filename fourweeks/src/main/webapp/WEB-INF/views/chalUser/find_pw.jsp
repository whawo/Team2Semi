<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/headerNo.jsp">
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<style>
	.fail-message {
		display: none;
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
    $(function () {
		// form이 전송될 때 내부의 입력창을 모두 trigger 처리
	    $(".get-verify-form").submit(function(){
	    	$("input[name=userId]").blur();
	    	$("input[name=userEmail]").blur();
	    	if($(".input.fail".length > 0)) {
                return false;
            }
	    });
	    
	    $("input[name=userEmail]").on("blur", function(){
	    	var userEmail = $(this).val();
	    	$(this).removeClass("fail");
	    	if(!userEmail) {
	    		$(this).addClass("fail");
	    	}
	    });
	    
	    $("input[name=userId]").on("blur", function(){
	    	var userId = $(this).val();
	    	$(this).removeClass("fail");
	    	if(!userId) {
	    		$(this).addClass("fail");
	    	}
	    });
	});
</script>
<div class="container-794">
    <div class="row center">
		비밀번호 찾기
	</div>
    
    <div class="row center">
    	등록된 아이디와 이메일을 입력해주세요.
		<br>
		본인 확인 후 비밀번호를 다시 설정할 수 있습니다.
    </div>
    
    <form action="find_pw" method="post">
		<div class="row center"> 
			<input type="text" name="userId" class="input" placeholder="아이디">
			<input type="text" name="userEmail" class="input" placeholder="예) id@4weeks.com"> <br> <br>
			<span class="fail-message">이메일을 입력해주세요.</span> <br> <br>
			<c:if test="${param.error != null}">
			     <span class="find-error">입력된 회원정보가 존재하지 않습니다. 비회원일 경우 회원가입 후 이용해주세요.</span>
		     </c:if>			
		     <br><br>
		     <button type="submit">확인</button>
		</div>
	</form>

	<section class="row center">
		<a class="find" href="/find_pw">비밀번호 찾기</a>
		<em class="divi">|</em>
		<a class="find" href="/join">회원가입</a>
	</section>
 </div>