<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 확인" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
	     <p class="p-1">비밀번호 인증</p>
	     <p class="p-2">정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p>
	 </div>
	    
	<form action="auth" method="post">
		<div class="row center">
			<input type="hidden" name="userId" value="${userDto.userId}">
 		     아이디 : ${userDto.userId}
		     <br><br>
		     비밀번호 : <input type="text" name="userPw" required placeholder="8~16자의 영문/숫자">
		     <br>
		     <c:if test="${param.error != null}">
			     <span>비밀번호를 다시 확인해주세요.</span>
		     </c:if>
		     <br><br>
		     <a id = "largebuttotn3" href="/mypage?userId=${userDto.userId}">취소</a>
		     <button type="submit">확인</button>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>