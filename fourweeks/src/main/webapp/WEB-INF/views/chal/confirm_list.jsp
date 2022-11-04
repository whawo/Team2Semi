<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/header.jsp">
   <jsp:param value="참가자 인증글" name="title"/>
</jsp:include> 

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<style>
   a{
      color : black;
   }
   div {
      /*border : 1px solid gray; */
      border : 1px solid transparent;
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
    .confirm-empty {
		height : 100px;
		display: flex;
		align-items:center; 
		justify-content: center;
		
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
      /*공지글 관련*/
   .notice-border {
        cursor:pointer;
    }
   
.row-1{
   margin-top: 50px;
   }
   .row-2{
   }
   .row-parenet{
   position: relative;
   }
   .row-3{
   position: relative;
   left:307px;
   bottom:200px;
   }
   .row-4{
   position:absolute;
   bottom: 210px;
   left: 310px;
   }
.row-5{
   position:absolute;
   bottom: 140px;
   left: 310px;
   }
   .row-6{
   position:absolute;
   bottom: 70px;
   left: 310px;
   }
   .row-7{
   position: relative;
   bottom: 70px;
   left: 365px;
   }
   .row-9{
   margin-bottom:90px;
   }
   /* .row-11{
   position: relative;
   top: 10px;
   } */
   .row-12{
   position: relative;
   top:32px;
   }
   .row-13{
   margin-top: 18px;
   margin-bottm:18px;
   border-bottom: 2px solid #f0ecf2;
   padding-bottom: 10px;
   }
   .row-14{
   position:relative;
   bottom:120px;
   left:660px;
   margin-bottom: -80px;
   }
   .row-last{
   position: relative;
   margin-top: 100px;
   }
   .row-last2{
   margin-top: -70px
   }
   
   .p1{
   font-size: 24px;
   font-weight: 700;
   color: #3f3f3f;
   }
   .p2{
   font-size: 16px;
   color: #3f3f3f;
   padding-top: 10px;
   }
   .p3{
   font-size: 20px;
   font-weight: 700;
   color: #3f3f3f;
   }
   .p4{
   font-size: 14px;
   color: #3f3f3f;
   }
   .p5{
   font-size: 20px;
   font-weight: 700;
   color: #3f3f3f;
   }
   .p6{
   /* margin-top:30px; */
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
  /*   text-overflow: ellipsis; */
  text-overflow: clip;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
/*     width:400px;
    height: 100px; */
     line-height: 1.2em;
     width:400px;
    height: 3.6em;
/*     line-height: 135%; */
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
   .sp6{
   font-size: 24px;
   font-weight: 700;
   color: #3f3f3f;
   margin-bottom: 30px;
   }
     .label-notice{
    border-radius: 90%;
    padding:7px 10px;
    }
   hr{
   border:none;
   border-bottom: 2px solid #f0ecf2;
   padding-bottom: 8px;
   }
   .chal-img{
   width: 300px;
   height: 200px;
   }
   .navbtn{
   position: relative;
   bottom:210px;
   right: -640px;
   width: 100px;
   border: none;
    font-size: 16px;
    cursor: pointer;
    text-decoration: none;
    border-radius: 0.5em;
    font-weight: bold;
    display: flex;
    align-items:center; 
    justify-content: center;
   }
   /* header */
header {
   width: 100%;
    height: 92px;
    background-color: white;
    display: flex;
      justify-content: center;
    align-items: center;
   }
header > a {
   width: 15%;
   }
header > nav {
   width:100%;
   height:100%;
   }
.page-title {
	margin-bottom: 30px;
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

   <h2 class="page-title">참가자 인증글</h2>

   <h3>전체(${listCnt})</h3>
   
   <!-- 관리자글 -->
   <div class="row-9 notice-border">
          <c:forEach var="noticeList" items="${noticeList}"><br>
              <span class="label label-notice" >공지</span>
                <span class="sp4" >${noticeList.noticeTitle}</span><br>
                <span class="sp5">${noticeList.noticeTime}</span><br>
              <hr>
          </c:forEach>
     </div>  
    

 <!--인증글 목록-->
     <div class="row-10 " >
   <c:forEach var="list" items="${confirmList}">
   <a href="detail?confirmNo=${list.confirmNo}">
          <div class="row-11">
           <p class="p6">${list.confirmTitle}</p> 
          </div>

               <div class="row-12">
               <p class="p7">${list.confirmContent}</p>
            </div>
            <div class="row-13">      
               <span class="p8">${list.confirmDate}</span> 
               <span class="sp1"><i class="fa-regular fa-eye"></i> ${list.confirmRead}</span> 
               <span class="sp2"><i class="fa-regular fa-heart"></i> ${list.confirmLike}</span>
               <span class="sp3"><i class="fa-regular fa-comment"></i> ${list.replyCount}</span>
            </div>
            <div class="row-14">
                    <img src = "detail/download?confirmNo=${list.confirmNo}" class="confirm-img  div-align"  >
            </div>
       </a>
      </c:forEach>
        </div>               


       <c:if test="${listCnt == 0}">
   <div  class="row-last2 confirm-empty">
               <span class="sp6">작성한 인증글이 없습니다</span>
    </div>
         </c:if>
<!-- 인증글, 사진 목록 끝 -->         
   
   <c:if test="${listCnt != 0}">
   <!-- 페이지 내비게이터 -->
   <div class="row row-last center mt-60 mb-60">
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
   </div>
   </c:if>
</div> <!-- container끝 -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>