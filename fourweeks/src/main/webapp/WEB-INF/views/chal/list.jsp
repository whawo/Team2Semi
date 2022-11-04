<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/header.jsp">
	<jsp:param value="전체 챌린지" name="title"/>
</jsp:include>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons1.css">
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />


<style>
	div, table, td {
		/*border: 1px solid gray;*/
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
		background: url("${pageContext.request.contextPath}/images/arrow-down.png") no-repeat 97% 50%/15px auto;
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
		text-align:center;
		align-items: center;
		margin : 0 auto;
		height: 500px;
		font-size: 20px;
	}
	/* pagenavigation */
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
			$(this).attr("src", "${pageContext.request.contextPath}/images/bg_default.png");

		});
		// 사용자가 선택한 주제를 selected 시켜라, type이 null이면 "chal_tilte"을 찍어라
		$("#autoSelect-type").val("${param.type}" || "chal_title");
		// 사용자가 선택한 정렬을 selected 시켜라, alignType이 null이면 "d_day asc"를 찍어라
		$("#autoSelect-alignType").val(
				decodeURIComponent("${param.alignType}" || "d_day asc"));
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
	
	//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function(event) {
		if (event.originalEvent.persisted
			|| (window.performance && window.performance.navigation.type == 2)) {
				location.href = location.href;
		}
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
					 <img src="${pageContext.request.contextPath}/images/attend_user.png" class="img-margin">
		                ${chalDto.chalPerson}명 / 10명
		         </div>   
			     <%-- 시작일 조건 --%>
		         <c:if test="${chalDto.getDDay() == 0}">
		         <div class="row chal-item">
			        <img src="${pageContext.request.contextPath}/images/chal_start_date.png" class="img-margin">
			                 오늘 시작
			     </div>
		         </c:if>
		         <%-- 시작일 조건 --%>
		         <c:if test="${chalDto.getDDay() > 0}">
		         <div class="row chal-item">
			        <img src="${pageContext.request.contextPath}/images/chal_start_date.png" class="img-margin">
			                 ${chalDto.getDDay()}일 뒤 시작
			     </div>
			     </c:if>
		         <div class="row chal-item">
			         <%-- 종료일 --%>
			        <img src="${pageContext.request.contextPath}/images/chal_end_date.png" class="img-margin">
		                ~${chalDto.endDate}
			     </div>
			     <div class="row chal-item">
			         <%-- 라벨 --%>
			        <c:if test="${chalDto.getDDay() > -1}">
						<span class="label label-wait" >모집중</span>
					</c:if>
		            <span class="label label-category" >${chalDto.chalTopic}</span>
			     </div>
			  </div> 
			  </a>
		      </c:forEach>
		      <c:if test="${vo.count == 0}">
					<span class="text-center">검색 결과가 없습니다.</span>
			  </c:if>
			</div>
	
		<%-- 페이지 네비게이터 시작 --%>
		<div class="row center mt-40 mb-40">
			<ul class="pagenation">
			
			<c:if test="${vo.count > 0}">
			<%-- 맨처음--%>	
					<c:choose>
						<c:when test="${not vo.isFirst()}">
							<li><a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
				
				<%-- 이전--%>
				
					<c:choose>
						<c:when test="${vo.hasPrev()}">
							<li><a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#">&lt;</a></li>
						</c:otherwise>
					</c:choose>
				
				<%-- 페이지 번호--%>
					<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
							<c:choose>
								<c:when test="${vo.p == i}">
									<li><a href="#" class="on">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
								</c:otherwise>
							</c:choose>
					</c:forEach>

				<%-- 다음--%>
					<c:choose>
						<c:when test="${vo.hasNext()}">
							<li><a href="list?p=${vo.nextBlock()}&${vo.parameter()}&${param.alignType}">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#">&gt;</a></li>
						</c:otherwise>
					</c:choose>

				<%-- 맨뒤 --%>
					<c:choose>
						<c:when test="${not vo.isLast()}">
							<li><a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
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
					 <img src="${pageContext.request.contextPath}/images/attend_user.png" class="img-margin">
					${chalDtoRecruited.chalPerson}명 / 10명
		         </div>   
			     <%-- 시작일 조건 --%>
		         <div class="row chal-item">
			        <img src="${pageContext.request.contextPath}/images/chal_start_date.png" class="img-margin">
					<c:choose>
							<c:when test="${chalDtoRecruited.getDDay() == 0}">
								<div>오늘 시작</div>

							</c:when>
							<c:when test="${chalDtoRecruited.getDDay() < 0}">
								<span class="label label-ing">진행중</span>
							</c:when>
							<c:otherwise>
								<span class="label label-wait">모집중</span>
								<div>${chalDtoRecruited.startDate}</div>
							</c:otherwise>
						</c:choose>
			     </div>
		         <div class="row chal-item">
			         <%-- 종료일 --%>
			        <img src="${pageContext.request.contextPath}/images/chal_end_date.png" class="img-margin">
					~${chalDtoRecruited.endDate}
			     </div>
			     <div class="row chal-item">
			        <%-- 라벨 --%>
			        <c:choose>
								<c:when test="${chalDtoRecruited.getDDay() < -28}">
									<span class="label label-status">종료</span>
								</c:when>
								<c:when test="${chalDtoRecruited.getDDay() < 0}">
									<span class="label label-ing">진행중</span>
								</c:when>
								<c:otherwise>
									<span class="label label-wait">모집중</span>
								</c:otherwise>
					</c:choose>
					 	<span class="label label-category">${chalDtoRecruited.chalTopic}</span>
			     </div>
			  </div> 
			  </a>
		      </c:forEach>
		      <c:if test="${vo.count == 0}">
				<span class="text-center">검색 결과가 없습니다.</span>
				</c:if>
			</div>
			
			<%-- 페이지 네비게이터 시작 --%>
			<div class="row center mt-40 mb-40">
				<ul class="pagenation">
				
				<c:if test="${voRecruited.count > 0}">
				<%-- 맨처음--%>
					<c:choose>
						<c:when test="${not voRecruited.isFirst()}">
							<li><a href="list?p=${voRecruited.firstBlock()}&${voRecruited.parameter()}">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<%-- 이전--%>
					<c:choose>
						<c:when test="${voRecruited.hasPrev()}">
							<li><a href="list?p=${voRecruited.prevBlock()}&${voRecruited.parameter()}">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#">&lt;</a></li>
						</c:otherwise>
					</c:choose>

					<%-- 페이지 번호--%>
					<c:forEach var="i" begin="${voRecruited.startBlock()}" end="${voRecruited.endBlock()}" step="1">
						<c:choose>
							<c:when test="${voRecruited.p == i}">
								<li><a href="#" class="on">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="list?p=${i}&${voRecruited.parameter()}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<%-- 다음--%>
					<c:choose>
						<c:when test="${voRecruited.hasNext()}">
							<li><a href="list?p=${voRecruited.nextBlock()}&${voRecruited.parameter()}">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#">&gt;</a></li>
						</c:otherwise>
					</c:choose>

				<%-- 맨뒤 --%>
					<c:choose>
						<c:when test="${not voRecruited.isLast()}">
							<li><a href="list?p=${voRecruited.lastBlock()}&${voRecruited.parameter()}">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				</ul>
			</div>
		</div>	
	</div>	
</div>
 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include> 