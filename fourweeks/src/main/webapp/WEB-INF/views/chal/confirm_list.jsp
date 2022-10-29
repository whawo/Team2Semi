<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="참가자 인증글" name="title"/>
</jsp:include> 
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<style>
	a{
		color : black;
	}
	.confirm-img.no-img {
		display: none;
	}
	div {
		/*border : 1px solid gray; */
		border : 1px solid transparent;
	}
	 .notice-border {
        border-bottom: 1px solid #E7E7E7;
        height: 60px;
        /* 글자 세로 가운데 */
        display: flex;
        align-items: center;
        position : relative;
    }
    .confirm-title-css {
        font-weight: bold;
        margin: 10px 0;
    }
    .confirm-content-css {
        line-height: 1.7em;
        margin: 15px 0;
        vertical-align: middle;
    }
    .confirm-border {
        border-bottom: 1px solid #E7E7E7;
        padding : 5px;
        height : 200px;
    }
   .user-img {
		border-radius: 50%;
		width: 30px;
		height: 30px;
	}
	.confirm-img {
        border-radius: 10px;
		width: 90px;
        height: 90px;
	}
	.div-align {
		display : inline-block;
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

	<h2>참가자 인증글</h2>

	<h3>전체(${listCnt})</h3>
	
	<!-- 관리자글 -->
     <div class="notice-border">
     	<!-- 관리자글 최신 세 개 조회하는 기능 추가 후 수정 필요 -->
            <input class="label-notice" placeholder="공지" disabled>&nbsp; 인증글 업로드 오류 해결 방법 안내
     </div>      

 <!--인증글 목록-->
	<c:forEach var="list" items="${confirmList}">
	<a href="detail?confirmNo=${list.confirmNo}">
	
	  <div class="confirm-border" >
          <!-- 챌린지 제목 -->
          <div class="confirm-title-css" style="position:relative">
           	${list.confirmTitle} 
          </div>
          	<br><br>
          	
       	    <!-- 인증 사진, 내용 -->   
            <div class="div-align">
				${list.confirmContent}
				<br><br><br><br><br><br>
				<!-- 프로필, 닉네임 -->
				<img src = "/profile/download?userId=${list.userId}" class="user-img" style="vertical-align:middle;">
				<span>${list.userNick}</span>	
				&nbsp; 
				${list.confirmDate} 
				&nbsp; 
				<i class="fa-regular fa-eye"></i> ${list.confirmRead} 
				&nbsp;
				<i class="fa-regular fa-heart"></i> ${list.confirmLike}
				&nbsp; 
				<i class="fa-regular fa-comment"></i> ${list.replyCount}
			</div>
		       <img src = "detail/download?confirmNo=${list.confirmNo}" class="confirm-img float-right div-align"  >
			</div>	
		  </a>
		</c:forEach>
<!-- 인증글, 사진 목록 끝 -->			
	
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
</div> <!-- container끝 -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>