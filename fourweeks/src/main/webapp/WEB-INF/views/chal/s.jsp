<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지글 수정" name="title" />
</jsp:include>

<form action="edit" method="post" enctype="multipart/form-data">
<input type="hidden" name="no" required value="${dto.getNoticeNo()}">

<div class="container-500 mt-40">
	<div class="row center">
		<h1>공지글 수정</h1>
	</div>
	
	<div class="row left">
		<label>제목</label>
		<input class="input w-100" type="text" name="noticeTitle" required value="${dto.noticeTitle}" autocomplete="off">
	</div>
	
	<div class="row left">
		<label>내용</label>
		<textarea name="noticeContent" class="input w-100" rows="10" required>${dto.noticeContent}</textarea>
		<img src="detail/download?noticeNo=${dto.getNoticeNo()}" class="chal-img detail-top-img  mt-92">
		<input type="file" name="attachment" accept="jpg, png">
		<button type="button">삭제</button>
		<br><br>
		<a href = "detail?noticeNo=${dto.getNoticeNo()}">취소</a>
		
	</div>
	
	<div class="row right">
		<a href="list" class="btn btn-neutral">목록</a>
		<button class="btn btn-negative" type="submit">수정</button>
	</div>
</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
  
 