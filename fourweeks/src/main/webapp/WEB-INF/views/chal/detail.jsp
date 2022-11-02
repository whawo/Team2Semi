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
      #largebutton1{
        background-color: #6c7aef;  
        color: white;
        }
       /* 챌린지 이미지 */
       .detail-top-img {
           position: relative;
           margin-top : 50px;
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
       .chal-status,
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
     #largebutton1-1{
    background-color: #ebebed;
    color: #cfc9d5;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- moment 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
<script>
	$(function() {
		//챌린지 썸네일이 없으면 기본 이미지로 대체
		$(".chal-img").on("error", function() {
			$(this).attr("src", "/images/bg_default.png");
		});

		//프로필 이미지가 없으면 기본 아이콘으로 대체
		$(".user-img").on("error", function() {
			$(this).replaceWith("<i class='fa-solid fa-circle-user'></i>");
		});

		//인증샷이 없으면 img 태그 가리기
		$(".confirm-img").on("error", function() {
			$(this).addClass("no-img");
		});
		
		$.ajax({
	        //챌린지 시작일 가져오기
	        url : "http://localhost:8888/rest/chal/chal_detail?chalNo=${param.chalNo}",
	        method : "get",
	        dataType : "json",
	        //async : false,
	        success : function(resp) {
	            var sString = resp.startDate;
	            console.log(sString);
	            

	            $.ajax({
	                //챌린지 종료일 가져오기
	                url:"http://localhost:8888/rest/chal/chal_end_date?chalNo=${param.chalNo}",
	                method:"get",
	                dataType:"json",
	                //async: false,
	                success:function(resp){
	                    var eString = resp.endDate;
	                    console.log(eString);
	                   
	                    function diffDay() {
	                        var sdate = new Date(sString);
	                        var edate = new Date(eString);
	                        sdate.setHours(sdate.getHours()-9);
	                        edate.setHours(edate.getHours()+14);
	                        edate.setMinutes(edate.getMinutes()+59);
	                        edate.setSeconds(edate.getSeconds()+59);
	                        var todayTime = new Date();
	                        var diff;
	                        
	                        if(sdate > moment()) {
	                            $(".chal-status").text("시작까지");
	                            diff = sdate - todayTime;
	                        } else {
	                            $(".chal-status").text("종료까지");
	                            diff = edate - todayTime;
	                        }
	                        
	                        var diffDay = Math.floor(diff / (1000*60*60*24));
	                        var diffHour = Math.floor((diff / (1000*60*60)) % 24);
	                        var diffMin = Math.floor((diff / (1000*60)) % 60);
	                        var diffSec = Math.floor(diff / 1000 % 60);
	                        
	                        //var remainTime = document.querySelector("#remain-time");
	                        //remainTime.innerText = `${diffDay}일 ${diffHour}시간 ${diffMin}분 ${diffSec}초`;
	                        $("#remain-time").text(diffDay+"일 " + diffHour + "시간 " + diffMin + "분 " + diffSec + "초");
	                    }

	                    diffDay();
	                    setInterval(diffDay, 1000);

	                }
	            });
	        }
	    });
	});

	// 뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function (event) {
        if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
          	location.href = location.href;
        }
    });
	
	// 참가하기 눌렀을때 confirm 받기
	$(function() {
		$(".confirm-form").submit(function (e) {
	        var choice = window.confirm("참가하시겠습니까?");
	        if (!choice) {
	            return false;
	        }
	    });
	});
</script>

<form action ="insert" method="post" class="confirm-form">
	<input type="hidden" name="chalNo" value="${chalDto.getChalNo()}">
	
<div class="container-794">

	<%-- 이미지 --%>

	  <div class="detail-top" style="margin-top:100px;"> 
          <img src="detail/download?chalNo=${chalDto.getChalNo()}" class="chal-img detail-top-img  mt-92" onerror=" this.onerror=null; this.src='/images/bg_default.png';" >

          <div class="chal-timer">
        <c:choose>
		<%-- <c:when test="${chalVO.getEndDday() > 0 && chalVO.getEndDday() < 28}">
			${chalVO.getEndDday()}일 뒤 종료
		</c:when>
		<c:when test="${chalVO.getEndDday() == 0}">
			오늘 종료
		</c:when> --%>
		<c:when test="${chalVO.getEndDday() < 0}">
			종료
		</c:when>
		<%-- <c:when test="${chalVO.getDDay() == 1}">
			내일부터 시작
		</c:when>
				<c:when test="${chalVO.getDDay() == 0}">
			오늘 시작
		</c:when> --%>
		<c:otherwise>
			<span class="chal-status"></span>
				&nbsp;
			<span class="chal-timer-font" id="remain-time"></span>
		</c:otherwise>
	    </c:choose>
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

		<span class="label label-status" > <c:choose>
		<c:when test="${chalVO.getEndDday() > 0 && chalVO.getEndDday() < 28}">
			${chalVO.getEndDday()}일 뒤 종료
		</c:when>
		<c:when test="${chalVO.getEndDday() == 0}">
			오늘 종료
		</c:when>
		<c:when test="${chalVO.getEndDday() < 0}">
			종료
		</c:when>
		<c:when test="${chalVO.getDDay() == 1}">
			내일부터 시작
		</c:when>
				<c:when test="${chalVO.getDDay() == 0}">
			오늘 시작
		</c:when>
		<%--시작 전에 인증글 리스트 조회 불가 -> 해당 기능 구현 후 아래 구문 삭제, 위 구문을 otherwise로 변경 --%>
		<c:otherwise>
			${chalVO.getDDay()}일 뒤 시작
		</c:otherwise>
	    </c:choose></span>

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
				<span class="label label-status" >종료</span>
			</c:when>
			<c:when test="${chalDtoRecruited.getDDay() < 0}">
				<span class="label label-ing" >진행중</span>
			</c:when>
					<c:when test="${chalDtoRecruited.getDDay() == 0}">
				<span class="label label-ing" >진행중</span>
			</c:when>
			<c:otherwise>
				<span class="label label-wait" >모집중</span>
			</c:otherwise>
		</c:choose>
		<span class="label label-category" >진행중</span>
	</div>
	
	 <%-- 버튼 --%>
	<div>
			<c:choose>
					<c:when test="${participantDto==null && chalDto.getChalPerson()<10}">
						<button class="largebtn" type="submit" id="largebutton1">참가하기</button>
					</c:when>
					<c:otherwise>
					<!-- 버튼 비활성화 및 모집마감 버튼 생성 해야함 -->
						<button class="largebtn" type="submit" id="largebutton1-1"   style="pointer-events: none" disabled>참가하기</button>
					</c:otherwise>
			</c:choose>
	</div>
	
	 <div>
         <h2>챌린지 리더</h2>
     </div>
     
	<div>
		<img src = "/user/profile/download?userId=${chalDto.userId}" width="50" height="50" class="user-img"> ${chalDto.getUserNick()}
	</div>
	
	 <%-- 구분선 --%>
	<div class="border-line"></div>
	
	 <div>
         <h2>챌린지 소개</h2>
     </div>
     
	<div> 
		<pre>${chalDto.getChalContent()}</pre>
	</div>
	
	 <div>
         <h2>인증 방법</h2>
     </div>
	
	<div> 
		<pre>${chalDto.getHowConfirm()}</pre>
	</div>
		
</div>
 
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





