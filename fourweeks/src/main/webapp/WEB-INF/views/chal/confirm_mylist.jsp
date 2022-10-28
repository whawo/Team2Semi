<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="내 인증글" name="title"/>
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
    a {
    	color : black;
    }
	.confirm-img.no-img {
		display: none;
	}
	.confirm-img {
        border-radius: 10px;
		width: 90px;
        height: 90px;

	}
	div {
	border : 1px solid  transparent; 
	 /* border : 1px solid gray;*/
	}
	/*헤더에 밀려 글자가 우측으로 정렬되므로 margin 부여 */
	h2 { 
		margin-top : 30px;
	}
	/*다단배치 */
    .first {
        display: flex;
        flex-direction: row;
    }
    .first > div {
        flex-grow: 1;
    }
    .chal-info-img {
        width: 280px;
        height: 210px;
        border-radius: 10px;
    }
    .notice-border {
        border-bottom: 1px solid #E7E7E7;
        height: 60px;
        /* 글자 세로 가운데 */
        display: flex;
        align-items: center;
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
    }
     /* pagenavigation */
     ul.page{
        list-style: none;  /*li 점 없애기*/
        margin: 0;
        padding: 0;
        font-size: 16px;
        color: #6c7aef;
        text-align: center;
        
    }
    ul.page > li{
        display: inline-block; /*일렬로 정렬*/
        border: 1px solid transparent; /*투명한 네모 상자 */
        border-radius: 30%;
        padding: -0.5em; /*사이 간격*/
        line-height: 0.5em; /*글자 표시 높이*/
        margin: 0.5em; /*글자 사이 간격 이거는 사이사이 간격*/
        min-width: 1em; /*글자 사이 간격 더 크게 + border도 크게 */
        text-align: center; /*상자안에 글자 중앙에 */
        cursor: pointer;
        width: 24px;
        height: 24px;
    }
    /* pagenavigation 번호에 커서대면 나타내는 표시  */
    ul.page > li:hover,
    ul.page > li > a:hover{
        border-color: #6c7aef; /*커서 대면 상자표시*/
        background-color: #6c7aef;
        color: white;
        font-weight: bold;
        cursor: pointer;
    }
    ul.page > li > a {
        display:block;
        width: 100%;
        color: #6c7aef;
        text-decoration: none;
        font-weight: bold;
    }
    .detail-top-img {
        position: relative;
        width : 790px;
        height: 400px;
        border-radius: 10px;
    }
    /* 버튼 */
    .navbtn{
        border: none;
        font-size: 16px;
        cursor: pointer;
        text-decoration: none;
        border-radius: 0.5em;
        font-weight: bold;
        /* 글자 가운데 정렬 */
        display: flex;
        align-items:center; 
        justify-content: center;
    }
    #navbutton1{
        background-color: #6c7aef;
        color: white;
    }
    /* label 몇일 뒤 시작 */
    .label-status {
        border: none;
        border-radius: 3px;
        width: 80px;
        height: 27px;
        background-color: #DDDDDD;
        text-align: center;
        font-size: 12px;
        font-weight: bold;
    }
    .label-status::placeholder{
        color: #707070;
    }

    /* label 모집카테고리*/
    .label-category{
        border: none;
        border-radius: 3px;
        width: 40px;
        background-color: #D5E9FA;
        font-size: 13px;
        font-weight: bold; 
        /* 글자 가운데 */
        display: flex;
        align-items:center; 
        justify-content: center;
    }
    .label-category::placeholder{
        color: #0084F3;
    }
    /* label 달성률 상태 */
    .label-achieve {
        border: none;
        border-radius: 3px;
        width: 115px;
        height: 30px;
        background-color: #F8E4E7;
        text-align: center;
        font-size: 13px;
        font-weight: bold;
         /* 글자 가운데 */
        display: flex;
        align-items:center; 
        justify-content: center;
    }
    .label-achieve::placeholder{
        color: #ED7584;
    }
    /* label 여러개 나란히 */
    .label-align {
        display: inline-block;
    }
	.confirm-empty {
		height : 100px;
		display: flex;
		align-items:center; 
		justify-content: center;
	}
	h3 {
		margin : 40px 0;
	}
	.user-img {
	border-radius: 50%;
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
	
	//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function (event) {
        if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
          	location.href = location.href;
        }
    });
</script>

<div class="container-794">

	<h2 style="margin-top : 100px;">내 인증글</h2>

	<h3>챌린지 정보</h3>

<!--3칸 다단-->
<div class="row first" style="margin-bottom: 60px;">
<!-- 해당 영역클릭 시, 챌린지 상세로 이동하도록 처리 -->
<a href="/chal/detail?chalNo=${chalDto.chalNo}">
 <!--챌린지 개설이미지 -->
	<div>  <!-- 1단 -->
		<img src="/chal/detail/download?chalNo=${chalDto.chalNo}" class="chal-img chal-info-img">
	</div>

