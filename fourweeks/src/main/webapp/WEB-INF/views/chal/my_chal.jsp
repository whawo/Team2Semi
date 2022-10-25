<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="4weeks" name="title" />
</jsp:include>
<style>
ul.list {
	list-style: none;
	padding: 0;
	margin: 0;
	border: 1px solid gray;
	font-size: 20px;
}

ul.list>li {
	border: 1px solid gray;
	padding: 0.5em;
}

ul.list>li:hover {
	color: #d63031;
}
.confirm-img.no-img {
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
		//프로필 이미지가 없으면 기본 아이콘으로 대체
		$(".user-img").on("error", function(){
			$(this).replaceWith("<i class='fa-solid fa-circle-user'></i>");
		});
		
		//인증샷이 없으면 img 태그 가리기
		$(".confirm-img").on("error", function(){
			$(this).addClass("no-img");
		});
	});
	
	//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function (event) {
        if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
          	location.href = location.href;
        }
    });

</script>
<div class="container-794">
	<div class="row center">
		<h1>챌린지 상세 정보</h1>
	</div>
	<div class="row left">
		<!-- list 태그 -->
		<ul class="list">
			<li>챌린지 이미지 :<img
				src="detail/download?chalNo=${chalDto.getChalNo()}"></li>
			<li>챌린지 제목 : ${chalDto.getChalTitle()}</li>
			<li>챌린지 시작일: ${chalDto.getStartDate()}~${chalVO.endDate}</li>
			<a href = "/chal/detail?chalNo=${chalDto.getChalNo()}">챌린지 바로가기</a>
			<li>내 인증 현황</li>
			<li>참가자 인증 현황</li>
			달성률 : ${progressDto*100/28}%
		</ul>
	</div>
	
	<!-- 인증글 목록(최신 max 5개) -->
	<div class="row left">
		최신 인증글
	</div>
	<div class="row right">
		<a href="/confirm/all?chalNo=${chalDto.chalNo}">전체보기(${listCnt})</a>
	</div>
	<br><br>
	<!-- 관리자글 최신 세 개 조회하는 기능 추가 후 수정 필요 -->
	[공지] 글 제목
	<br><br>
	[공지] 글 제목
	<br><br>
	[공지] 글 제목
	<br><br>

	<c:forEach var="list" items="${confirmList}">
		<a href="/confirm/detail?confirmNo=${list.confirmNo}">
		<!-- 인증샷이 없으면 img 태그 가리기(jquery) -->
		<img src="/confirm/detail/download?confirmNo=${list.confirmNo}" width="120" height="90" class="confirm-img">
		<br><br>
		${list.confirmTitle}
		<br>
		${list.confirmContent}
		<br>
		<!--프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요-->
		<img src = "#" width="50" height="50" class="user-img">
		${list.userNick}
		&nbsp; 
		${list.confirmDate} 
		&nbsp; 
		<i class="fa-regular fa-eye"></i> ${list.confirmRead} 
		&nbsp;
		<i class="fa-regular fa-heart"></i> ${list.confirmLike}
		&nbsp; 
		<i class="fa-regular fa-comment"></i> ${list.replyCount}
		</a>
		<br><br><br>
	</c:forEach>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





