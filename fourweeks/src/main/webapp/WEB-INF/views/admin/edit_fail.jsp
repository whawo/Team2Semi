<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지글 오류" name="title" />
</jsp:include>


<div class="container-600">
	<div class="row center">
		<h1>존재하지 않는 번호입니다</h1>
	</div>
	<div class="row center">
		<h2><a href="list">목록 보기</a></h2>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>