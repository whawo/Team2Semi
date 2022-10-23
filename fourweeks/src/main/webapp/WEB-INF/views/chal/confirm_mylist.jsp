<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="내 인증글" name="title"/>
</jsp:include>
<style>
	.confirm-img.no-img {
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
		//챌린지 썸네일이 없으면 기본 이미지로 대체
		$(".chal-img").on("error", function(){
			$(this).attr("src", "/images/bg_default.png");
		});
		
		//인증샷이 없으면 img 태그 가리기
		$(".confirm-img").on("error", function(){
			$(this).addClass("no-img");
		});
	});
</script>
	내 인증글
	<br><br>
	
	챌린지 정보
	<br><br>
	<!-- 챌린지 정보 미리보기 추가 필요 / 해당 영역클릭 시, 챌린지 상세로 이동-->
	<!-- 이미지 못불러올 때 기본이미지로 대체(jQuery로 이벤트 처리하도록 수정해야 함) -->
	<img src = "/chal/detail/download?chalNo=${chalDto.chalNo}" width="120" height="90" class="chal-img">
	<br><br>
	<c:choose>
		<c:when test="${chalVO.endDday > 0 && chalVO.endDday < 28}">
			${chalVO.endDday}일 뒤 종료
		</c:when>
		<c:when test="${chalVO.endDday == 0}">
			오늘 종료
		</c:when>
		<c:when test="${chalVO.endDday < 0}">
			종료
		</c:when>
		<%--시작 전에 인증글 리스트 조회 불가 -> 해당 기능 구현 후 아래 구문 삭제, 위 구문을 otherwise로 변경 --%>
		<c:otherwise>
			${chalVO.getDDay()}일 뒤 시작
		</c:otherwise>
		
	</c:choose>
	<br>
	${chalDto.chalTitle}
	<br>
	${chalDto.startDate} ~ ${chalVO.endDate}
	<br>
	<c:choose>
		<c:when test="${chalDto.chalTopic == '그 외'}">
			기타
		</c:when>
		<c:otherwise>	
			${chalDto.chalTopic} 
		</c:otherwise>
	</c:choose>
	&nbsp; <!-- 달성률 계산 메소드 구현 완료 후 추가 필요 -->
		
	<br><br>	
	
	<!-- 인증 화면에서 해당 챌린지가 선택된 상태가 될 수 있도록 기능 추가 필요 -->
	<a href="/chal/confirm?chalNo=${chalDto.chalNo}">인증하기</a>
	<br><br>
	
	<!-- 전체 조회 개수 세는 기능 필요 -->
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
		<!-- 인증샷이 없으면 img 태그 가리기(jquery) -->
		<img src = "detail/download?confirmNo=${list.confirmNo}" width="120" height="90" class="confirm-img">
		<br><br>
		${list.confirmTitle}
		<br>
		${list.confirmContent}
		<br>
		${list.confirmDate} 
		&nbsp; 
		<i class="fa-regular fa-eye"></i> ${list.confirmRead} 
		&nbsp;
		<!-- 좋아요 -->
		<c:if test="${isLike == null}">
			<i class="fa-regular fa-heart"></i>
		</c:if>
		<c:if test="${isLike == true}">
			<i class="fa-solid fa-heart"></i>
		</c:if>
		<c:if test="${isLike == false}">
			<i class="fa-regular fa-heart"></i>
		</c:if>
		${list.confirmLike}
		&nbsp; 
		<i class="fa-regular fa-comment"></i> 댓글수
		<br><br><br>
	</c:forEach>
	
	<!-- 페이징 -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>