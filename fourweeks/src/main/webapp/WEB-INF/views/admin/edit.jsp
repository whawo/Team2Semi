<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
	$(function(){
		$("[name=noticeContent]").summernote({
			height:350,
			minHeight:350,
		});
	});
</script>

<form action="edit" method="post" enctype="multipart/form-data">
<%-- 답글이라면 부모글번호를 추가로 전송하도록 처리 --%>
<input type="hidden" name="noticeNo" required value="${dto.getNoticeNo()}">
<div class="container-800 mt-40">
	<div class="row left">
		<label>제목</label>
		<input class="input w-100" type="text" name="noticeTitle" value="${dto.noticeTitle}"  required>
	</div>
	
	<div class="row left">
		<label>내용</label>
		<textarea name="noticeContent" required>${dto.noticeContent}</textarea>
	</div>
	
	<div class="row left">
		<label>첨부파일(1개당 1MB. 최대 10MB 가능)</label>
		<img src="detail/download?noticeNo=${dto.getNoticeNo()}" class="chal-img detail-top-img  mt-92">
		<input class="input w-100" type="file" name="attachment" multiple>
	</div>
	
	<div class="row right">
		<a class="btn btn-neutral" href="list">목록으로</a>
		<button class="btn btn-negative" type="submit">수정</button>
	</div>
</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
