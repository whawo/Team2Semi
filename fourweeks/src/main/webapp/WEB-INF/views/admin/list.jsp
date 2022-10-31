<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 사용 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="송지글 목록" name="title" />
</jsp:include>
<div class="container-600 mt-40 mb-40">
	
	<div class="row center">
	<h1>
	<a href="list">공지글 목록</a>
		<a href="write" class="btn btn-neutral">글 쓰기</a>
	</h1>
	</div>
	
	<!-- 
		검색을 위한 검색창
		- <select>는 주어진 <option>중에서만 선택이 가능하도록 하는 태그 
	-->
	<div class="row center">
	<form action="list" method="get">
		<input class="input"  name="keyword" placeholder="글 제목" required>
		<button class="btn btn-positive">검색</button>
	</form>
	</div>
	
	<div class="row">
	<table class="table table-border">
		<tbody>
			<c:forEach var="list" items="${list}">
			<tr>
				 <th><a href="detail?noticeNo=${list.noticeNo}">${list.noticeNo}</a></th>
				<td> <a href="detail?noticeNo=${list.noticeNo}">${list.noticeTitle}</a></td>
			      <td>${list.noticeTime}</td>
			     <td> <a class="btn btn-negative" href="edit?noticeNo=${list.noticeNo}">수정하기</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	${vo}
</div>
	<div class="row center">
		<ul class="pagination">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${not vo.isFirst()}">
					<li><a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&laquo;</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${vo.hasPrev()}">
					<li><a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&lt;</a></li>
				</c:otherwise>
			</c:choose>
			
			<!-- 숫자 -->
			<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
				<c:choose>
					<c:when test="${vo.p == i}">
						<li class="on"><a href="#">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
			<c:choose>
				<c:when test="${vo.hasNext()}">
					<li><a href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&gt;</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${not vo.isLast()}">
					<li><a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&raquo;</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

