   <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="챌린지 상세" name="title" />
</jsp:include>
   
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
<div class="container-794">
	<ul class="list">
		<li>챌린지 이미지 :<img
			src="detail/download?chalNo=${chalDto.getChalNo()}"></li>
		<li>챌린지 제목 : ${chalDto.getChalTitle()}</li>
		<li>챌린지 시작일: ${chalDto.getStartDate()}~${chalVO.endDate}</li>
		<a href = "/chal/detail?chalNo=${chalDto.getChalNo()}"><button>챌린지 바로가기</button></a><br>
	</ul>
			
    <ul class="tabs">
        <li class="active" rel="tab1">내 인증 현황</li>
        <li rel="tab2">참가자 인증 현황</li>
    </ul>
    
    <div class="tab_container">
    
        <!-- #tab1 -->
        <div id="tab1" class="tab_content">
    
		<ul class="list">
            달성률 : <fmt:formatNumber type="number" 
				 pattern="0" value="${progressDto*100/28}"/>
		</ul>

        </div>

        <!-- #tab2 --> 
	    <div id="tab2" class="tab_content">
			<table class="table table-border">
			<h2>총 참가자 정보</h2><br> 
			평균 달성률 : ${avgDto * 100/28}
			<br><br><br>
			총 ${chalDto.getChalPerson()}명 참가
				<tbody>
					<c:forEach var="allProgressDto" items="${allProgressDto}">
					<tr>
						<td>${allProgressDto.userNick}&nbsp; 달성률 : <fmt:formatNumber type="number" 
						 pattern="0" value="${allProgressDto.cnt*100/28}"/>%</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
	    </div> 

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
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>