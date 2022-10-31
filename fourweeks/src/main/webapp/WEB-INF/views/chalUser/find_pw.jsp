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
	
	/* row 모음 */
	.row-2{
	margin-left: 158px;
	}
	.row-3{
	margin-left: 91px;
	}
	
	/* p 모음 */
	.p1{
	font-size: 24px;
	font-weight: 700;
	color: #3f3f3f;	
	}
		.p2{
	padding-top: 10px;
	font-size: 14px;
	color: #3f3f3f;	
	}
		.p3{
		padding-top: 10px;
	font-size: 14px;
	color: #3f3f3f;	
	}
	/* input 박스 */
	.input{
	width: 500px;
	margin-top: 20px;
	}
	/* btn 모음 */
	.btn1{
	width: 500px;
	}
	/* a 태그 모음 */
	.find{
	color: #3f3f3f;
	}
	
	/* span */
	.sp2{
	margin-right: 130px;
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
    <div class="row center mt-92">
		<p class="p1">비밀번호 찾기</p>
	</div>
    
    <div class="row center">
   	 	<p class="p2">등록된 아이디와 이메일을 입력해주세요.</p>
		<p class="p3">본인 확인 후 비밀번호를 다시 설정할 수 있습니다.</p>
    </div>
    
    <form action="find_pw" method="post">
		<div class="row row-2 "> 
			<input type="text" name="userId" class="input short-text-box short-hover" placeholder="아이디">
			<span class="fail-message">이메일을 입력해주세요.</span>
			<input type="text" name="userEmail" class="input short-text-box short-hover" placeholder="예) id@4weeks.com"><br>
			<c:if test="${param.error != null}">
			     <span class="find-error sp-2">입력된 회원정보가 존재하지 않습니다. 비회원일 경우 회원가입 후 이용해주세요.</span>
		     </c:if>			
		     <br><br>
		     <button type="submit" class="largebtn btn1" id="largebutton1">확인</button>
		</div>
	</form>

	<section class="row center row-3">
		<a class="find" href="/find_pw">비밀번호 찾기</a>
		<em class="divi">|</em>
		<a class="find" href="/join">회원가입</a>
	</section>
 </div>