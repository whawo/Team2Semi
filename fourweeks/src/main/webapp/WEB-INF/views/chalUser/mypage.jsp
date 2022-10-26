
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="4weeks" name="title" />
</jsp:include>

<h2>마이 페이지</h2>
<ul class="list">
	<li><img src="#" width="50" height="50" class="user-img">
		${myDto.getUserNick()}</li>
	<li>${myDto.userEmail}</li>
	<li><button>계정 관리</button></li><br><br><br><br><br><br><br><br><br>
</ul>

<c:forEach var="chalDto" items="${chalDto}">
			<a href="chal/mychal?userId=${loginId}&chalNo=${chalDto.chalNo}"><div><img
				src="chal/detail/download?chalNo=${chalDto.getChalNo()}"></div></a>
				<div>${chachalDtolVO.getDDay()}일뒤 시작</div>
				<div><button>내 인증글</button></div>
	<div>
		<a href="chal/mychal?userId=${loginId}&chalNo=${chalDto.chalNo}"> ${chalDto.chalTitle}</a>
	</div><br>
	<div>${chalDto.getStartDate()}~${chalDto.getEndDate()}</div><br>
	<div>${chalDto.getChalTopic()}</div>
</c:forEach>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>