<div>  <!-- 2단 시작 -->
	<div>  <!-- label -->
		<c:choose>
		<c:when test="${chalVO.endDday > 0 && chalVO.endDday < 28}">
			<input class="label-status" placeholder="${chalVO.endDday}일 뒤 종료" disabled>			
		</c:when>
		<c:when test="${chalVO.endDday == 0}">
			<input class="label-status" placeholder="오늘 종료" disabled>			
		</c:when>
		<c:when test="${chalVO.endDday < 0}">
			<input class="label-status" placeholder="종료" disabled>		
		</c:when>
		<%--시작 전에 인증글 리스트 조회 불가 -> 해당 기능 구현 후 아래 구문 삭제, 위 구문을 otherwise로 변경 --%>
		<c:otherwise>
    		<input class="label-status" placeholder="${chalVO.getDDay()}일 뒤 시작" disabled>
		</c:otherwise>
		</c:choose>	
    </div>
    
    <div>  <!-- 챌린지 제목 -->
        <h3>${chalDto.chalTitle}</h3>
    </div>
    
     <div style="margin: 20px 0;"> <!-- 챌린지 기간 -->
         <span>${chalDto.startDate} ~ ${chalVO.endDate}</span>
     </div>

	 <div class="label-align"> <!-- 챌린지 종류-->
     <c:choose>
		<c:when test="${chalDto.chalTopic == '그 외'}">
			<input class="label-category" placeholder="기타" disabled> 
		</c:when>
		<c:otherwise>	
		 	<input class="label-category" placeholder="${chalDto.chalTopic}" disabled> 
		</c:otherwise>
	</c:choose>
	 </div>
	 
	 <div class="label-align"> <!-- 달성률 -->
         <input class="label-achieve" placeholder="현재 달성률 ??%" disabled> <!-- 달성률 계산 메소드 구현 완료 후 추가 필요 -->
     </div>            
</a>
</div> <!-- 2단 끝 -->

<div> <!-- 3단 시작 -->
	 <div class="row "> <!-- 인증하기 버튼 -->
	<!-- 인증 화면에서 해당 챌린지가 선택된 상태가 될 수 있도록 챌린지 번호 전달 -->
	<!-- 챌린지 시작 전에 인증하기 버튼 비활성화(jquery) -->
	 	<button class="navbtn" type="submit" id="navbutton1"><a href="write?chalNo=${chalDto.chalNo}" class="btn navbtn" id="navbutton1">인증하기</a></button>
	 </div>
</div> <!-- 3단 끝 -->
</div> <!-- 다단 끝 -->

 	<!-- 인증글  목록/공지-->
       <h3>전체(${listCnt})</h3>
       
     <!-- 관리자글 -->
     <div class="notice-border">
     	<!-- 관리자글 최신 세 개 조회하는 기능 추가 후 수정 필요 -->
            <input class="label-notice" placeholder="공지" disabled>&nbsp; 인증글 업로드 오류 해결 방법 안내
     </div>     
     
     <!--인증글 목록-->
	<c:forEach var="list" items="${confirmList}">
	<a href="detail?confirmNo=${list.confirmNo}">
      <div class="confirm-border">
           <div class="confirm-title-css"> <!-- 챌린지 제목 -->
           	${list.confirmTitle} 
           </div>
            
            <div class="row first"> <!-- 인증 사진, 내용 -->   
            	<div class="confirm-content-css">         
					${list.confirmContent}
					<br><br>
					${list.confirmDate} 
					&nbsp; 
					<i class="fa-regular fa-eye"></i> ${list.confirmRead} 
					&nbsp;
					<i class="fa-regular fa-heart"></i> ${list.confirmLike}
					&nbsp; 
					<i class="fa-regular fa-comment"></i> ${list.replyCount}
				</div>

				<div class="confirm-content-css">
           			<img src = "detail/download?confirmNo=${list.confirmNo}" class="confirm-img">
              	</div>					
		 	</div> <!-- 인증글, 사진 목록 끝 -->			
		</c:forEach>

	<div  class="confirm-empty">
		 <c:if test="${listCnt == 0}">
	      		<span>작성한 인증글이 없습니다</span>
	      </c:if>
	 </div>
    </div> <!-- 인증글 목록 끝 -->    
   </a>

	<!-- 페이지 내비게이터 -->
	<div class="row center">
	<ul class="page">
	<!-- 맨처음 -->
		<li>
			<c:choose>
				<c:when test="${not vo.isFirst()}">
					<a href="mylist?chalNo=${chalDto.chalNo}&p=${vo.firstBlock()}"><i class="fa-solid fa-angles-left"></i></a>
				</c:when>
				<c:otherwise>
					<a href="#"><i class="fa-solid fa-angles-left"></i></a>
				</c:otherwise>
			</c:choose>
		</li>
		
		<!-- 이전 -->
		<li>
			<c:choose>
				<c:when test="${vo.hasPrev()}">
					<a href="mylist?chalNo=${chalDto.chalNo}&p=${vo.prevBlock()}"><i class="fa-solid fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a href="#"><i class="fa-solid fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
		</li>
		
		<!-- 숫자 -->
		<li>
			<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
					<c:choose>
						<c:when test="${vo.p == i}">
							<a href="#">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="mylist?chalNo=${chalDto.chalNo}&p=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
			</c:forEach>
		</li>
		
		<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
		<li>
			<c:choose>
				<c:when test="${vo.hasNext()}">
					<a href="mylist?chalNo=${chalDto.chalNo}&p=${vo.nextBlock()}"><i class="fa-solid fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a href="#"><i class="fa-solid fa-angle-right"></i></a>
				</c:otherwise>
			</c:choose>
		</li>
		<li>
		<c:choose>
			<c:when test="${not vo.isLast()}">
				<a href="mylist?chalNo=${chalDto.chalNo}&p=${vo.lastBlock()}"><i class="fa-solid fa-angles-right"></i></a>
			</c:when>
			<c:otherwise>
				<a href="#"><i class="fa-solid fa-angles-right"></i></a>
			</c:otherwise>
		</c:choose>
		</li>
	</div>
</div>	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>