<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="가입 성공 " name="title"/>
</jsp:include>


	<link rel="stylesheet" type="text/css" href="basic.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
        /* 
            해야할 것! 
             - 로그인 버튼 누를 시 로그인 페이지로 이동 
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
     <script type="text/javascript">
     </script>
 <body>
        <div class="container-590">
            <div class="row center">
                <p class="p-1">가입을 축하합니다!</p>
                <p class="p-2">좋은 습관 챌린지를 함께 할 준비가 완료되었어요</p>
            </div>
            
            <div class="row center">
               <img src="./images/con.png" width="300" height="300">
            </div>

            <div class="row center">
                <button class="largebtn btn1" type="submit" id="largebutton1"><a href="#">로그인</a></button>
            </div>
        </div>
     </body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>