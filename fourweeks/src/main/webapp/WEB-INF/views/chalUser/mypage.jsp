<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
		//프로필 이미지가 없으면 기본 아이콘으로 대체
		$(".user-img").on("error", function(){
			$(this).replaceWith("<i class='fa-solid fa-circle-user'></i>");
		});
		
		//챌린지 썸네일이 없으면 기본 이미지로 대체
		$(".chal-img").on("error", function(){
			$(this).attr("src", "/images/bg_default.png");
		});
	});
	
	//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function (event) {
        if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
          	location.href = location.href;
        }
    });
</script>
<h2>마이페이지</h2>
<ul class="list">
	<li><img src="/profile/download?userId=${myDto.userId}" width="50" height="50" class="user-img">
		${myDto.getUserNick()}</li>
	<li>${myDto.userEmail}</li>
	<li><button>계정 관리</button></li><br><br><br><br><br><br><br><br><br>
</ul>

<c:forEach var="chalDto" items="${chalDto}">
	<div>
		<img src="chal/detail/download?chalNo=${chalDto.getChalNo()}" width="200" height="200" class="chal-img"></div>
	<div>
		<a href="chal/detail?chalNo=${chalDto.chalNo}"> ${chalDto.chalTitle}</a>
	</div><br>
	<div>${chalDto.getStartDate()}~${chalDto.getEndDate()}</div><br>
	<div>${chalDto.getChalTopic()}</div>
</c:forEach>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>