<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="4weeks" name="title"/>
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
	div, table, td {
		border: 1px solid transparent;
	}
	/* tab*/
	ul.tabs {
		color: #AAAAAA;
		position: relative;
		float: left;
		list-style: none;
		width: 100%;
		margin: 0px 0px 30px 0px;
		padding: 0;
	}
	
	ul.tabs li {
		float: left;
		border-bottom: 2px solid #AAAAAA;
		text-align: center;
		cursor: pointer;
		width: 50%;
		padding: 0;
		line-height: 50px;
		height: 50px;
	}
	
	ul.tabs li.active {
		border-bottom-color: #6c7aef;
		color: #6c7aef;
		font-weight: bold;
	}
	
	.tab_container {
		position: relative;
		float: left;
		width: 100%;
		/* padding:30px; */
	}
	
	.tab_content {
		border: none;
	}
	/* 검색창 */
	.select {
		border: 2px solid #6c7aef;
		border-radius: 0.5em;
		width: 150px;
		height: auto;
		font-size: 16px;
		padding: 15px;
		border-right: none;
		border-bottom-right-radius: 0;
		border-top-right-radius: 0;
	}
	
	.search-bar {
		display: flex;
		flex-direction: row;
		position: relative;
		width: 590px;
		margin: 150px auto auto;
	}
	
	.search-box {
		position: relative;
		border: 2px solid #6c7aef;
		border-radius: 0.5em;
		width: 100%;
		height: 60px;
		font-size: 16px;
		padding: 15px;
		border-left: none;
		border-bottom-left-radius: 0;
		border-top-left-radius: 0;
	}
	
	.search-box>select>input {
		display: flex;
		flex-direction: row;
		flex-grow: 1;
	}
	/* 옵션보기 화살표 아이콘 */
	select {
		-webkit-appearance: none; /* for chrome */
		-moz-appearance: none; /*for firefox*/
		appearance: none;
	}
	
	select::-ms-expand {
		display: none; /*for IE10,11*/
	}
	
	select {
		background: url("/images/arrow-down.png") no-repeat 97% 50%/15px auto;
	}
	
	.btn {
		position: absolute;
		margin-top: 20px;
		margin-right: 15px;
		padding: 0;
		right: 0;
		background-color: white;
	}
	/* 정렬 */
	.select-array {
		border: 2px solid #6c7aef;
		border-radius: 0.5em;
		padding-left: 10px;
		height: 40px;
		width: 150px;
		float: right;
	}
	/* focus시 테두리 색변경 방지 */
	input:focus, select:focus {
		outline: none;
	}
	
	.main-img {
		width: 288px;
		height: 208px;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	
	.home-chal-title {
		font-weight: bold;
		font-size: 22px;
		text-align: left;
	}
	
	/* table 왼쪽 나란히 정렬 */
	table {
		float: left;
	}
	/* table 안 글자 가운데*/
	td {
		display: flex;
		align-items: center;
	}
	
	.img-margin {
		margin-right: 10px;
	}
	
	.text-center {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 500px;
		font-size: 24px;
	}
	/* pagenavigation */
	ul.page {
		list-style: none; /*li 점 없애기*/
		margin: 0;
		padding: 0;
		font-size: 16px;
		color: #6c7aef;
		text-align: center;
		/* margin-top: 1600px; */ /* 불필요 */
	}
	
	ul.page>li {
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
	ul.page>li:hover, ul.page>li>a:hover {
		border-color: #6c7aef; /*커서 대면 상자표시*/
		background-color: #6c7aef;
		color: white;
		font-weight: bold;
		cursor: pointer;
	}
	
	ul.page>li>a {
		display: block;
		width: 100%;
		color: #6c7aef;
		text-decoration: none;
		font-weight: bold;
	}
	.ellipsis {
	  width: 288px;
	  white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;  /* 말줄임 적용 */
	}
</style>
	
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function() {
		//챌린지 썸네일이 없으면 기본 이미지로 대체
		$(".main-img").on("error", function() {
			$(this).attr("src", "/images/bg_default.png");

		});
		// 사용자가 선택한 주제를 selected 시켜라, type이 null이면 "chal_tilte"을 찍어라
		$("#autoSelect-type").val("${param.type}" || "chal_title");
		// 사용자가 선택한 정렬을 selected 시켜라, alignType이 null이면 "d_day asc"를 찍어라
		$("#autoSelect-alignType").val(
				decodeURIComponent("${param.alignType}" || "d_day asc"));
	});
	//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function(event) {
		if (event.originalEvent.persisted
			|| (window.performance && window.performance.navigation.type == 2)) {
				location.href = location.href;
		}
	});
	//tab
	$(function() {
		$(".tab_content").hide();
		$(".tab_content:first").show();
		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active").css("color", "#AAAAAA");
			$(this).addClass("active").css("color", "#6c7aef");
			$(".tab_content").hide();
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).show();
		});
	});
