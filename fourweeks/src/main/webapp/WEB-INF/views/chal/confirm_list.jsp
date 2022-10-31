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
<div class="container-794">
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
	<c:choose>
		<c:when test="${listCnt != 0}">
			<c:forEach var="list" items="${confirmList}">
				<a href="detail?confirmNo=${list.confirmNo}">
				<!-- 인증샷이 없으면 img 태그 가리기(jquery) -->
				<img src = "detail/download?confirmNo=${list.confirmNo}" width="120" height="90" class="confirm-img">
				<br><br>
				${list.confirmTitle}
				<br>
				${list.confirmContent}
				<br>
				<!--프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요-->
				<img src = "/profile/download?userId=${list.userId}" width="50" height="50" class="user-img">
				${list.userNick}
				&nbsp; 
				${list.confirmDate} 
				&nbsp; 
				<i class="fa-regular fa-eye"></i> ${list.confirmRead} 
				&nbsp;
				<i class="fa-regular fa-heart"></i> ${list.confirmLike}
				&nbsp; 
				<i class="fa-regular fa-comment"></i> ${list.replyCount}
				</a>
				<br><br><br>
			</c:forEach>
		</c:when>
		<c:otherwise>
				<h1>
					작성된
					<br>
					인증글이 없습니다.
				</h1>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${listCnt != 0}">
		<!-- 페이지 내비게이터 -->
		<div class="row center mt-40 mb-40">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${not vo.isFirst()}">
					<a href="all?chalNo=${vo.getChalNo()}&p=${vo.firstBlock()}"><i class="fa-solid fa-angles-left"></i></a>
				</c:when>
				<c:otherwise>
					<a href="#"><i class="fa-solid fa-angles-left"></i></a>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${vo.hasPrev()}">
					<a href="all?chalNo=${vo.getChalNo()}&p=${vo.prevBlock()}"><i class="fa-solid fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a href="#"><i class="fa-solid fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
			
			<!-- 숫자 -->
			<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
				<c:choose>
					<c:when test="${vo.p == i}">
						<a href="#">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="all?chalNo=${vo.getChalNo()}&p=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
			<c:choose>
				<c:when test="${vo.hasNext()}">
					<a href="all?chalNo=${vo.getChalNo()}&p=${vo.nextBlock()}"><i class="fa-solid fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="#"><i class="fa-solid fa-angle-right"></i></a>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${not vo.isLast()}">
					<a href="all?chalNo=${vo.getChalNo()}&p=${vo.lastBlock()}"><i class="fa-solid fa-angles-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="#"><i class="fa-solid fa-angles-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
		</c:if>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>