<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="챌린지 상세" name="title" />
</jsp:include>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/commons1.css">
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<style>
	div {
	/* border: 1px dotted gray; */
	      border: 1px solid transparent;
	      margin : 40px 0px;
	      vertical-align: bottom;
      }
     #chal_img {
         margin-left : 0px;
         height : 400px;
         width: 790px; 
         border-radius: 10px;
     }
     .chal-title {
         font-size: 29px;
         font-weight: bold;
     }
     span {
         font-size: 26px;
         vertical-align: top;
     }
     .img-margin {
        margin-right: 10px;
        height: 24px;
     }
     .border-line {
         border: 3px solid #AAAAAA;
         border-top: none;
         border-left: none;
         border-right: none;
     }
      .largebtn{
	     border: none;
	     font-size: 20px;
	     padding: 0.75em;
	     cursor: pointer;
	     display: inline-block;
	     text-align: center;
	     text-decoration: none;
	     border-radius: 0.5em;
	     width: 100%; 
	     height: 60px;
      }
       /* 챌린지 이미지 */
       .detail-top-img {
           position: relative;
           width : 790px;
           height: 400px;
           border-radius: 10px;
       }
       /* 챌린지 타이머 */
     .chal-timer{
         position: absolute;
         margin: -50px 0;
         background-color: #707A89;
         background : rgba(112, 122, 137, 0.7);
         color: white;
         border-bottom-left-radius: 10px;
         border-bottom-right-radius: 10px;
         height: 50px;
         width: 790px;
         /* 타이머 폰트 가운데 */
         display: flex;
         justify-content: center;
         align-items: center;
       }
       .chal-timer-font {
           font-size: 20px;
       }
     .user-img {
         width: 50px;
         height: 50px;
         border-radius: 50%;
         margin-top: 0px;
         margin-bottom: -19px;
     }
</style>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
		//챌린지 썸네일이 없으면 기본 이미지로 대체
		$(".chal-img").on("error", function(){
			$(this).attr("src", "/images/bg_default.png");
		});
		
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

<form action ="insert" method="post" >
	<input type="hidden" name="chalNo" value="${chalDto.getChalNo()}">
	
<div class="container-794">

	<%-- 이미지 --%>
	  <div class="detail-top"> 
          <img src="detail/download?chalNo=${chalDto.getChalNo()}" class="chal-img detail-top-img">
          <div class="chal-timer">
              <span class="chal-timer-font">${chalVO.getDDay()}일뒤 시작  / 타이머로 변경하기 </span>
          </div>
      </div>
      
	<%-- 챌린지 제목 --%>
	<div> 
		<span class="chal-title">${chalDto.getChalTitle()}</span>
	</div>
	
	 <%-- 참가 인원 --%>
	<div> 
		<span><img src="/images/attend_user.png" class="img-margin">${chalDto.getChalPerson()}명/10명</span>
	</div>
	
	<%-- 시작일 --%>
	<div>  
		<span><img src="/images/chal_start_date.png" class="img-margin">${chalDto.getStartDate()}</span>
		<input class="label-status label-status-start" placeholder="${chalVO.getDDay()}일뒤 시작">
	</div>
	
	 <%-- 종료일 --%>
	<div>
		<img src="/images/chal_end_date.png" class="img-margin">
		<span>~${chalVO.endDate}</span>
	</div>
	
	 <%-- 라벨 --%>
	<div> 
		<c:choose>
			<c:when test="${chalDtoRecruited.getDDay() < -28}">
				<input class="label-status" placeholder="종료">
			</c:when>
			<c:when test="${chalDtoRecruited.getDDay() < 0}">
				<input class="label-progress" placeholder="진행중">
			</c:when>
			<c:otherwise>
				<input class="label-wait" placeholder="모집중">
			</c:otherwise>
		</c:choose>
		<input class="label-category" placeholder="${chalDto.chalTopic}">
	</div>
	
	 <%-- 버튼 --%>
	<div>
		<c:choose>
				<c:when test="${participantDto==null && chalDto.getChalPerson()<10}">
					<button class="largebtn" type="submit" id="largebutton1">참가하기</button>
				</c:when>
				<c:otherwise>
				<!-- 버튼 비활성화 및 모집마감 버튼 생성 해야함 -->
					<button class="largebtn" type="submit" id="largebutton1" disabled>참가하기</button>
				</c:otherwise>
		</c:choose>
	</div>
	
	 <div>
         <h2>챌린지 리더</h2>
     </div>
     
	<div>
		<img src = "/profile/download?userId=${chalDto.userId}" width="50" height="50" class="user-img"> ${chalDto.getUserNick()}
	</div>
	
	 <%-- 구분선 --%>
	<div class="border-line"></div>
	
	 <div>
         <h2>챌린지 소개</h2>
     </div>
     
	<div> 
		${chalDto.getChalContent()}
	</div>
	
	 <div>
         <h2>인증 방법</h2>
     </div>
	
	<div> 
		${chalDto.getHowConfirm()}
	</div>
		
	<!-- 버튼 비활성화 및 모집마감 버튼 생성 해야함 -->
	<!--프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요-->
	
</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





