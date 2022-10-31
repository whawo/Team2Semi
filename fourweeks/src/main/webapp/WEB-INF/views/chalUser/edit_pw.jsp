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

전송 구현 완료 마지막에 취소버튼만 조금 수정화세요 

디자인 구현은 끝 났으나 form 전송이 비밀번호가 다른데 자꾸 전송된다. 무슨 문제/ 그리고 DB에 넘어가지 않음  

	디자인 해야할 것: 
	- 마지막에 취소 변경 크기 맞추기 ㅇㅇ

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
color:#3f3f3f;
} 
.sp-2{
padding-left: 30px;
font-size:16px;
font-weight:700;
color:#3f3f3f;
}
.sp-3{
padding-left: 82px;
font-size:16px;
font-weight:700;
color:#3f3f3f;
}
.sp-4{
}
.sp-5{
padding-left: 223px;
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
 
 
 /*  disabled */
input[name="userId"]:disabled{
background-color:transparent;
}
</style>
     <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
     <script type="text/javascript">    
 	/* 비밀번호 검사식 */
	// 식은 맞는데 왜 넘어가지? 
/*$(function(){
        //form에 submit 이벤트 설정
        $(".edit-form").submit(function(){
        // 정규식 검사하기 
        var newPw = $("input[name=userPw]").val();
        var regex = /^[a-zA-Z0-9]{8,16}$/;
        var judge = regex.test(newPw);
        console.log("jud" + judge);
        if(judge == true){
            return true;
        }else{
            return false;
        }
        var conPw = $("#repaetPw").val();
        if(newPw != conPw){
            return false;
            // 여기서 넘어가면 안되는데 자꾸 마이페이지로 넘어간다. 
            // 개발자도구에서 네트워크 확인해보면 페이로드 페이지 자체가 없음.. 흠... vs코드에서는 작동 잘되었음. 
        }
    });

}); */

$(function () {
	// form이 전송될 때 내부의 입력창을 모두 trigger 처리
    $(".edit-form").submit(function(){
    	$("input[name=userPw]").blur();
    	if($(".input.fail".length > 0)) {
            return false;
        }
    });
    
    $("input[name=userPw]").on("blur", function(){
    	var userPw = $(this).val();
    	 var regex = /^[a-zA-Z0-9!@#$]{8,16}$/;
         var judge = regex.test(userPw);
    	$(this).removeClass("fail");
    	if(!judge) {
    		$(this).addClass("fail");
    	}
    });
    
    $("#repeatPw").on("blur", function(){
    	var pw1= $("input[name=userPw]").val();
    	var pw2 = $("#repeatPw").val();
    	var con = pw1  == pw2;
    	$(con).removeClass("fail");
    	if(!con) {
    		$(this).addClass("fail");
    	}
    });
    
});

     
     </script>
     <body>
 <div class="container-794">
	 <div class="row center mt-92">
	 	<h2>비밀번호 변경 </h2>
	 </div>
	<!-- 회원가입처럼 새 비밀번호와 새 비밀번호 확인이 일치해야 form 전송되도록 설정 필요(jQuery) -->    
	<form action="pw" method="post" class="edit-form">
		<div class="row  center row-id">
			<span class="sp-1">아이디</span><input class="input short-text-box id-box" name="userId"  value="${userDto.userId}" disabled>
		</div>	
		<div class="row center">
		<span class="sp-2">새 비밀번호 </span><input name="userPw" class="input short-text-box short-hover pw-box1"  type="password"   placeholder="8~16자의 영문/숫자"><br>
		     <span class="fail-message sp-4">8~16자 이내 영문 소문자/대문자,숫자,특수문자(!@#$)로 입력해주세요.</span>
		</div>
	<div class="row ">
		     <span class="sp-3">새 비밀번호 확인 </span><input class="input short-text-box short-hover pw-box2"  type="password" placeholder="8~16자의 영문/숫자"  id="repeatPw"><br>
		     <span class="fail-message sp-5">비밀번호가 일치하지 않습니다.</span>
	</div>
	<div class="row center">
		     <button  class="smallbtn cancel-btn"  type="button"  id="smallbutton3"><a  href="/mypage">취소</a></button>
		     <button class="save-btn" type="submit">변경</button>
		</div>
	</form>
</div>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>