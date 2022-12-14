<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/headerNo.jsp">
	<jsp:param value="회원 전용 페이지" name="title"/>
</jsp:include>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
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
        .row-2{
        
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
        .join-btn{
        margin-top: 10px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     <script type="text/javascript">

     </script>
 <body>
 <div class="container-1200">
        <div class="container-590">
            <div class="row center mt-92">
                <p class="p-1">로그인이 필요한 서비스입니다.</p>
                <p class="p-2">로그인하고 4weeks의 다양한 서비스를 즐겨보세요.</p>
            </div>
            
            <div class="row center">
               <img src="${pageContext.request.contextPath}/images/join_success.png" width="200" height="200">
            </div>

            <div class="row row-2 center">
                <button class="largebtn btn1 login-btn"  id="largebutton1" onclick="location.href='${pageContext.request.contextPath}/user/login';">로그인</button>
                <button class="largebtn btn1 join-btn" id="largebutton3"  onclick="location.href='${pageContext.request.contextPath}/user/join';">회원가입</button>
            </div>
        </div>
</div>
     </body>
</html>