<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
	<jsp:param value="공지 수정" name="title"/>
</jsp:include>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>
	.notice-img.no-img {
			display: none;
	}
	
	.cancel-btn {
		width: 100px;
		margin-right: 20px;
		margin-top: 10px; 
	}
	
	.create-btn {
		width: 200px;
	}
	textarea {
			    width: 100%;
			    border: none;
			    resize: none;
		}
</style>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
	$(function(){
		$("[name=noticeContent]").summernote({
			height:350,
			minHeight:350,
		});
		
		//첨부파일이 없으면 img 태그 가리기
		$(".notice-img").on("error", function(){
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
<div id="dashboard">
	
	<form action="edit" method="post" enctype="multipart/form-data">
	<div class="container-800 mt-40">
		<div class="row center mt-40">
			<h2>공지 수정</h2>
		</div>
			
		<div class="row left">
			<label>제목</label>
			<input class="input w-100" type="text" name="noticeTitle" value="${dto.noticeTitle}" required autocomplete="off">
		</div>
		
		<div class="row left">
			<label>내용</label>
			<textarea name="noticeContent" required>${dto.noticeContent}</textarea>
		</div>
		
		<div class="row left">
			<label>첨부파일(최대 1MB)</label>
			<img src="detail/download?noticeNo=${dto.getNoticeNo()}" class="notice-img">
			<input class="input w-100" type="file" name="attachment">
		</div>
		
		<div class="row center">
			<a href="list" class="smallbtn cancel-btn" id="smallbutton3">취소</a>
	        <button class="smallbtn create-btn" type="submit" id="smallbutton1" >수정하기</button>
		</div>
		<input type="hidden" name="noticeNo" required value="${dto.getNoticeNo()}">
	</div>
	</form>
</div>
</body>
</html>

