<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4weeks 챌린지</title>
	</head>
	<body>
		<%-- 검색 시작 --%>
		<form action="list">
			<select name="type" required>
				<option value="chal_title">모집중</option>
				<option value="chal_title">전체</option>
			</select>
			<input name="keyword" required value="${param.keyword}" placeholder="지금 나에게 필요한 습관은?">
			<button type="submit">검색</button>
		</form>
		<%-- 검색 시작 --%>
		
		<%-- 모집중 페이지 --%>
		<c:forEach var="chalDto" items="${list}">
			<div> 
				<div>
					<div>${chalDto.chalTitle}</div>
					<div>${chalDto.chalPerson}명 / 10명</div>
					<div>${chalDto.getDDay()}일 뒤 시작</div>
					<div>~${chalDto.endDate}</div>
					<div>
						<c:if test="${chalDto.getDDay() > 0}">
							<span>모집중</span>
						</c:if>
						<span>${chalDto.chalTopic}</span>
					</div>
					<br>
				</div>
			</div>
		</c:forEach>
		<%-- 모집중 페이지 끝 --%>
		
		<%-- 전체 페이지 시작 --%>
		
		<%-- 전체 페이지 끝 --%>
		
		<%-- 페이지 네비게이터 시작 --%>
		<c:choose>
			<c:when test="${not vo.isFirst()}">
				<a href="list?p=${vo.firstBlock()}">&laquo;</a>
			</c:when>
			<c:otherwise>
				<a href="#">&laquo;</a>
			</c:otherwise>
		</c:choose>
	
		<c:choose>
			<c:when test="${vo.hasPrev()}">
				<a href="list?p=${vo.prevBlock()}">&lt;</a>
			</c:when>
			<c:otherwise>
				<a href="#">&lt;</a>
			</c:otherwise>
		</c:choose>
		<!---------------------------------  -->
		<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}">
			<a href="list?p=${i}">${i}</a>
		</c:forEach>
		<!---------------------------------  -->
		<c:choose>
			<c:when test="${vo.hasNext()}">
				<a href="list?p=${vo.nextBlock()}">&gt;</a>
			</c:when>
			<c:otherwise>
				<a href="#">&gt;</a>
			</c:otherwise>
		</c:choose>
	
		<c:choose>
			<c:when test="${not vo.isLast()}">
				<a href="list?p=${vo.lastBlock()}">&raquo;</a>
			</c:when>
			<c:otherwise>
				<a href="#">&raquo;</a>
			</c:otherwise>
		</c:choose>
		<%-- 페이지 네비게이터 시작 --%>
		</body>
</html>