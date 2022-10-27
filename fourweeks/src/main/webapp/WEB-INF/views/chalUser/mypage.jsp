<%--  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <style>
        /* 
        
        10.26
        디자인 
        - input 박스가 text에 따라 자동 조절 되어야함 
        
        
        10.24 
        디자인 해야할 것 
        - input박스 라벨이 글자수에 따라 자동으로 크기가 조절 되야함 
        - 한페이지당 최대 5개까지만 보여줄 수 있음 

        */
        div, section{
            border: 1px dotted gray;
        }
        .p1{
            font-size: 20px;
            font-weight: bold;
            color:#3f3f3f;
        }
        .p2{
            font-size:14px;
            font-weight: bold;
            color:#3f3f3f;
            line-height: 18px;
        }
        .p3{
            font-size: 12px;
            color:#3f3f3f;
        }
        .p4{
            font-size: 20px;
            font-weight: bold;
            color: #3f3f3f;
        }
        .p5{
            font-size: 20px;
            color: #3f3f3f;
        }
        .all-hover:focus > li,
        .all-hover:hover > li{
            color:#6c7aef;
            font-weight: bold;
        }
        .p6:focus,
        .p6:hover{
            color:#6c7aef;
            font-weight: bold;
        }
        .p6{
            font-size: 14px;
            color:#3f3f3f;
        }
        .p7{
            font-size: 15px;
            font-weight: bold;
            color: #3f3f3f;
        }
        .p8{
            font-size: 12px;
            color: #3f3f3f;
        }
        .nav-a{
        	border: 2px solid #6c7aef;
            color:#6c7aef
        }
        /* | 이거 */
        .find{
            font-size: 13px;
            color:#707070;
            text-decoration-line: none;
        }
        
        /* 챌린지 현황 세개 분류   */
        #chal-section{
            display: flex;
        }
        .chal-num{
            justify-content : center;
        }
        .chal-line{
            border: 1px solid #707070;
            width: 0.1px;
            height: 20px;
            vertical-align: middle;
            
        }
        /* 버튼 */
        .confirm-btn{
            width: 364px;
            margin-right: 26px;
        }
        .create-btn{
            width: 364px;
            margin-left: 26px;
        }
        .my-confrim-btn{
            border: 1px solid #6c7aef;
            border-radius: 0.5em;
            background-color: #6c7aef;
            color:white;
            width: 200px;
            height: 60px;
        }
        /* 사진 */
        .user-img{
            width: 60px;
            border-radius: 50%;
        }
        .chal-img{
            display: inline;
            width: 250px;
            height: 180px;
            border-radius: 0.5em;
        }
      
        /* 중심 close(absolute) */
        .chal-close{ /* 회색 카테고리 */
            position: absolute;
            width:auto;
            top:432px;
            left: 267px;
        }
        .chal-title{ /* 챌린지 타이틀 */
            position: relative;
            bottom: 130px;
            left: 267px;

            white-space: normal;
            word-wrap:break-word;
            word-break: break-all;
        }
        .chal-period{ /**/
            position: relative;
            bottom: 80px;
            left: 275px;
        }
        .chal-success{ /*달성률? */
            position: relative;
            bottom: 55px;
            left: 275px;
            width:auto;
        }
        .chal-category{ /* 챌린지 카테고리 */
            position: relative;
             width:auto;
            bottom: 55px;
            left: 265px;
        }
        .my-confrim-btn{
            position: relative;
            bottom: 110px;
            left: 480px;
        }

        
        </style>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
     <script type="text/javascript">
     </script>
     </head>
     <body>
     
