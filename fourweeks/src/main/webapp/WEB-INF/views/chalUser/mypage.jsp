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
		<%--시작 전에 인증글 리스트 조회 불가 -> 해당 기능 구현 후 아래 구문 삭제, 위 구문을 otherwise로 변경 --%>
		<c:otherwise>
			${chalDto.getDDay()}일 뒤 시작
		</c:otherwise>
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