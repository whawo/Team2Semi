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
	a {
		color : black;
	}
	div{
	/*border: 0.2px dotted gray;*/ 
	   border: 0.2px dotted transparent;
       margin: 40px 0px;
      }
      .chal-title {
          font-size: 29px;
          font-weight: bold;
      }

       span {
          font-size: 26px;
          vertical-align: middle;
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

      .largebtn {
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
       #largebutton3{
           border:solid;
           border-color: #6c7aef;
           border-width: 2px 2px 2px 2px;
           background-color: white;
           color: #6c7aef;
       }

        /* tab menu */
     ul.tabs {
	     color: #AAAAAA;
	     position:relative;
	     float:left;
	     list-style: none;
	     width: 100%;
	     margin:0px 0px 30px 8px;
	     padding: 0;
     }

     ul.tabs li {
	     float: left;
	     border-bottom : 2px solid#AAAAAA;
	     text-align:center;
	     cursor: pointer;
	     width:50%;
	     padding: 0;
	     line-height: 50px;
	     height:50px;
     }
     ul.tabs li.active {
	     border-bottom-color : #6c7aef;
	     color: #6c7aef;
	     font-weight:bold;
     }

     .tab_container {
	     position:relative;
	     float:left;
	     width:100%;
	     margin-top:0;
     }

     .tab_content {
         border: none;
     }
      /* progressbar */
      progress {
     -webkit-appearance: none;    /* 기존 bar style 숨김*/
     appearance: none;
     }
     progress::-webkit-progress-bar {
       width: 790px;   /*bar 전체 길이 */
       height: 15px;   /*bar 두께 */
       background-color: #e5e6f9;  
       border: none;
       border-radius: 20px;
     } 
     progress::-webkit-progress-value {
       background-color:  #6c7aef;
       border-radius: 20px;
     }
     .bar-percent {
       font-weight: bold;
       font-size: 20px;
       margin: 5px 0;
       padding: 0 5px;
       color: #6c7aef;
     }
     /* 다단배치 */
     .first {
		display: flex;
		flex-direction: row;
     }
     .first > div {
		flex-grow: 1;
     }
     .flexbox {
       margin: 0px;
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
	      padding: 0em; /*사이 간격*/
	      line-height: -0.5em; /*글자 표시 높이*/
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
   	 .div-align {
   		display : inline-block;
   	}
	.notice-border {
        border-bottom: 1px solid #E7E7E7;
        height: 60px;
        /* 글자 세로 가운데 */
        display: flex;
        align-items: center;
        margin : 0;
 	}
 	.confirm-empty {
		height : 100px;
		display: flex;
		align-items:center; 
		justify-content: center;
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
   	.confirm-img.no-img {
		display: none;
	}
	.confirm-img {
        border-radius: 10px;
		width: 90px;
        height: 90px;
	}

    .confirm-img.no-img {
		display: none;
	}

    .days.is-confirm {
    	color:red;
    	font-weight: bold;
    }
     .user-img {
	border-radius: 50%;
	width: 30px;
	height: 30px;
	}
	.nick-size {
		font-size :  15px;
	}

	.my-confirm {
		width: 380px;
		margin: 9px auto;
		text-align:center;
	}
	.my-confirm li {
		margin: 3px 0;
		padding: 0.5em;
		display: inline-block;
		justify-content: center;
	    align-items: center;
	    width: 50px;
	    height: 82px;
	    font-size:16px;
	    list-style: none;
	    line-height: 34px;
	}
	.not-yet {
		color: #d9d9d9;
	}
	.is-confirm > i {
		color: #6C7AEF;
	}

</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
//tab
    $(function () {
	    $(".tab_content").hide();
	    $(".tab_content:first").show();
	
	    $("ul.tabs li").click(function () {
		    $("ul.tabs li").removeClass("active").css("color", "#AAAAAA");
		    $(this).addClass("active").css("color", "#6c7aef");
		    $(".tab_content").hide();
		    var activeTab = $(this).attr("rel");
		    $("#" + activeTab).show();
	    });
		
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
		
		$.ajax({
			//내 인증글 작성 일차를 리스트로 가져오기
			url : "http://localhost:8888/rest/chal/confirm_days?chalNo=${param.chalNo}&userId=${loginId}",
			method : "get",
			dataType : "json",
			//async : false,
			success : function(resp) {
				//가져온 리스트를 배열로 만들기
				var values = [];
                for(var i = 0; i < resp.length; i++) {
                	values.push(resp[i].confirmDays);
                }
                //console.log(values);
                
                //1~28일 배열 생성(인덱스 조회용)
                var arrDays = [];
        		for (var i = 1; i <= 28; i++) {
        			arrDays.push(i);
        		}
        		
        		//1~28일 배열에서 내 인증글 작성 일차와 일치하는 인덱스를 searchResult 배열에 저장
				var searchResult = [];
				for(var i = 0; i < arrDays.length; i++){
					var index = arrDays.indexOf(values[i]);
					if (index != -1) {
					    searchResult.push(index);
					};
				}
				
				//searchResult를 인덱스로 갖는 li에 스타일 적용
				$(".my-confirm li").removeClass("is-confirm");
				for(var i = 0; i < searchResult.length; i++) {
					$(".my-confirm li").eq(searchResult[i]).addClass("is-confirm");
				}
			}
		});
	});


	//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function(event) {
		if (event.originalEvent.persisted
			|| (window.performance && window.performance.navigation.type == 2)) {
				location.href = location.href;
		}
	});

</script>

<div class="container-794">

	<%-- 이미지 --%>
	  <div class="detail-top" style="margin-top:120px"> 
          <img src="detail/download?chalNo=${chalDto.getChalNo()}" class="chal-img detail-top-img">
          <div class="chal-timer">
              <span class="chal-timer-font">${chalVO.getDDay()}일뒤 시작  / 타이머로 변경하기 </span>
          </div>
      </div>
 
 
        <%-- 챌린지 제목 --%>
	<div> 
		<span class="chal-title">${chalDto.getChalTitle()}</span>
	</div>
	
	<%-- 시작일 --%>
	<div>  
		<span><img src="/images/calendar_icon.png" class="img-margin">${chalDto.getStartDate()}~${chalVO.endDate}</span>
	</div>
	
	<div>
	 	<a href = "/chal/detail?chalNo=${chalDto.getChalNo()}"><button class="largebtn" type="submit" id="largebutton3">챌린지 바로가기</button></a>
	</div>
		
<!-- tab title -->
    <ul class="tabs">
        <li class="active" rel="tab1">내 인증현황</li>
        <li rel="tab2">참가자 인증 현황</li>
    </ul>
    
    <div class="tab_container">

        <!-- tab1 시작-->
    	<div id="tab1" class="tab_content">
        
	        <h2>달성률</h2>
	        
	                <!--progress bar--> 
	                 <div>
	                    <div class="bar-percent"> <fmt:formatNumber type="number" 
					 		pattern="0" value="${progressDto*100/28}"/>%</div>
	                    <progress max="100" value="<fmt:formatNumber type="number" 
					 		pattern="0" value="${progressDto*100/28}"/>"></progress>
	                </div>
 
	                <!-- 
                테스트용 progress bar  숫자 바꾸면 진행률 확인가능
                <div>
                    <div class="bar-percent">35%</div>
                    <progress max="100" value="35"></progress>
                </div>                 
                   -->
                   
	         <h2>인증 현황</h2>
	         
	     <ul class="my-confirm">
			<c:forEach var="days" begin="1" end="28" step="1">
				<li>${days}</li>
			</c:forEach>
		</ul>

         </div> 
         <!-- tab1 끝 -->
               

        <!-- tab2 시작 --> 
	    <div id="tab2" class="tab_content">
  
	     <h2>달성률</h2>
	     	<!--progress bar-->    	                  
                <div>
                    <div class="bar-percent">평균달성률 : <fmt:formatNumber type="number" pattern="0" value="${listCnt*100/28/chalDto.getChalPerson()}"/>%</div>
                    <progress max="100" value="<fmt:formatNumber type="number" pattern="0" value="${listCnt*100/28/chalDto.getChalPerson()}"/>"></progress>
                </div>     
               
                  <!-- 
                테스트용 progress bar  숫자 바꾸면 진행률 확인가능
                <div>
                    <div class="bar-percent">35%</div>
                    <progress max="100" value="35"></progress>
                </div>                 
                   -->
		     
	     <h2>인증 현황</h2> <!-- 추가 예정 -->
	     
			<c:forEach var="allProgressDto" items="${allProgressDto}">

                        <img src = "/user/profile/download?userId=${allProgressDto.userId}" class="user-img">
                        ${allProgressDto.userNick}: &nbsp; 달성률 : <fmt:formatNumber type="number" 
				 			pattern="0" value="${allProgressDto.cnt*100/28}"/>%<br><br>
				 			<br>

               </c:forEach>               
				

	<br><br><br><br>
		<!-- 인증글 목록(최신 max 5개) -->
		<div class="row div-align">
			<h2>인증글</h2>
		</div>
		
		<div class="row div-align float-right">
			<a href="/confirm/all?chalNo=${chalDto.chalNo}" style="color:#6c7aef">전체보기(${listCnt}) <i class="fa-solid fa-circle-chevron-right"></i></a>
		</div>
		<br><br>
		
		<!-- 관리자글 -->
     	<!-- 관리자글 최신 세 개 조회하는 기능 추가 후 수정 필요 -->
     <div class="notice-border">
     		<span class="label label-notice" >공지</span> 공지글 추가하기
     </div>     
		
<!-- confirm_mylist와 동일 -->		  
      <!--인증글 목록-->
	<c:forEach var="list" items="${confirmList}">
	<a href="/confirm/detail?confirmNo=${list.confirmNo}">
	
      <div class="confirm-border">
       <!-- 챌린지 제목 -->
           <div class="confirm-title-css" style="position:relative">
           	${list.confirmTitle} 
           </div>
            <br><br>
            
            <div class="div-align"> <!-- 인증 사진, 내용 -->   
      
					${list.confirmContent}
					<br><br><br><br><br><br>
						
						<!-- 프로필, 닉네임 -->
						<img src = "/user/profile/download?userId=${list.userId}" class="user-img" style="vertical-align:middle;">
						<span class="nick-size">${list.userNick}</span>	
						&nbsp; 
						${list.confirmDate} 
						&nbsp; 
						<i class="fa-regular fa-eye"></i> ${list.confirmRead} 
						&nbsp;
						<i class="fa-regular fa-heart"></i> ${list.confirmLike}
						&nbsp; 
						<i class="fa-regular fa-comment"></i> ${list.replyCount}


				</div>
           			<img src = "/confirm/detail/download?confirmNo=${list.confirmNo}" class="confirm-img float-right div-align">
              	</div><!-- 인증글, 사진 목록 끝 -->			
     		</a>
		</c:forEach>

		<div  class="confirm-empty">
			 <c:if test="${listCnt == 0}">
		      		<span style="font-size : 14px;">작성한 인증글이 없습니다</span>
		      </c:if>
		 </div>
	    </div> <!-- 인증글 목록 끝 -->     
	</div>
</div>
</div> 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>