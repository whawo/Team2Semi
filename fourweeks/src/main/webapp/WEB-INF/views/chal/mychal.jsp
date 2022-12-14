<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="챌린지 상세" name="title" />
</jsp:include>


<style>
a {
   color : black;
}
div{
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
.chal-status,
.chal-timer-font {
     font-size: 20px;
}
.div-align {
      display : inline-block;
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
.confirm-img {
   border-radius: 10px;
   width: 90px;
   height: 90px;
}

.confirm-img.no-img {
   display: none;
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
.label-notice{
   border-radius: 90%;
   padding:7px 10px;
}
.p6{
   margin-top:70px;
   padding-top:10px;
   font-size:16px;
   font-weight: 700;
   color:#3f3f3f;
}
.p7{
   margin-bottom: 15px;
   font-size:14px;
   color:#3f3f3f;
   overflow: hidden;
   text-overflow: clip;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    line-height: 1.2em;
    width:400px;
   height: 3.6em;
    white-space:normal;
}
.p8{
   font-size: 12px;
   color:#707070;
   padding:20px 10px 20px 0;
}
.sp1, .sp2, .sp3{
   font-size:12px;
   padding-left: 18px;
   color:#707070;
}
.sp4, .sp5{
   font-size: 16px;
   font-weight: 700;
   color:#3f3f3f;
}
.sp4{
   position:relative;
}
.sp5{
   float: right;
}
.row-9{
   margin-top:10px;
   margin-bottom: -90px;
}
.notice-border {
   cursor:pointer;
}
.row-11{
   position: relative;
   top: 10px;
}
.row-12{
   position: relative;
   top:32px;
}
.row-13{
   margin-top: 18px;
   border-bottom: 2px solid #f0ecf2;
   padding-bottom: 10px;
}
.row-14{
   position:relative;
   bottom:120px;
   left:660px;
   margin-bottom: -80px;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- moment 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
<script type="text/javascript">
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
        $(this).attr("src", "${pageContext.request.contextPath}/images/bg_default.png");
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
        url : "${pageContext.request.contextPath}/rest/chal/confirm_days?chalNo=${param.chalNo}&userId=${loginId}",
        method : "get",
        dataType : "json",
        async : false,
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

    $.ajax({
        //챌린지 시작일 가져오기
        url : "${pageContext.request.contextPath}/rest/chal/chal_detail?chalNo=${param.chalNo}",
        method : "get",
        dataType : "json",
        //async : false,
        success : function(resp) {
            var sString = resp.startDate;
            console.log(sString);
            

            $.ajax({
                //챌린지 종료일 가져오기
                url:"${pageContext.request.contextPath}/rest/chal/chal_end_date?chalNo=${param.chalNo}",
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
          <img src="detail/download?chalNo=${chalDto.getChalNo()}" class="chal-img detail-top-img" onerror=" this.onerror=null; this.src='/images/bg_default.png';" >
          <div class="chal-timer">
         <span class="chal-status"></span>
            &nbsp;
         <span class="chal-timer-font" id="remain-time"></span>
          </div>
      </div>
 
 
        <%-- 챌린지 제목 --%>
   <div> 
      <span class="chal-title">${chalDto.getChalTitle()}</span>
   </div>
   
   <%-- 시작일 --%>
   <div>  
      <span><img src="${pageContext.request.contextPath}/images/calendar_icon.png" class="img-margin">${chalDto.getStartDate()}~${chalVO.endDate}</span>
   </div>
   
   <div>
       <a href = "${pageContext.request.contextPath}/chal/detail?chalNo=${chalDto.getChalNo()}"><button class="largebtn" type="submit" id="largebutton3">챌린지 바로가기</button></a>
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
 
                   
            <h2>인증 현황</h2>
            
              <div class="container-400">
               <ul class="my-confirm">
                  <c:forEach var="days" begin="1" end="28" step="1">
                     <li> ${days} <br> <i class="fa-solid fa-circle-check fa-2x not-yet"></i></li>
                  </c:forEach>
               </ul>
            </div>

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
               
           
        <h2>인증 현황</h2> <!-- 추가 예정 -->
        
         <c:forEach var="allProgressDto" items="${allProgressDto}">

                        <img src = "${pageContext.request.contextPath}/user/profile/download?userId=${allProgressDto.userId}" class="user-img" onerror=" this.onerror=null; this.src='/images/avatar.png';" >
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
         <a href="${pageContext.request.contextPath}/confirm/all?chalNo=${chalDto.chalNo}" style="color:#6c7aef">전체보기(${listCnt}) <i class="fa-solid fa-circle-chevron-right"></i></a>
      </div>
      <br><br>
      
      <!-- 관리자글 -->
        <div class="row-9 notice-border">
          <c:forEach var="noticeList" items="${noticeList}"><br>
             <a href="${pageContext.request.contextPath}/confirm/notice/detail?noticeNo=${noticeList.noticeNo}">
              <span class="label label-notice" >공지</span>
                <span class="sp4" >${noticeList.noticeTitle}</span><br>
                <span class="sp5">${noticeList.noticeTime}</span><br>
         </a>           
              <hr>
          </c:forEach>
     </div>      
      
<!-- confirm_mylist와 동일 -->        
      <!--인증글 목록-->
    <div class="row-10 " >
   <c:forEach var="list" items="${confirmList}">
   <a href="${pageContext.request.contextPath}/confirm/detail?confirmNo=${list.confirmNo}">
          <div class="row-11">
           <p class="p6">${list.confirmTitle}</p> 
          </div>

               <div class="row-12">
               <p class="p7">${list.confirmContent}</p>
            </div>
            <div class="row-13">   
                  <!-- 프로필, 닉네임 -->
                  <img src = "${pageContext.request.contextPath}/user/profile/download?userId=${list.userId}" class="user-img" style="vertical-align:middle;" onerror=" this.onerror=null; this.src='/images/avatar.png';" >
                  <span class="nick-size">${list.userNick}</span>   
                  &nbsp; 
               <span class="p8">${list.confirmDate}</span> 
               <span class="sp1"><i class="fa-regular fa-eye"></i> ${list.confirmRead}</span> 
               <span class="sp2"><i class="fa-regular fa-heart"></i> ${list.confirmLike}</span>
               <span class="sp3"><i class="fa-regular fa-comment"></i> ${list.replyCount}</span>
            </div>
            <div class="row-14">
                    <img src = "detail/download?confirmNo=${list.confirmNo}" class="confirm-img  div-align img-last" onerror="this.style.display='none'" >
            </div>

       </a>
      </c:forEach>
        </div>               


   <div  class="row-last2 confirm-empty">
       <c:if test="${listCnt == 0}">
               <span class="sp6">작성한 인증글이 없습니다</span>
         </c:if>
    </div>
    </div>   
   </div>
</div>
</div> 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>