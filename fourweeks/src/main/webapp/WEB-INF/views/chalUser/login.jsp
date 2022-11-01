<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/headerNo.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
 
	<link rel="stylesheet" type="text/css" href="/css/basic.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <style>
        div{
            border: 1px dotted transparent;
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
        .row-1{
        }
		.row-2{
		margin-left: 40px;
		}
        .login-p1,
        .login-p2{
            font-size: 12px;
            color:#3f3f3f;
        }
        .login-p2{
            margin: 10px 7px 9px 10px;
        }

        body{
            line-height: 70%;
        }
        .find{
            font-size: 13px;
            color:#707070;
            text-decoration-line: none;
        }

        .login-error{
        font-size:12px;
        color: #eb6f7f;
        }
        .margin-move{
       margin: 70px 0 0 505px;
        }
        
	.error-span{
	white-space: pre;
	}
    </style>
    
     <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
     <script type="text/javascript">
     
     </script>
      <body>
<div class="row container-1200">
        <div class="container-400 margin-move">
            <div class="row center row-1" >
                <h1>로그인</h1>
                <p class="login-p1">가입하신 아이디와 비밀번호를 입력해주세요</p>
                   <p class="login-p2"> 비밀번호는 대소문자를 구분합니다.</p>
            </div>
            
            <form action="login" method="post">
            <div class="row">
                <input type="text" name="userId" class="input short-text-box short-hover" id="text-box1" placeholder="아이디"  <c:if test="${param.userId != null}">value="${param.userId}"</c:if> autocomplete="off">
                
            </div>
            <div class="row">
                <input type="password" name="userPw" class="input short-text-box short-hover" id="text-box1-1" placeholder="비밀번호"  autocomplete="off">
            </div>
            <div class="row">
                <button type="submit" class="largebtn w-100" id="largebutton1">로그인</button>
            </div>

            
             <!--  아이디/비밀번호가 일치하지 않을때. -->
         <c:if test="${param.error != null}">
		<div class="row center login-error">
			<span class="error-span">아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.</span>
		</div>
		</c:if>
		 
            </form>
            <section class="row center row-2">
                <a class="find" href="/find_pw">비밀번호 찾기</a>
                <em class="divi">|</em>
                <a class="find" href="/find_id">아이디 찾기</a>
                <em class="divi">|</em>
                <a class="find" href="/join">회원가입</a>
            </section>
        </div>
        </div>
     </body>
