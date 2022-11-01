<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="참가자 인증글" name="title"/>
</jsp:include> 

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/commons1.css">

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
        height : 230px;
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
	ul.pagenation {
  		list-style:none;

		margin: 0;
        padding: 0;
    }
    ul.pagenation > li {
    	display: inline-block;
    	text-align:center;
    }
    ul.pagenation > li > a {
		float:left;
		margin:3px;
		width:30px;
	    height: 30px;
		color:#6c7aef;
		font-weight:bold;
	    font-size: 12px;
		border:1px solid transparent;
	    border-radius: 30%;
		text-decoration:none;
	    line-height : 2.3em;
	}
	.on {
		color: white !important;
		border:1px solid#6c7aef;
		background-color:#6c7aef;
	}
   	ul.pagenation > li > a:hover, 
   	ul.pagenation > li > a:focus {
		color: white;
		border:1px solid#6c7aef;
		background-color:#6c7aef;
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

<div class="container-794" style="margin-top:100px">

	<h2>참가자 인증글</h2>

	<h3>전체(${listCnt})</h3>
	
	<!-- 관리자글 -->
     <div class="notice-border">
     	<!-- 관리자글 최신 세 개 조회하는 기능 추가 후 수정 필요 -->
            <span class="label label-notice" >공지</span> 공지글 추가하기
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
				<br><br><br><br><br>
				<!-- 프로필, 닉네임 -->
				<img src = "/user/profile/download?userId=${list.userId}" class="user-img" style="vertical-align:middle;">
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
	<ul class=" pagenation">
		<c:choose>
			<c:when test="${not vo.isFirst()}">
				<li><a href="all?chalNo=${vo.getChalNo()}&p=${vo.firstBlock()}">&laquo;</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="#">&laquo;</a></li>
			</c:otherwise>
		</c:choose>
	
		<c:choose>
			<c:when test="${vo.hasPrev()}">
				<li><a href="all?chalNo=${vo.getChalNo()}&p=${vo.prevBlock()}">&lt;</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="#">&lt;</a></li>
			</c:otherwise>
		</c:choose>
	
	
		<!-- 숫자 -->
		<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
			<c:choose>
				<c:when test="${vo.p == i}">
					<li><a href="#" class="on">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="all?chalNo=${vo.getChalNo()}&p=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		
		<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
		<c:choose>
			<c:when test="${vo.hasNext()}">
				<li><a href="all?chalNo=${vo.getChalNo()}&p=${vo.nextBlock()}"><i class="fa-solid fa-angle-right"></i></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="#">&gt;</a></li>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${not vo.isLast()}">
				<li><a href="all?chalNo=${vo.getChalNo()}&p=${vo.lastBlock()}">&raquo;</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="#">&raquo;</a></li>
			</c:otherwise>
		</c:choose>
	  </ul>
	</div>
</div> <!-- container끝 -->
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>