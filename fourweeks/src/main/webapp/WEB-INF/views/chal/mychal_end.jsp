<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="챌린지 종료" name="title" />
</jsp:include>
   
<style>
    a {
		color : black;
	}
	div, table, td{
	/*border: 0.2px dotted gray;*/ 
	   border: 0.2px dotted  transparent;
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
     /* 아코디언메뉴 */
     li {
	     list-style: none;
	     margin-left: -0.5em;
     }
     .acc-btn {
	     border-radius: 4px;
	     cursor: pointer;
	     height: 42px;
	     width:100%;
	     border-top:none;
     }
     .side-menu-scroll-on{
     	margin-left: 80px;
     }
     .acc-btn strong{
	     color: #6c7aef;
	     font-size: 1.1em;
	     margin:12px 10px;
	     display: inline-block;
     }
     .selected{
     	color:#6c7aef !important;
     }
     .acc-btn .stats-title-img {
	     border-right: 1px solid #e5e5e5;
	     float: left;
	     padding:4px;
	     width: 41px;
     }

     .acc-btn .stats-tab-img-area{
	     float:right;
	     width:133px;
	     height:100%;
	     text-align: right;
	     padding:12px 0;
	     margin : 0px;
     }
     .acc-btn .stats-tab-img-area > img{
	     width:15px;
	     height:15px;
     }

     .acc-content-inner {
     	padding:15px 0px;
     }

     li.acc-content {
	     height:auto;
	     width:100%;
	     margin:0 auto;
	     overflow:hidden;
     }
     .openContent{
     	height:0px !important;
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
   		margin:0;
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
        height : 200px;
        margin:0;
    }
   	.confirm-img.no-img {
		display: none;
	}
	.confirm-img {
        border-radius: 10px;
		width: 90px;
        height: 90px;
	}
	   .user-img {
		border-radius: 50%;
		width: 30px;
		height: 30px;
	}
    /* chart*/
   .chart-size {
       width: 100px;
       height: 100px;
   }

    .confirm-img.no-img {
		display: none;
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
  <!--chartjs-->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
  //아코디언 메뉴
    $(document).on('touchstart click', '.acc-btn', function(){
    $(this).next('.acc-content').toggleClass('openContent');
    clickPolice = false;
    if(!clickPolice){
        clickPolice = true;
    $(this).find('strong').toggleClass('selected');//메뉴의 타이틀 글자색

       var $statsArrow = $(this).find('.stats-tab-img');//화살표방향바꾸게하기(열고닫기 버튼)
        var src = ($statsArrow .attr('src') == '/images/arrow-down.png')
           ? '/images/arrow-up.png'
           : '/images/arrow-down.png';

        $statsArrow .attr('src', src);
      }
 });
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
	
	//chart 비동기 통신으로 수정할 예정
    $(function(){
            const ctx = document.querySelector('#myChart');
            const myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['100%', '85%이상', '85%미만'],
            datasets: [{
                label: '# of Votes',
                data: [4, 5, 1], 
                backgroundColor: [
                    'rgb(108,122,239)',
                    'rgb(167,176,233)',
                    'rgb(229,230,249)'
                ],
                cutout: "70%", //도넛안의 원 크기
                borderWidth: 0 
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins:{
                legend: {
                    display: false //범례 제거
                }
            },
            responsive: false, 
            scales: {xAxes: [{
                stacked:true, //축 제거
            }] 
        },
        hover: {mode: null} //hover모드제거
        }   
      });
    });
</script>

<div class="container-794">

<%-- 이미지 --%>
	  <div class="detail-top" style="margin-top:20px"> 
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
        <li class="active" rel="tab1">내 인증 현황</li>
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
	         <c:forEach var="days" begin="1" end="28" step="1">
					 ${days} <br> 
			</c:forEach>
	         
         </div> 
         <!-- tab1 끝 -->

        <!-- #tab2 --> 
	    <div id="tab2" class="tab_content">
	    
			<table class="table table-border">

			<h2>총 참가자 정보</h2>
		
			<!--progress bar--> 
	                 <div> 
	                    <div class="bar-percent"> 평균 달성률 : <fmt:formatNumber type="number" 
				 pattern="0" value="${listCnt*100/28/chalDto.getChalPerson()}"/>%</div>
	                    <progress max="100" value="<fmt:formatNumber type="number" pattern="0" value="${listCnt*100/28/chalDto.getChalPerson()}"/>"></progress>
	                </div>
	                
	                

            
            <h2>총 ${chalDto.getChalPerson()}명 참가</h2>
            
            <table width="150" >
               <tbody class="row center" style="text-align:left">
                        <tr>
                            <th>100% 달성</th>
                            <td> ${perfectDto.size()}명</td>
                        </tr>
                         <tr>
                            <th>85%이상 달성</th>
                            <td>${allProgressDto.size()}명</td>
                        </tr>
                        <tr>
                            <th>85%미만 달성</th>
                            <td>${failDto.size()}명</td>
                        </tr>
                   </tbody>
               </table>
                                           <!-- 차트 -->
                             <div style="margin:0" >
                        		<canvas id="myChart" class="chart-size"></canvas>
                    		</div>


				<h2>챌린지 성공 (${allProgressDto.size()}명)</h2>
					<c:forEach var="allProgressDto" items="${allProgressDto}">	
					<!-- 프로필사진추가 필요 -->
						<img src = "/profile/download?userId=${list.userId}" class="user-img" style="vertical-align:middle;">
						${allProgressDto.userNick}&nbsp;&nbsp; 달성률 : ${allProgressDto.average} %
					</c:forEach>

		<!-- 인증글 목록(최신 max 5개) -->
		<div class="row div-align">
			<h2>인증글</h2>
		</div>
		
		<div class="row div-align float-right">
			<a href="/confirm/all?chalNo=${chalDto.chalNo}" style="color:#6c7aef">전체보기(${listCnt}) <i class="fa-solid fa-circle-chevron-right"></i></a>
		</div>
		<br><br>
		
		
		<!-- 관리자글 최신 세 개 조회하는 기능 추가 후 수정 필요 -->
		  <div class="notice-border">
            <input class="label-notice" placeholder="공지" disabled>&nbsp; 공지글 추가하기 공지글 추가하기
     	  </div>     
     	  
    <!-- confirm_mylist와 동일 -->
		<!-- 인증글 목록 -->
			<c:forEach var="list" items="${confirmList}">
			<a href="/confirm/detail?confirmNo=${list.confirmNo}">
			
			<div class="confirm-border" >
          	<!-- 챌린지 제목 -->
          	<div class="confirm-title-css" style="position:relative">
           		${list.confirmTitle} 
          	</div>
          	<br><br>
          	
          	 <!-- 인증 사진, 내용 -->   
               
               
               <div class="div-align" >
					${list.confirmContent}
					<br><br><br><br><br>
					${list.confirmDate} 
					&nbsp; 
					<i class="fa-regular fa-eye"></i> ${list.confirmRead} 
					&nbsp;
					<i class="fa-regular fa-heart"></i> ${list.confirmLike}
					&nbsp; 
					<i class="fa-regular fa-comment"></i> ${list.replyCount}
				</div>
					<!-- 인증샷이 없으면 img 태그 가리기(jquery) -->
           			<img src = "detail/download?confirmNo=${list.confirmNo}" class="confirm-img float-right div-align"  >
              </div>					
			<!--프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요
			<img src = "/profile/download?userId=${list.userId}" width="50" height="50" class="user-img">
			${list.userNick}
			&nbsp; 
			-->
			</a>
			</c:forEach>
		  </div> 
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>