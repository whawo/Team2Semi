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
		 /*transparent  */
    }
        body{
            font-family: sans-serif;
        }
        /* row 모음  */
	   .row-down{
        margin: 50px 0 50px 300px;
        }
        .row-side{
        margin-left:160px;
        }
        .row-3{
        margin-top: 40px;
        }
        /* p and span 모음  */
          p{
            color:#3f3f3f;
            font-size: 12px;
            /* 컨테이너에 따라 달라질 수 있으니 알아서 수동 조절하쇼 */
            /* margin: 상 하 좌 우  */
            margin: 20px 0px 20px 0px;
            line-height: 2%;
        }
        .p2{
            padding-bottom: 50px;
        }
            .sp-1{
        font-size: 14px;
        font-weight: 700;
          color: #3F3F3F;
        }
        .sp-2{
         font-size: 14px;
        font-weight: 700;
          color: #3F3F3F;
          margin-right: 32px;
        }
        .divi{  
            margin: 3px 4px 0 4px;
            width: 1px;
            height: 12px;
            text-indent: -999em;
            border-right: solid 1px #ccc;

            display: inline-block;
            zoom: 1;
            text-align: left;
            vertical-align: middle;
        }
        /*  input 박스 모음 */
        .id-box{
        border: 1px solid  transparent;
        width:500px;
        padding-left: 50px;
        }
        .pw-box{
        width: 390px;
         padding-left: 20px;
        }
        
        	/* 버튼 모음 */
        .cancel-btn{
        width:180px;
        height: 50px;
        }
        ok-btn{
        width: 200px;
        height:66px;
        }
        /* 에러  */
        .error{
        color:#eb6f7f;
        padding-left: 80px;
        }
    
    /*  disabled */
	input[name="userId"]:disabled{
		background-color:transparent;
	}
	.copyright {
	margin-left: 810px;
	}
   
</style>
<body>
<div class="row container-1200">
 <div class="row container-794 row-down">
	<div class="row center mt-92">
        <h2>비밀번호 인증 </h2>
         <p class="p1"> 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.<p>
    </div>
	    
	<form action="auth" method="post">
		 <div class="row row-side">
			 <input type="hidden" name="userId" value="${userDto.userId}">
             <span class="sp-1">아이디</span><input class="input short-text-box  id-box" name="userId"  value="${userDto.userId}" disabled>
            </div>
            
		<div class="row row-side">
            <span class="sp-2">비밀번호</span><input type="password" name="userPw" class="input short-text-box short-hover pw-box"  placeholder="8~16자의 영문/숫자" autocomplete="off"><br>
           <c:if test="${param.error != null}">
			     <span class="error">비밀번호를 다시 확인해주세요.</span>
		     </c:if>
            </div>
            
            <div class="row row-3 center">
            	<button type="button" onclick="location.href='/mypage';" class="smallbtn cancel-btn"   id="smallbutton3">취소</button>
				<button  class=" smallbtn save-btn" type="submit" id="smallbutton1">확인하기</button>
			 </div>
			 
		</form>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>