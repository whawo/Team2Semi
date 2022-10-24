<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="4weeks" name="title" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

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
</style>
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
<form action ="insert" method="post" >
	<input type="hidden" name="chalNo" value="${chalDto.getChalNo()}">
<div class="container-400">
	<div class="row center">
		<h1>챌린지 상세 정보</h1>
	</div>
	<div class="row left">
		<!-- list 태그 -->
		<ul class="list">
			<li>챌린지 이미지 :<img
				src="detail/download?chalNo=${chalDto.getChalNo()}"></li>
			<li>챌린지 제목 : ${chalDto.getChalTitle()}</li>
			<li>챌린지 주제 : ${chalDto.getChalTopic()}</li>
			<li>참가 인원: ${chalDto.getChalPerson()}명/10명</li>
			<li>챌린지 시작일: ${chalDto.getStartDate()} ${chalVO.getDDay()}일뒤 시작<br>~${chalVO.endDate}
			</li>
			<c:choose>
				<c:when test="${participantDto==null && chalDto.getChalPerson()<10}">
				<button type = "submit">참가하기</button>
				</c:when>
				<c:otherwise>
				<!-- 버튼 비활성화 및 모집마감 버튼 생성 해야함 -->
				<button type = "submit" disabled>참가하기</button>
				</c:otherwise>
			</c:choose>
			<li>챌린지 리더 :<!--프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요-->
		<img src = "#" width="50" height="50" class="user-img"> ${chalDto.getUserId()}</li>
			<li>챌린지 소개 : ${chalDto.getChalContent()}</li>
			<li>챌린지 인증방법 : ${chalDto.getHowConfirm()}</li>
		</ul>
	</div>
</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





