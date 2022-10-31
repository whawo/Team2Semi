<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
	<jsp:param value="공지 게시판" name="title"/>
</jsp:include>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>
	.cancel-btn {
		width: 100px;
		margin-right: 20px;
		margin-top: 10px; 
	}
	
	.create-btn {
		width: 200px;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
	$(function(){
		$("[name=noticeContent]").summernote({
			height:350,
			minHeight:350,
		});
	});
</script>
<div id="dashboard">
	<form action="write" method="post" enctype="multipart/form-data">
	<div class="container-800 mt-40">
		<div class="row center">
			<h2>공지 작성</h2>
		</div>
		
		<div class="row left">
			<label>제목</label>
			<input class="input w-100" type="text" name="noticeTitle" required autocomplete="off">
		</div>
		
		<div class="row left">
			<label>내용</label>
			<textarea name="noticeContent"></textarea>
		</div>
		
		<div class="row left">
			<label>첨부파일(최대 1MB)</label>
			<input class="input w-100" type="file" name="attachment">
		</div>
		
		<div class="row center">
			<a href="list" class="smallbtn cancel-btn" id="smallbutton3">취소</a>
	        <button class="smallbtn create-btn" type="submit" id="smallbutton1" >등록하기</button>
		</div>
	</div>
	</form>
</div>
</body>
</html>


