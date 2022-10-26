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
	div{
	    border: 0.2px dotted gray;
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
        
        /*padding:30px;*/
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
});
    //아코디언 메뉴
    $(document).on('touchstart click', '.acc-btn', function(){
    $(this).next('.acc-content').toggleClass('openContent');
    clickPolice = false;
    if(!clickPolice){
        clickPolice = true;
    $(this).find('strong').toggleClass('selected');//메뉴의 타이틀 글자색

       var $statsArrow = $(this).find('.stats-tab-img');//화살표방향바꾸게하기(열고닫기 버튼)
        var src = ($statsArrow .attr('src') == './semi-image/arrow-down.png')
           ? './semi-image/arrow-up.png'
           : './semi-image/arrow-down.png';

        $statsArrow .attr('src', src);
      }
 });
</script>

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
	         
	          <table width="600" style="margin-left: auto; margin-right: auto;">
                    <thead class="row center">
                        <tr>
                            <th>1</th>
                            <th>2</th>
                            <th>3</th>
                            <th>4</th>
                            <th>5</th>
                            <th>6</th>
                            <th>7</th>
                        </tr>
                    </thead>
                    <tbody class="row center">
                        <tr>
                            <td> <i class="fa-solid fa-circle-check"></i> </td>
                            <td> <i class="fa-solid fa-circle-check"></i> </td>
                            <td> <i class="fa-solid fa-circle-check"></i> </td>
                            <td> <i class="fa-regular fa-circle-check"></i> </td>
                            <td> <i class="fa-regular fa-circle-check"></i>  </td>
                            <td> <i class="fa-regular fa-circle-check"></i> </td>
                            <td> <i class="fa-regular fa-circle-check"></i> </td>
                        </tr>
                    </tbody>
                    <thead class="row center">
                        <tr>
                            <th>8</th>
                            <th>9</th>
                            <th>10</th>
                            <th>11</th>
                            <th>12</th>
                            <th>13</th>
                            <th>14</th>
                        </tr>
                    </thead>
                    <tbody class="row center">
                        <tr>
                			<td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                        </tr>
                    </tbody>
                    <thead class="row center">
                        <tr>
                            <th>15</th>
                            <th>16</th>
                            <th>17</th>
                            <th>18</th>
                            <th>19</th>
                            <th>20</th>
                            <th>21</th>
                        </tr>
                    </thead>
                    <tbody class="row center">
                        <tr>
     						<td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                        </tr>
                    </tbody>
                    <thead class="row center">
                        <tr>
                            <th>22</th>
                            <th>23</th>
                            <th>24</th>
                            <th>25</th>
                            <th>26</th>
                            <th>27</th>
                            <th>28</th>
                        </tr>
                    </thead>
                    <tbody class="row center">
                        <tr>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                        </tr>
                    </tbody>
                </table>
         </div> 
         <!-- tab1 끝 -->
               

        <!-- tab2 시작 --> 
	    <div id="tab2" class="tab_content">
	    
	     <h2>달성률</h2>
	     
	     <!--progress bar-->    	                
	       <!-- 테스트용 progress bar  숫자 바꾸면 진행률 확인가능--> 
                <div>
                    <div class="bar-percent">35%</div>
                    <progress max="100" value="35"></progress>
                </div>                
                   
	     <!-- 수정 예정 
			<table class="table table-border">
				<tbody>
					<c:forEach var="allProgressDto" items="${allProgressDto}">
					<tr>
						<td>${allProgressDto.userNick}&nbsp; 달성률 : <fmt:formatNumber type="number" 
						 pattern="0" value="${allProgressDto.cnt*100/28}"/>%</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			-->           

		<!-- 인증글 목록(최신 max 5개) -->
		<div class="row left">
			최신 인증글
		</div>
		<div class="row right">
			<a href="/confirm/all?chalNo=${chalDto.chalNo}">전체보기(${listCnt})</a>
		</div>
		<br><br>
		<!-- 관리자글 최신 세 개 조회하는 기능 추가 후 수정 필요 -->
		[공지] 글 제목
		<br><br>
		[공지] 글 제목
		<br><br>
		[공지] 글 제목
		<br><br>
	
		<c:forEach var="list" items="${confirmList}">
			<a href="/confirm/detail?confirmNo=${list.confirmNo}">
			<!-- 인증샷이 없으면 img 태그 가리기(jquery) -->
			<img src="/confirm/detail/download?confirmNo=${list.confirmNo}" width="120" height="90" class="confirm-img">
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
	</div>
</div>
</div> 

<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>--%>