<div class="row container-1200">
        
		<div class="row container-794">
			<div class="row">
			<p class="p1">마이페이지</p>
		</div>

         <div class="row center chal-profile">
			<img src="/profile/download?userId=${myDto.userId}" width="50" height="50" class="user-img">
				<br>
           <span class="p2">${myDto.getUserNick()}</span>
                <br>
           <span class="p3">${myDto.userEmail}</span>
         </div>
                
		<div class="row center">
			<a class=" navbtn nav-a"  id="navbutton3" href="mypage/edit/auth">계정관리</a>
		</div>

		<div class="row">
			<p class="p4">챌린지 현황</p>
		</div>
               
		<section class="row center chal-num" id="chal-section">
                <div class="row all-hover">
                    <li class="p5">2</li>
                    <a class="chal-ing p6" href="#비밀번호찾기 " rel="tab1">참가중</a>
                </div>
                
                <hr class="chal-line">
                
                <div class="row all-hover">
                    <li class="p5">2</li>
                    <a class="chal-fin p6" href="#비밀번호찾기 "  rel="tab2">완료 </a>
                </div>
                
                <hr class="chal-line">
                
                <div class="row all-hover">
                		<li class="p5">2</li>
                		<a class="chal-create p6" href="#비밀번호찾기 "  rel="tab3">개설</a>
                </div>
		</section>
		
                <hr>

		<div class="row center">
			<a class="smallbtn confirm-btn" type="submit" id="smallbutton3"  href ="/confirm/write">챌린지 인증</a>
			<a class="smallbtn create-btn" type="submit" id="smallbutton3" href ="/chal/create">챌린지 개설</a>
		</div> 
		
		<c:forEach var="chalDto" items="${chalDto}">
		<div class="row row-last">
			<a href="chal/mychal?userId=${loginId}&chalNo=${chalDto.chalNo}">
			<img src="chal/detail/download?chalNo=${chalDto.getChalNo()}" width="200" height="200" class="chal-img">
		<c:choose>
	<c:when test="${chalDto.getEndDDay() > 0 && chalDto.getEndDDay() < 28}">
			<input class="label-close chal-close" disabled placeholder="${chalDto.getEndDDay()}일 뒤 종료">
								${chalDto.getEndDDay()}일 뒤 종료
		</c:when>
		<c:when test="${chalDto.getEndDDay() == 0}">
			<input class="label-close chal-close" disabled placeholder="오늘 종료">
		</c:when>
		<c:when test="${chalDto.getEndDDay() < 0}">
			<input class="label-close chal-close" disabled placeholder=" 종료">
		</c:when>
		<c:when test="${chalDto.getDDay() == 1}">
				<input class="label-close chal-close" disabled placeholder=" 내일부터 시작">
		</c:when>
		<c:when test="${chalDto.getDDay() == 0}">
			<input class="label-close chal-close" disabled placeholder=" 오늘 시작">
		</c:when>
		<c:otherwise>
			<input class="label-close chal-close" disabled placeholder="${chalDto.getDDay()}일 뒤 시작">
		</c:otherwise> 
		</c:choose> 
					
			<p class="p7 chal-title"><a href="chal/mychal?userId=${loginId}&chalNo=${chalDto.chalNo}"> ${chalDto.chalTitle}</a></p>
			<p class="p8 chal-period">${chalDto.getStartDate()}~${chalDto.getEndDate()}</p>
			
			<input class="label-category chal-category" disabled placeholder="${chalDto.getChalTopic()}"></input>
			<input class="label-success chal-success" disabled placeholder="현재 달성률 : <fmt:formatNumber type="number" pattern="0" value="${chalDto.cnt*100/28}"/>%">
				 <c:choose>
					<c:when test="${chalDto.getDDay()>0}">
                    <a class="my-confrim-btn"   href="/confirm/mylist?chalNo=${chalDto.chalNo}">내 인증글</a>
				 </c:when>
				 <c:otherwise>
				  <a href="/confirm/mylist?chalNo=${chalDto.chalNo}">내 인증글</a>
				 </c:otherwise>
				 </c:choose>
			</c:forEach>
				
					

            <div class="row container-794">
                <ul class="page">
                    <li><a href="#">&lt;</a></li>
                    <li><a href="#">1</a></li>
                    <li class="on"><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">&gt;</a></li>
                    </li>
                </ul>
            </div>

        </div>
     </body>



 --%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>tab_final</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="./reset.css">
    <link rel="stylesheet" type="text/css" href="./commons1.css">

    <style>
    ul.tabs {
    color: #AAAAAA;
    position:relative;
    float:left;
    list-style: none;
    width: 100%;
    margin:0px 0px 30px 0px;
    padding: 0;
    }
    ul.tabs li {
    float: left;
    border-bottom : 2px solid#AAAAAA;
    text-align:center;
    cursor: pointer;
    width:33.3%;
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
    padding:30px;
    }
    .tab_content {
        border: none;
    }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
});
    </script>

</head>
<body>
        <ul class="list">
	<li><img src="/profile/download?userId=${myDto.userId}" width="50" height="50" class="user-img"></li>
		<li>${myDto.getUserNick()}</li>
	<li>${myDto.userEmail}</li>
	<li><a href="mypage/edit/auth">계정 관리</a></li><br><br><br><br><br><br><br><br><br>
    <a href ="/confirm/write"><button>챌린지 인증</button></a><a href ="/chal/create"> <button>챌린지 개설</button></a>