</script>
<div class="container-1200">
	
	<%-- 검색 시작 --%>
	<form action="list">
		 <div class="search-bar">
			<select name="type"  class="select select-check" id="autoSelect-type">
				<option value="chal_title" >전체</option>
				<option value="운동">운동</option>
				<option value="식습관">식습관</option>
				<option value="생활">생활</option>
				<option value="정서">정서</option>
				<option value="취미">취미</option>
				<option value="학습">학습</option>
				<option value="환경">환경</option>
				<option value="그 외">그 외</option>
			</select>
			
			<input class="search-box"  type="text" name="keyword" value="${param.keyword}" 
				autocomplete="off" placeholder="지금 나에게 필요한 습관은?">
			<button type="submit" class="btn"><i class="fa-solid fa-magnifying-glass i-margin"></i></button> 
		</div>
			
		<%-- 정렬 --%>
		<div>
			<select  class="select-array"  name="alignType" id="autoSelect-alignType" onchange="this.form.submit()">
				<option value="d_day asc">시작 임박</option>
				<option value="chal_person desc">참가자 많은 순</option>
				<option value="chal_person asc">참가자 적은 순</option>
			</select>
		</div>
	</form>
	
	
	<%-- tab메뉴 --%>

		<ul class="tabs">
	        <li class="active" rel="tab1">모집중</li>
	        <li rel="tab2">전체</li>
	    </ul>
  
    
	<div class="tab_container">
    
		<%-- tab1 --%>
		<div id="tab1" class="tab_content">
    		<%-- 모집중 페이지 --%>
			<div class="row chal-list-container">
		   	<c:forEach var="chalDto" items="${list}">
		   	<a href="detail?chalNo=${chalDto.chalNo}">
			<div class="row chal-list">	
			 	<div class="row chal-item thumbnail">
					<%-- 이미지 --%>
						<img class="main-img" src="detail/download?chalNo=${chalDto.getChalNo()}">
		         </div>
		         <div class="row chal-item">
					<%-- 제목 --%>
					<span class="home-chal-title ellipsis">${chalDto.chalTitle}</span>
		         </div>     
		         <div class="row chal-item">
					<%-- 인원수 --%>
					 <img src="/images/attend_user.png" class="img-margin">
		                ${chalDto.chalPerson}명 / 10명
		         </div>   
			     <%-- 시작일 조건 --%>
		         <c:if test="${chalDto.getDDay() == 0}">
		         <div class="row chal-item">
			        <img src="/images/chal_start_date.png" class="img-margin">
			                 오늘 시작
			     </div>
		         </c:if>
		         <%-- 시작일 조건 --%>
		         <c:if test="${chalDto.getDDay() > 0}">
		         <div class="row chal-item">
			        <img src="/images/chal_start_date.png" class="img-margin">
			                 ${chalDto.getDDay()}일 뒤 시작
			     </div>
			     </c:if>
		         <div class="row chal-item">
			         <%-- 종료일 --%>
			        <img src="/images/chal_end_date.png" class="img-margin">
		                ~${chalDto.endDate}
			     </div>
			     <div class="row chal-item">
			         <%-- 라벨 --%>
			        <c:if test="${chalDto.getDDay() > -1}">
						<input class="label-wait" placeholder="모집중">
					</c:if>
		            <input class="label-category" placeholder="${chalDto.chalTopic}">
			     </div>
			  </div> 
			  </a>
		      </c:forEach>
		      <c:if test="${vo.count == 0}">
					<span class="text-center">검색 결과가 없습니다.</span>
			  </c:if>
			</div>
	
		<%-- 페이지 네비게이터 시작 --%>
		<div class="row">
		
			<ul class="page">
			
			<c:if test="${vo.count > 0}">
			<%-- 맨처음--%>
				<li>
					<c:choose>
						<c:when test="${not vo.isFirst()}">
							<a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a>
						</c:when>
						<c:otherwise>
							<a href="#">&laquo;</a>
						</c:otherwise>
					</c:choose>
				</li>
				
				<%-- 이전--%>
				<li>
					<c:choose>
						<c:when test="${vo.hasPrev()}">
							<a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a>
						</c:when>
						<c:otherwise>
							<a href="#">&lt;</a>
						</c:otherwise>
					</c:choose>
				</li>
				
				<%-- 페이지 번호--%>
				<li>
					<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
							<c:choose>
								<c:when test="${vo.p == i}">
									<a href="#">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="list?p=${i}&${vo.parameter()}">${i}</a>
								</c:otherwise>
							</c:choose>
					</c:forEach>
				</li>
				
				<%-- 다음--%>
				<li>
					<c:choose>
						<c:when test="${vo.hasNext()}">
							<a href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a>
						</c:when>
						<c:otherwise>
							<a href="#">&gt;</a>
						</c:otherwise>
					</c:choose>
				</li>
				
				<%-- 맨뒤 --%>
				<li>
					<c:choose>
						<c:when test="${not vo.isLast()}">
							<a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a>
						</c:when>
						<c:otherwise>
							<a href="#">&raquo;</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:if>
			</ul>
		</div>  
	</div> <!-- tab1 끝 -->
	 
	<!-- tab2 시작 -->
	<div id="tab2" class="tab_content">
	
		<%-- 전체 페이지 시작 --%>

		<div class="row chal-list-container">
			<c:forEach var="chalDtoRecruited" items="${recruitedList}">
			<a href="detail?chalNo=${chalDtoRecruited.chalNo}">
			<div class="row chal-list">	
				<div class="row chal-item thumbnail">
					<%-- 이미지 --%>
						<img class="main-img" src="detail/download?chalNo=${chalDto.getChalNo()}">
					
		         </div>
		         <div class="row chal-item">
					<%-- 제목 --%>
					<span class="home-chal-title ellipsis"> ${chalDtoRecruited.chalTitle}</span>
		         </div>     
		         <div class="row chal-item">
					<%-- 인원수 --%>
					 <img src="/images/attend_user.png" class="img-margin">
					${chalDtoRecruited.chalPerson}명 / 10명
		         </div>   
			     <%-- 시작일 조건 --%>
		         <div class="row chal-item">
			        <img src="/images/chal_start_date.png" class="img-margin">
					<c:choose>
							<c:when test="${chalDtoRecruited.getDDay() == 0}">
								<div>오늘 시작</div>

							</c:when>
							<c:when test="${chalDtoRecruited.getDDay() > 0}">
								<div>${chalDtoRecruited.getDDay()}일 뒤 시작</div>
							</c:when>
							<c:otherwise>
								<div>${chalDtoRecruited.startDate}</div>
							</c:otherwise>
						</c:choose>
			     </div>
		         <div class="row chal-item">
			         <%-- 종료일 --%>
			        <img src="/images/chal_end_date.png" class="img-margin">
					~${chalDtoRecruited.endDate}
			     </div>
			     <div class="row chal-item">
			        <%-- 라벨 --%>
			        <c:choose>
								<c:when test="${chalDtoRecruited.getDDay() < -28}">
									<input class="label-status" placeholder="종료">
								</c:when>
								<c:when test="${chalDtoRecruited.getDDay() < 0}">
									<input class="label-progress" placeholder="진행중">
								</c:when>
								<c:otherwise>
									<input class="label-wait" placeholder="모집중">
								</c:otherwise>
					</c:choose>
						<input class="label-category" placeholder="${chalDtoRecruited.chalTopic}">
			     </div>
			  </div> 
			  </a>
		      </c:forEach>
		      <c:if test="${vo.count == 0}">
				<span class="text-center">검색 결과가 없습니다.</span>
				</c:if>
			</div>
			
			<%-- 페이지 네비게이터 시작 --%>
			<div class="row">
				<ul class="page">
				
				<c:if test="${voRecruited.count > 0}">
				<%-- 맨처음--%>
					<li>
					<c:choose>
						<c:when test="${not voRecruited.isFirst()}">
							<a href="list?p=${voRecruited.firstBlock()}&${voRecruited.parameter()}">&laquo;</a>
						</c:when>
						<c:otherwise>
							<a href="#">&laquo;</a>
						</c:otherwise>
					</c:choose>
					</li>
					
					<%-- 이전--%>
				<li>
					<c:choose>
						<c:when test="${voRecruited.hasPrev()}">
							<a href="list?p=${voRecruited.prevBlock()}&${voRecruited.parameter()}">&lt;</a>
						</c:when>
						<c:otherwise>
							<a href="#">&lt;</a>
						</c:otherwise>
					</c:choose>
				</li>
					
					<%-- 페이지 번호--%>
				<li>
					<c:forEach var="i" begin="${voRecruited.startBlock()}" end="${voRecruited.endBlock()}" step="1">
						<c:choose>
							<c:when test="${voRecruited.p == i}">
								<a href="#">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="list?p=${i}&${voRecruited.parameter()}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</li>
					
					<%-- 다음--%>
				<li>
					<c:choose>
						<c:when test="${voRecruited.hasNext()}">
							<a href="list?p=${voRecruited.nextBlock()}&${voRecruited.parameter()}">&gt;</a>
						</c:when>
						<c:otherwise>
							<a href="#">&gt;</a>
						</c:otherwise>
					</c:choose>
				</li>
					
				<%-- 맨뒤 --%>
				<li>
					<c:choose>
						<c:when test="${not voRecruited.isLast()}">
							<a href="list?p=${voRecruited.lastBlock()}&${voRecruited.parameter()}">&raquo;</a>
						</c:when>
						<c:otherwise>
							<a href="#">&raquo;</a>
						</c:otherwise>
					</c:choose>
					</li>
				</c:if>
				</ul>
			</div>
		</div>	
	</div>	
</div>
 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 