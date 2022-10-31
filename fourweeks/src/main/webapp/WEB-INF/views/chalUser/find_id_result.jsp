<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/headerNo.jsp">
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<style>

/* row 모음 */
 .row-1{
            position: relative;
            z-index: 100;
            padding: 40px 60px 20px;
            border: 1px solid #e5e5e5;
            border-radius: 0.5em;
        }
        
 /* p모음 */
 .p1{
 font-size: 24px;
 font-weight: 700;
 color: #3f3f3f;
 }
 .p2{
  font-size: 14px;
 color: #3f3f3f;
 }
 
 /* lab 모음 */
 .lab-1{
 font-size: 16px;
 font-weight: 700;
 }
 /* btn */
 .btn1{
 border: 1px solid #6c7aef;
 border-radius: 0.5em;
 background-color: #6c7aef;
 color: #FFF;
 font-size: 16px;
 width: 500px;
 height: 58px;
 }
 
 /* 라디오  */
   .list-id strong{ /* 아이디와 가입일 사이의 간격( 가입일 기준으로 움직임) */
            display: inline-block;
            min-width: 230px;
            padding-right: 40px;
        }
        .list-id li{ /* 찾은 아이디 input박스와 로그인 button 사이의 간격의 간격*/
            padding-bottom: 40px;
        }
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
    
</script>
<div class="container-794">
    <div class="row center mt-92">
		<p class="p1">아이디 찾기</p>
	</div>
    
	<form action="/login" method="get">
		<div class="row center">
			<p class="p2">고객님의 정보와 일치하는 아이디 목록입니다.</p>
		</div>	
		<div class="row row-1">
		 <div class="checks small">
                    <ul class="list-id">
                        <li>
                            <strong>
                             <c:forEach var="userDto" items="${idList}">
                                <input type="radio" id="ex_rd2" name="ex_rds" >
                                    <label for="ex_rd2">
                                    </label>
                                    <label class="label-find-id lab-1">${userDto.userId}</label>
                                    </c:forEach>
                                </strong>
                            <input type="hidden"   name="userId"   value="${userDto.userId}">
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row">
				<button class="btn1" type="submit">로그인</button>
            </div>
                
	<%-- 	    <c:forEach var="userDto" items="${idList}">
		    	<input id="radio-id" name="userId" type="radio" value="${userDto.userId}"><label for="radio-id">${userDto.userId}</label><br>
		    </c:forEach>
			<br><br>
			<button type="submit">로그인</button> --%>
	</form>
	
	<section class="row center">
		<a class="find" href="/find_pw">비밀번호 찾기</a>
		<em class="divi">|</em>
		<a class="find" href="/join">회원가입</a>
	</section>
 </div>