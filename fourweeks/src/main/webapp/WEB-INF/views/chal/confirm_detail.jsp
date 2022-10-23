<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="챌린지 인증글" name="title"/>
</jsp:include>
<style>
	.confirm-img.no-img {
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
		//인증샷이 없으면 img 영역 미노출
		$(".confirm-img").on("error", function(){
			$(this).addClass("no-img");
		});
	});
</script>

	${confirmDto.confirmTitle}
	<br><br>
	
	<!--프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요-->
	<img src = "/images/bg_default.png" width="50" height="50">
	${confirmDto.userId}
	<br><br>
	${confirmDto.confirmDate}
	<br><br>
	<!-- 인증샷-->
	<img src = "detail/download?confirmNo=${confirmDto.confirmNo}" width="200" height="200" class="confirm-img">
	<br><br>
	${confirmDto.confirmContent}
	<br><br>
	조회 ${confirmDto.confirmRead}
	<br><br>
	좋아요 ${confrimDto.confirmLike}
	<br><br>
	댓글 <!-- 댓글 테이블과 조인 필요 -->
	<br><br>
	
	<c:if test="${loginId == confirmDto.userId}">
		<a href="edit?confirmNo=${confirmDto.confirmNo}">수정하기</a> <!-- jQuery에서 작성일 지나면 비활성화 처리, 비활성화 버튼 클릭 시 '작성한 날에만 수정할 수 있어요' 팝업 -->
	</c:if>
	
	<!-- 댓글 리스트 -->
	
	
	


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>