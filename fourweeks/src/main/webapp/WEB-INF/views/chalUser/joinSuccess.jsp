<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/headerNo.jsp">
	<jsp:param value="가입 완료" name="title"/>
</jsp:include>
	<link rel="stylesheet" type="text/css" href="/css/basic.css"> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        /* 
        	10.31 
        	- 로그인 버튼 클릭시 로그인 페이지로 이동 구현 
        
            10.21
        	- 로그인 에러 구현 완료 
            10.20 
            디자인 수정해야할 것
            - 아이디창과 비밀번호 창을 중심으로 위아래로 간격 더 넓히기 
            - 로그인 밑에 비번찾기 아이디 찾기 간격 좀 더 띄우기 
            - 헤더 수정 
            
        */
        body{
            font-family: sans-serif;
        }
        a{
            color:#FFFFFF;
        }
        .p-1{
            font-size: 24px;
            font-weight: bold;
            color: #3F3F3F;
            margin-bottom: 10px;
        }
        .p-2{
            font-size: 12px;
            color:#3F3F3F;
            margin-bottom: 100px;

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
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
     <script type="text/javascript">

     </script>
 <body>
        <div class="container-590">
            <div class="row center">
                <p class="p-1">가입을 축하합니다!</p>
                <p class="p-2">좋은 습관 챌린지를 함께 할 준비가 완료되었어요</p>
            </div>
            
            <div class="row center">
               <img src="/images/join_success.png" width="300" height="300">
            </div>

            <div class="row center">
                <button class="largebtn btn1" type="button" id="largebutton1" onclick="location.href='/login';">로그인</button>
            </div>
        </div>
     </body>
</html>