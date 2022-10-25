<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
   <link rel="stylesheet" type="text/css" href="/css/basic.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


    <style>

/* 
	10.21
	디자인 수정해야할 것:
	- 맨마지막 동이 어쩌고 왼쪽으로 좀 더 옮기
	- 회원가입 버튼 클릭시 데이터 넘기기 = 메인페이지로 이동 <a> 사용해서 좀 더 수정하기  
	- border가 전체적으로 좀 부드럽지 못한데 알아보기 
	
	DB수정해야할 것:
	- 회원가입 버튼 클릭시 데이터 넘기기 = 메인페이지로 이동 <a> 사용해서 좀 더 수정하기 
	
    10.20 
    디자인 수정해야할 것: 
    - 각 input간의 사이 간격 더 띄우기 
    - 회원가입 위 글자와 사이 간격 띄우기 
    - 회원가입 밑 글자 사이 간격 띄우기 
    - 헤더 맞추기 

    연동 해야할 것:
    - 회원가입시 -> 회원가입 성공으로 이동 
    - 로그인 -> 로그인 페이지로 이동 

    10.19 
		디자인 수정해야할 것 : 
		- 맨 마지막 계정이 있으신가요? 로그인 버튼 누르면 굵은 글씨체 ㅇ
		- 맨 마지막 문장과 글자 사이 간격 띄우기 ㅇ
		- 로그인에 밑줄 들어가야함 (맨 마지막 부)  ㅇ
		- p와 input 사이 간격을 조금 더 넓히고 글자 크기 조금 더 키우기 ㅇ
		- 각 input간 사이 간격 넓히기 ㅇ
		- 나머지 디자인 수정하지 말 것 ㅇㅇㅇㅇ

        email-drop-box에서 높이가 내가 보는 것과 실제로 홈페이지에 나온게 달라서 윈도우에서 확인 해야 
		
		연동?? 수정해야할 것: 
		- 각 name 만들어 논 것과 수정할 것 
		- 이메일 셀렉창 선택시 @가 포함된 상태로 인식이 되어야함    ㅇ
		- 회원가입 누르면 회원가입 축하페이지로  이동 시키기 ㅇ
		- 맨 밑 로그인 누르면 로그인페이지로 이동 ㅇ
        - 이메일 정규식... 근데 넘 어려움 ㅠㅠㅠㅠ... 사용자가 치는 이메일 정규식 셀렉 외에 메일도 있어야 함 !  --> 틀렸을 시 문구가 뜨지 않음..! ㅇ
        - ajax 아이디랑 닉네임 이미 등록된 아이디와 닉네임 ㅇ
*/

    
    div{
        /* border: 1px dotted transparent; */
        border: 1px dotted gray;
    }
    .a-join{
        font-size: 14px;
        font-weight: bold;
        color:#6c7aef;
        cursor: pointer;
    }
    .a-hover:hover{
        font-weight: bold;
        text-decoration-line: underline;
    }
    /* 사이사이 폭 조절  */
    .rows{
        margin: 20px 0;

    }
    /* label과 input간의 사이 간격  */
    .stbox{
        margin: 8px 0 0 0;
    }

     /* join-p* 자잘한 글자들  */
    .join-p1{
        margin: 10px 10px 0px 0px;
        font-size: 35px;
        color:#3f3f3f;
    }
    .join-p2{
        margin: 2px 0px 0px 0px;
        font-size: 14px;
        color: #3f3f3f;
    }
    .join-p3{
        margin: 5px 10px 5px 0px;
        font-size: 12px;
        color: #3f3f3f;
    }
    .join-p4{
        margin: 10px 0px 8px 240px;
        font-size: 12px;
        color: #3f3f3f;
    }
    .join-p5{
        margin: 10px 0px 8px 240px;
        font-size: 12px;
        color: #3f3f3f;
    }

    .li-1{
        list-style: none;
        max-height: 1000000px;
        text-align: -webkit-math-parent;
      }
      .email-box{
         width: 99%;
         padding: 0 0 0 5px;
     }
     .email-drop-box{
         width: 235px;
         height: 59px;
      }
      select{
         margin: 0 0 0 0;
         padding: 0 0 0 5px; /* 글자 띄우기 */
         vertical-align: bottom;
         font-weight: 400;
         writing-mode: horizontal-tb!important;
         text-rendering: auto;
         letter-spacing: normal;
         text-transform: none;
         text-indent: 0px;
         text-shadow: none;
         display: inline-block;
         align-items: center;
         white-space: pre;
         cursor: default;
       }


    .success-message,
    .fail-message,
    .NNNNN-message{
        display: none;
    }
    /* .success-message{
        color: #6c7aef
    } */
    .fail-message,
    .NNNNN-message{
        	margin-top:10px;
        color: #eb6f7f;
    }

    .input.success {
        border-color: #6c7aef;
    }
    .input.success ~ .success-message{
        display: block;
    }
    .input.fail ~ .fail-message{
        display: block;
    }
    .input.NNNNN ~ .NNNNN-message {
        display: block;
    }
 
    </style>
   <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
   <script type="text/javascript">
        function checkId(){
            var input = document.querySelector("input[name=userId]");
            var userId = input.value;
            var regex = /^[a-z0-9]{6,20}$/;
            var judge = regex.test(userId);

            input.classList.remove("success", "fail");
            if(judge){
                input.classList.add("success");
                return true;
            }else{
                input.classList.add("fail");
                return false;
            }
        }

        function checkNick(){
            var input = document.querySelector("input[name=userNick]");
            var userNick = input.value;
            var regex = /^[가-힣a-z0-9]{4,10}$/;
            var judge = regex.test(userNick);
            console.log("k"+judge);
            input.classList.remove("success", "fail");
            if(judge){
                input.classList.add("success");
                return true;
            }else{
                input.classList.add("fail");
                return false;
            }
        }

        function checkPw(){
            var input = document.querySelector("input[name=userPw]");
            var userPw = input.value;
            var regex = /^[a-zA-Z0-9!@#$]{8,16}$/;
            var judge = regex.test(userPw);

            input.classList.remove("success", "fail");
            if(judge){
                input.classList.add("success");
            }else{
                input.classList.add("fail");
            }
        }

        
        function checkPasswordRe(){
            var origin = document.querySelector("input[name=userPw]");
            var repeat = document.querySelector("#password-check");
            
            var judge = origin.value == repeat.value;
            repeat.classList.remove("success", "fail");
            if(judge){
                repeat.classList.add("success");
            }else{
                repeat.classList.add("fail");
            }
        }

        function checkEmail(){
            var input = document.querySelector("input[name=userEmail]");
            var userEmail = input.value;
            var regex =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
            var judge = regex.test(userEmail);

            input.classList.remove("success", "fail");
            if(judge){
                input.classList.add("success");
            }else{
                input.classList.add("fail");
            }
        }
        
        $(function(){
            
            $(".join-btn").click(function(){
                $.ajax({
                    url:"http://localhost:8888/rest/join",
                    method:"post",
                    success:function(result){
                        $(".join-btn").text(result);
                    }
                })
            });
            
            var inputState = {
                userIdValid:false,
                userNickValid:false,
    
            }

            $("input[name=userId]").blur(function(){
                var userId = $(this).val();
                if(!userId) return;
                $(this).removeClass("fail NNNNN NNNNY");
                if(checkId()){
                    var that = this;
                    $.ajax({
                        url:"http://localhost:8888/rest/join/id?userId="+userId,
                        method:"get",
                        success:function(result){
    
                            if(result == "NNNNY"){
                                //$("input[name=userId]").find(".overlap-message");
                                $(that).addClass("NNNNY");
                                inputState.userIdValid = true;
    
                            }else if(result == "NNNNN"){
                                //$("input=[name=userId]").find(".overlap-message").text("이미 사용중인 아이디 입니다.");
                                $(that).addClass("NNNNN");
                                inputState.userIdValid = false;
                            }
                        }
    
                    });
                }else {
                    $(this).addClass("fail");
                    inputState.userIdValid = false;
                }
            });

            $("input[name=userNick]").blur(function(){
                var userNick = $(this).val();
                if(!userNick) return;
                $(this).removeClass("fail NNNNN NNNNY");
                if(checkNick()){
                    var that = this;
                    $.ajax({
                        url:"http://localhost:8888/rest/join/nick?userNick="+userNick,
                        success:function(result){
    
                            if(result == "NNNNY"){
                                $(that).addClass("NNNNY");
                                inputState.userNickValid = true;
    
                            }else if(result == "NNNNN"){
                                $(that).addClass("NNNNN");
                                inputState.userNickValid = false;
                            }
                        }
    
                    });
                }else {
                    $(this).addClass("fail");
                    inputState.userNickValid = false;
                }
            });
        });
    </script>
<body>
    <div class="container-650">
        <div class="rows center">
            <p class="join-p1">회원 가입</p>
            <p class="join-p2">함께 해요, 좋은 습관 챌린지!</p>
        </div>

        <form action="" method="post" autocomplete="off">

            <div class="rows">
                <label>아이디</label>
                <input type="text" name="userId" class="input short-text-box short-hover stbox" id="text-box1" onblur="checkId();" autocomplete="off">
                <span class="fail-message">6~20자 이내 영문 소문자, 숫자를 입력해주세요.</span>
                <span class="NNNNN-message">이미 사용중인 아이디 입니다.</span>
            </div>

            <div class="rows">
                <label>닉네임</label>
                <input type="text" name="userNick" class="input short-text-box short-hover stbox" onblur="checkNick();" autocomplete="off">
                <span class="fail-message">4~10자 한글/영문/숫자로 입력해주세요.</span>
                <span class="NNNNN-message">이미 사용중인 닉네임 입니다.</span>
            </div>

            <div class="rows">
                <label>비밀번호</label>
                <input type="password" name="userPw" class="input short-text-box short-hover stbox" onblur="checkPw();" autocomplete="off"> 
                <span class="fail-message">8~16자 이내 영문 소문자/대문자,숫자,특수문자(!@#$)로 입력해주세요.</span>
            </div>

            <div class="rows">
                <label>비밀번호 재확인</label>
                <input type="password" id="password-check" class="input short-text-box short-hover stbox" onblur="checkPasswordRe();" autocomplete="off">
                <span class="fail-message">비밀번호를 다시 입력해주세요.</span>
            </div>

            <div class="row">
                <label>본인 확인 이메일
                    <p class="join-p3">아이디/비밀번호 찾기에 사용됩니다.</p>
                </label>
                <li class="li-1">
                    <input type="email" name="userEmail" class="input short-text-box short-hover email-box" onblur="checkEmail();" autocomplete="off">
                    <span class="fail-message">이메일을 다시 입력해주세요.</span>
                </li>
            </div>

            <div class="rows">
                <p class="join-p4">위 내용의 개인정보를 제공함에 동의합니다.</p>
                <button type="submit" class="largebtn join-btn" id="largebutton1">회원가입</button>
            </div>
                <p class="join-p5">이미 4weeks 계정이 있으신가요? <a href="/login" class="a-join a-hover">로그인</a>  </p> 
        </form>
    </div>
</body>


