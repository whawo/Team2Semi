<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="4weeks" name="title"/>
</jsp:include>

<style>
	div, img, select, input, table, td {		   
		/*border: 1px dotted gray; */
		border: 1px solid transparent;
	}
	/* 이미지 */
	.banner {
		padding-top: 50px;
		position: relative;
		height : 240px;
	}
	.banner-child{
		position: absolute;
		right: 0;
		top:0;
	}
	#head-image {
		height: 336px;
		width : 628px;
	}
	.banner-text{
		font-size: 16px;
		line-height: 1.2em;
	}
	.banner-title{
		display: block;
		font-size: 20px;
		font-weight: bold;
		line-height: 1.2em;
		margin-bottom: 1.2em;
	}
	.search-bar {
		margin-top : 100px;
		margin-bottom: 30px;
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
	/* 검색창*/
	.select{
		border:2px solid #6c7aef;
		border-radius: 0.5em;
		width: 150px;
		height: auto;
		font-size: 16px;
		padding: 15px; /*이거 글씨 전체가 왼쪽에서 조금씩 떨어지는 거/*/

		border-right: none;
		border-bottom-right-radius: 0;
		border-top-right-radius: 0;
	}
	.search-bar{
		display: flex;
		flex-direction: row;
		position: relative;
        
		 width : 590px;
		margin: 150px auto auto;
	}
	.search-box{
		position : relative;
		border:2px solid #6c7aef;
		border-radius: 0.5em;
		width: 100%;
		height: 60px;
 		font-size: 16px;
		padding: 15px;

		border-left: none;
		border-bottom-left-radius: 0;
		border-top-left-radius: 0;
	}
	.search-box > select > input{
		display: flex;
		flex-direction: row;
		flex-grow: 1;
	}
	/* 옵션보기 화살표 아이콘 */
	select {
		-webkit-appearance:none; /* for chrome */
		-moz-appearance:none; /*for firefox*/
		appearance:none;
	}

	select::-ms-expand {
		display:none;/*for IE10,11*/
	}

	select {
		background:url("images/arrow-down.png") no-repeat 97% 50%/15px auto;
	}

	.btn {
		position: absolute;
		margin-top : 20px;
		margin-right : 15px;
		padding : 0;
		right: 0; 
		background-color : white;           
	}
	/* focus시 테두리 색변경 방지 */
	input:focus, 
	select:focus { 
		outline: none; 
	}
	.main-img {
		width : 288px;
		height : 208px;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	.home-chal-title {
		font-weight: bold;
		font-size : 22px;
	}

	 /* table 왼쪽 나란히 정렬 */
	table {
   		float : left;
	}
 	/* table 안 글자 가운데*/
	td {
		display: flex;
		align-items: center;
	}
	.img-margin {
		margin-right : 10px;
	}

	.select-hidden {
		display:none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
  $(function(){
    //챌린지 썸네일이 없으면 기본 이미지로 대체
    $(".main-img").on("error", function(){
      $(this).attr("src", "/images/bg_default.png");
    });

    //뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
    $(window).bind("pageshow", function (event) {
          if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
              location.href = location.href;
          }
      });
  });
</script>
<div class="container-1200">
	<div class="row banner">
		<span class="banner-title">함께 해요, 좋은 습관 챌린지</span>
		<span class="banner-text">‘내일 일은 내일의 내가 할 거야.’ 미루는 습관에 데어본 적 있나요?<br>
		내가 원하는 대로 내 삶을 만들 수 있도록 오늘의 내가 할 수 있는 최선을 다해봐요. <br>
		4weeks에서는 같은 목표를 가진 사람들과 함께하니까 끝까지 해낼 수 있어요. <br>
		나에게 필요한 작은 습관 하나만 만들어보세요. 그 다음은 쉽습니다.<br>
		<br>
		#목표관리 #습관형성 #갓생살기
		</span>
		<div class="row banner-child">
			<img src="/images/home_banner_illust.png" id="head-image">  
		</div>
	</div>
		
		<%-- 검색 시작 --%>      
      <form action="chal/list">
      <div class="row search-bar">
        <select name="type" class="select select-check">
          <option selected="selected"  value="chal_title">전체</option>
          <option value="운동">운동</option>
          <option value="식습관">식습관</option>
          <option value="생활">생활</option>
          <option value="정서">정서</option>
          <option value="취미">취미</option>
          <option value="학습">학습</option>
          <option value="환경">환경</option>
          <option value="그 외">그 외</option>
        </select>
        <select name="alignType" class="select-hidden">
          <option value="d_day asc"></option>
		</select>
				<input class="search-box" type="text" name="keyword" value="${param.keyword}" autocomplete="off" placeholder="지금 나에게 필요한 습관은?">
				<button type="submit" class="btn"><i class="fa-solid fa-magnifying-glass i-margin"></i></button> 
        </div>
		</form>
		<%-- 검색 끝 --%>
		
		<%-- 주제별 리스트 시작 --%>

		<div class="row first mt-50">
			<div class="flexbox"><a href="chal/list?alignType=d_day+asc&type=생활&keyword="><img src="/images/regular_lifestyle.png"></a></div>
			<div class="flexbox"><a href="chal/list?alignType=d_day+asc&type=운동&keyword="><img src="/images/exercise.png"></a></div>
			<div class="flexbox"><a href="chal/list?alignType=d_day+asc&type=식습관&keyword="><img src="/images/eating_habits.png"></a></div>
			<div class="flexbox"><a href="chal/list?alignType=d_day+asc&type=정서&keyword="><img src="/images/mind_control.png"></a></div>
		</div>
		<div class="row first">
			<div class="flexbox"><a href="chal/list?alignType=d_day+asc&type=취미&keyword="><img src="/images/hobby.png"></a></div>
			<div class="flexbox"><a href="chal/list?alignType=d_day+asc&type=학습&keyword="><img src="/images/study.png"></a></div>
			<div class="flexbox"><a href="chal/list?alignType=d_day+asc&type=환경&keyword="><img src="/images/echo_and_pat.png"></a></div>
			<div class="flexbox"><a href=""><img src="/images/start_today.png"></a></div>	

		</div>
		<%-- 주제별 리스트 끝 --%>
		<div class="row flex mt-50">
			<div class="w-90 left">
				<h2>지금 바로 시작하는 거야!</h2>
			</div>
		
			<div>
				<a href="chal/list">전체보기 <i class="fa-regular fa-plus"></i></a>
			</div>
		</div>
	
	<div>	
   <c:forEach var="chalDto" items="${list}">
	 <table>
         <tbody>
            <tr>  <%-- 이미지 --%>
                <td>
					<a href="chal/detail?chalNo=${chalDto.chalNo}">
						<img class="main-img" src="chal/detail/download?chalNo=${chalDto.getChalNo()}">
					</a>
                </td>
            </tr>
            
            <tr>  <%-- 제목 --%>
                <td><a href="chal/detail?chalNo=${chalDto.chalNo}" class="home-chal-title">${chalDto.chalTitle}</a></td>
            </tr>
            
            <tr>  <%-- 인원수 --%>
                <td>
                <img src="/images/attend_user.png" class="img-margin">
                ${chalDto.chalPerson}명 / 10명
                 </td>
            </tr>
            
            <c:if test="${chalDto.getDDay() == 0}">
	            <tr> <%-- 시작일 조건 --%>
	                <td>
	                <img src="/images/chal_start_date.png" class="img-margin">
	                 오늘 시작
	                </td>
	            </tr>
            </c:if>
            <c:if test="${chalDto.getDDay() > 0}">
            	<tr> <%-- 시작일 조건 --%>
            		<td>
            		<img src="/images/chal_start_date.png" class="img-margin">
            		${chalDto.getDDay()}일 뒤 시작
            		</td>
	            </tr>
            </c:if>
            <tr> <%-- 종료일 --%>
                <td>
                <img src="/images/chal_end_date.png" class="img-margin">
                ~${chalDto.endDate}
                </td>     
            </tr>
            
            <tr> <%-- 라벨 --%>
                <td>
                <c:if test="${chalDto.getDDay() > 0}">
					<input class="label-wait" placeholder="모집중">&nbsp; 
				</c:if>
                	<input class="label-category" placeholder="${chalDto.chalTopic}">
                </td>
            </tr>
         </tbody>
       </table>
      </c:forEach>
     </div>

<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>
