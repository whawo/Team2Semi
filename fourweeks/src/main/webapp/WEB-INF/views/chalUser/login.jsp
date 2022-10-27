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
        /* 
        10.27
        - 새로고침시 밑에 에러 메세지가 노출됨 
        - 아이디 치는 input창 안에 컬러가 생김 뭥야
        
        	10.26
        	디자인 수정:
        	- 에러 메세지 글자 줄바꿈 해야됨 ㅇ 
        	
        	10.24
        	디자인 수정해야할 것:
        	- container 확인해보기 사이즈 맞추기 ㅇ 
        
        	10.22	
        	디자인 수정해야할 것: 
        	- 가운데로 옮기기... 
        	
        	10.21
        	디자인 수정해야할 것:
        	- div 가운데로 옮기기
        	- 사이 간격 더 띄우기 
        	- 로그인 비밀번호 입력시 hover 색상이 검정색이 됨.. ? 왜? 지? 요? 다시 수정하기 
        	 
        	DB 수정해야할 것:
        	- 로그인 에러 구현 완료
        	- 비밀번호찾기/ 아이디 찾기 링크 걸어야 함.  
            
            10.20 
            디자인 수정해야할 것
            - 아이디창과 비밀번호 창을 중심으로 위아래로 간격 더 넓히기 
            - 로그인 밑에 비번찾기 아이디 찾기 간격 좀 더 띄우기 
            - 헤더 수정 
            
        */
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
       margin: 80px 0 0 505px;
        }
        
        /*  에러 메세지 줄바]꿈 */
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
            <div class="row center">
                <h1>로그인</h1>
                <p class="login-p1">가입하신 아이디와 비밀번호를 입력해주세요</p>
                   <p class="login-p2"> 비밀번호는 대소문자를 구분합니다.</p>
            </div>
            
            <form action="login" method="post">
            <div class="row">
                <input type="text" name="userId" class="input short-text-box short-hover" id="text-box1" placeholder="아이디"  <c:if test="${param.userId != null}">value="${param.userId}"</c:if> autocomplete="off">
                
            </div>
            <div class="row">
                <input type="password" name="userPw" class="input short-text-box short-hover" id="text-box1" placeholder="비밀번호"  autocomplete="off">
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
            <section class="row center">
                <a class="find" href="/find_pw">비밀번호 찾기</a>
                <em class="divi">|</em>
                <a class="find" href="/find_id">아이디 찾기</a>
                <em class="divi">|</em>
                <a class="find" href="/join">회원가입</a>
            </section>
        </div>
        </div>
     </body>
