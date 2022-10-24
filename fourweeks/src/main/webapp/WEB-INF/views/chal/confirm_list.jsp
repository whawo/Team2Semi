<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="참가자 인증글" name="title"/>
</jsp:include> 
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<style>
	.confirm-img.no-img {
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
		//프로필 이미지가 없으면 기본 아이콘으로 대체
		$(".user-img").on("error", function(){
			$(this).replaceWith("<i class='fa-solid fa-circle-user'></i>");
		});
		
		//인증샷이 없으면 img 태그 가리기
		$(".confirm-img").on("error", function(){
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
	참가자 인증글
	<br><br>
	전체(${listCnt})
	<br><br>
	<!-- 관리자글 최신 세 개 조회하는 기능 추가 후 수정 필요 -->
	[공지] 글 제목
	<br><br>
	[공지] 글 제목
	<br><br>
	[공지] 글 제목
	<br><br>

	<c:forEach var="list" items="${confirmList}">
		<a href="/chal/confirm/detail?confirmNo=${list.confirmNo}">
		<!-- 인증샷이 없으면 img 태그 가리기(jquery) -->
		<img src = "detail/download?confirmNo=${list.confirmNo}" width="120" height="90" class="confirm-img">
		<br><br>
		${list.confirmTitle}
		<br>
		${list.confirmContent}
		<br>
		<!--프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요-->
		<img src = "#" width="50" height="50" class="user-img">
		${list.userNick}
		&nbsp; 
		${list.confirmDate} 
		&nbsp; 
		<i class="fa-regular fa-eye"></i> ${list.confirmRead} 
		&nbsp;
		<i class="fa-regular fa-heart"></i> ${list.confirmLike}
		&nbsp; 
		<i class="fa-regular fa-comment"></i> 댓글수
		</a>
		<br><br><br>
	</c:forEach>
	
	<!-- 페이징 -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>