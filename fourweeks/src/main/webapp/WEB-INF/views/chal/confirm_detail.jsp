<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="챌린지 인증글" name="title"/>
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
		
		//인증샷이 없으면 img 영역 미노출
		$(".confirm-img").on("error", function(){
			$(this).addClass("no-img");
		});
		
	});
</script>

	${confirmDto.confirmTitle}
	<br><br>
	
	<!--프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요-->
	<img src = "/images/bg_default.png" width="50" height="50" class="user-img">
	${confirmDto.userId}
	<br><br>
	${confirmDto.confirmDate}
	<br><br>
	<!-- 인증샷-->
	<img src = "detail/download?confirmNo=${confirmDto.confirmNo}" width="200" height="200" class="confirm-img">
	<br><br>
	${confirmDto.confirmContent}
	<br><br>
	<i class="fa-regular fa-eye"></i> ${confirmDto.confirmRead}
	<br><br>
	<!-- 좋아요 -->
	<c:if test="${isLike == null}">
		<a class="heart"><i class="fa-regular fa-heart"></i></a>
	</c:if>
	<c:if test="${isLike == true}">
		<a href="like?confirmNo=${confirmDto.confirmNo}"><i class="fa-solid fa-heart"></i></a>
	</c:if>
	<c:if test="${isLike == false}">
		<a href="like?confirmNo=${confirmDto.confirmNo}"><i class="fa-regular fa-heart"></i></a>
	</c:if>
	${confirmDto.confirmLike}
	<br><br>
	<i class="fa-regular fa-comment"></i> 댓글수 <!-- 댓글 테이블과 조인 필요 -->
	<br><br>
	
	<c:if test="${loginId == confirmDto.userId}">
		<a href="edit?confirmNo=${confirmDto.confirmNo}">수정하기</a>
	</c:if>
	<br><br>	
	
	<!-- 댓글 리스트 -->
	댓글 
	
	


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>