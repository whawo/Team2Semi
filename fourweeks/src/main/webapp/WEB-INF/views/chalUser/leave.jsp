<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/headerNo.jsp">
	<jsp:param value="탈퇴 완료" name="title"/>
</jsp:include>
	<link rel="stylesheet" type="text/css" href="/css/basic.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
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
              <h1>다음에 또 만나요!</h1>
                <p class="p-2">좋은 습관을 쭉 이어나가실 수 있도록 당신을 응원합니다.</p>
            </div>
            
            <div class="row center">
               <img src="/images/join_success.png" width="300" height="300">
            </div>

        </div>
</body>