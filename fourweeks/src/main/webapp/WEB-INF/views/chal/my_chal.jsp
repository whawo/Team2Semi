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
</style>
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
			<li>챌린지 시작일: ${chalDto.getStartDate()}~${chalVO.endDate}</li>
			<a href = "/chal/detail?chalNo=${chalDto.getChalNo()}"><button>챌린지 바로가기</button></a><br>
			<a href="/chal/mychal?userId=${chalDto.userId}&chalNo=${chalDto.chalNo}">내 인증 현황</a>
			<a href="/chal/allchal?chalNo=${chalDto.chalNo}">참가자 인증 현황</a><br>
			달성률 : ${progressDto*100/28}%
		</ul>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





