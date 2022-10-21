<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지 상세</title>
</head>
<body>


</body>
</html>

<style>
	ul.list {
		list-style:none;
		padding:0;
		margin:0;
		border:1px solid gray;
		font-size:20px;
	}
	ul.list > li {
		border:1px solid gray;
		padding:0.5em;
	}
	ul.list > li:hover {
		color:#d63031;
	}
</style>
<div class="container-400">
	<div class="row center">
		<h1>챌린지 상세 정보</h1>
	</div>
	<div class="row left">
		<!-- list 태그 -->
		<ul class="list">
		    <li>챌린지 이미지 :<img src="detail/download?chalNo=${chalDto.getChalNo()}"></li>
			<li>챌린지 제목 : ${chalDto.getChalTitle()}</li>
			<li>챌린지 주제 : ${chalDto.getChalTopic()}</li>
			<li>참가 인원: ${chalDto.getChalPerson()}명/10명</li>
			<li>챌린지 시작일: ${chalDto.getStartDate()} ${chalVO.getDDay()}일뒤 시작<br>~${chalVO.endDate}
			</li>
			<button>참가하기</button>
			<li>챌린지 리더 : ${chalDto.getUserId()}</li>
			<li>챌린지 소개 : ${chalDto.getChalContent()}</li>
			<li>챌린지 인증방법 : ${chalDto.getHowConfirm()}</li>
		</ul>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