</ul>
    <ul class="tabs">
        <li class="active" rel="tab1">${chalDto.size()}<br>참가중</li>
        <li rel="tab2">${chalEndDto.size()}<br>완료</li>
        <li rel="tab3">${createDto.size()}<br>개설</li><!-- 각 갯수 구현 tab위에 뜨게하는건 방법을 모르겠승 -->
    </ul>
     <div class="tab_container">
        <!-- #tab1 -->
        <div id="tab1" class="tab_content">

<c:forEach var="chalDto" items="${chalDto}">
<div>
		<a href="chal/mychal?userId=${loginId}&chalNo=${chalDto.chalNo}"><img src="chal/detail/download?chalNo=${chalDto.getChalNo()}" width="200" height="200" class="chal-img"></div>
    </a>
					<c:choose>
		<c:when test="${chalDto.getEndDDay() > 0 && chalDto.getEndDDay() < 28}">
			${chalDto.getEndDDay()}일 뒤 종료
		</c:when>
		<c:when test="${chalDto.getEndDDay() == 0}">
			오늘 종료
		</c:when>
		<c:when test="${chalDto.getEndDDay() < 0}">
			종료
		</c:when>
		<c:when test="${chalDto.getDDay() == 1}">
			내일부터 시작
		</c:when>
				<c:when test="${chalDto.getDDay() == 0}">
			오늘 시작
		</c:when>
	</c:choose>
	
	<div>
		<a href="chal/mychal?userId=${loginId}&chalNo=${chalDto.chalNo}"> ${chalDto.chalTitle}</a>
	</div><br>
	<div>${chalDto.getStartDate()}~${chalDto.getEndDate()}</div><br>
	<div>${chalDto.getChalTopic()}</div>
현재 달성률 : <fmt:formatNumber type="number" 
				 pattern="0" value="${chalDto.cnt*100/28}"/>%
				 <c:choose>
					<c:when test="${chalDto.getDDay()>0}">
					<button disabled>내 인증글</button>
				 </c:when>
				 <c:otherwise>
				 <a href="/confirm/mylist?chalNo=${chalDto.chalNo}"><button>
				 내 인증글</button></a>
				 </c:otherwise>
				 </c:choose>
</c:forEach>
        </div>
          <!-- #tab2 --> 
    <div id="tab2" class="tab_content">
<c:forEach var="chalEndDto" items="${chalEndDto}">
<div>
		<a href="chal/mychal_end?userId=${loginId}&chalNo=${chalEndDto.chalNo}"><img src="chal/detail/download?chalNo=${chalEndDto.getChalNo()}" width="200" height="200" class="chal-img"></div>
    </a>
                           챌린지 종료
	
	<div>
		<a href="chal/mychal_end?userId=${loginId}&chalNo=${chalEndDto.chalNo}"> ${chalEndDto.chalTitle}</a>
	</div><br>
	<div>${chalEndDto.getStartDate()}~${chalEndDto.getEndDate()}</div><br>
	<div>${chalEndDto.getChalTopic()}</div>
최종 달성률 : <fmt:formatNumber type="number" 
				 pattern="0" value="${chalEndDto.cnt*100/28}"/>%
				 <a href="/confirm/mylist?chalNo=${chalEndDto.chalNo}"><button>내 인증글</button></a>
</c:forEach>
    </div> 
    <div id="tab3" class="tab_content">
        <c:forEach var="createDto" items="${createDto}">
<div>
		<a href="chal/mychal?userId=${loginId}&chalNo=${createDto.chalNo}"><img src="chal/detail/download?chalNo=${createDto.getChalNo()}" width="200" height="200" class="chal-img"></div>
    </a>
                           챌린지 종료
	<div>
		<a href="chal/mychal?userId=${loginId}&chalNo=${createDto.chalNo}"> ${createDto.chalTitle}</a>
	</div><br>
	<div>${createDto.getStartDate()}~${createDto.getEndDate()}</div><br>
	<div>${createDto.getChalTopic()}</div>
  달성률 : <fmt:formatNumber type="number" 
				 pattern="0" value="${createDto.cnt*100/28}"/>%
				 <a href="/confirm/mylist?chalNo=${createDto.chalNo}"><button>내 인증글</button></a>
</c:forEach> 
    </div> 
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>