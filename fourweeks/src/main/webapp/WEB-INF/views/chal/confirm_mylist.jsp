<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="내 인증글" name="title"/>
</jsp:include> 

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/basic.css">

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<style>
	.confirm-img.no-img {
		display: none;
	}
	
	.confirm-img {
        border-radius: 0.5em;
		width: 100px;
		height: 100px;
	}
	
	div {
	border : 1px solid  transparent;
	}
	
	/*다단배치 */
    .first {
        display: flex;
        flex-direction: row;
    }
    .first > div {
        flex-grow: 1;
    }
    .chal-info-img {
        width: 280px;
        height: 210px;
        border-radius: 10px;
    }
    .notice-border {
      /*   border-bottom: 2px solid #f0ecf2;
        padding-bottom: 10px; */
        cursor:pointer;
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
    }
    
     /* pagenavigation */
     ul.page{
        list-style: none;
        margin: 0;
        padding: 0;
        font-size: 16px;
        color: #6c7aef;
        text-align: center;
    }
    ul.page > li{
        display: inline-block; 
        border: 1px solid transparent; 
        border-radius: 30%;
        padding: -0.5em; 
        line-height: 0.5em; 
        margin: 0.5em; 
        min-width: 1em; 
        text-align: center; 
        cursor: pointer;
        width: 24px;
        height: 24px;
    }
    ul.page > li:hover,
    ul.page > li > a:hover{
        border-color: #6c7aef; 
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
    #navbutton1{
        background-color: #6c7aef;
        color: white;
    }
    /* label 몇일 뒤 시작 */
    .label-status {
        border: none;
        border-radius: 3px;
        width: 80px;
        height: 27px;
        background-color: #DDDDDD;
        text-align: center;
        font-size: 12px;
        font-weight: bold;
    }
    .label-status::placeholder{
        color: #707070;
    }
    /* label 모집카테고리*/
    .label-category{
        border: none;
        border-radius: 3px;
        width: 40px;
        background-color: #D5E9FA;
        font-size: 13px;
        font-weight: bold; 
        display: flex;
        align-items:center; 
        justify-content: center;
    }
    .label-category::placeholder{
        color: #0084F3;
    }
    /* label 달성률 상태 */
    .label-achieve {
        border: none;
        border-radius: 3px;
        width: 115px;
        height: 30px;
        background-color: #F8E4E7;
        text-align: center;
        font-size: 13px;
        font-weight: bold;
         /* 글자 가운데 */
        display: flex;
        align-items:center; 
        justify-content: center;
    }
    .label-achieve::placeholder{
        color: #ED7584;
    }
    /* label 여러개 나란히 */
    .label-align {
        display: inline-block;
    }
    .label-notice{
    border-radius: 90%;
    padding:7px 10px;
    position:relative;
    }
	.confirm-empty {
		height : 100px;
		display: flex;
		align-items:center; 
		justify-content: center;
	}
	h3 {
		margin : 40px 0;
	}
	.user-img {
		border-radius: 50%;
	}
	.div-align {
		display : inline-block;
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
	.row-11{
	}
	.row-12{
	padding-top: 10px;
	padding-bottom:10px;
	}
	.row-13{
	border-bottom: 2px solid #f0ecf2;
	padding-bottom: 8px;
	}
	.row-14{
	position:relative;
	bottom:150px;
	left:660px;
	margin-bottom: -80px;
	}
	.row-last{
	margin-bottom: 100px;
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
	padding-top:10px;
	font-size:16px;
	font-weight: 700;
	color:#3f3f3f;
	}
	.p7{
	font-size:14px;
	color:#3f3f3f;
	padding:20px 0 20px 0 ;
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    width:400px;
    height: 100px;
    line-height: 135%;
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
	.sp5{
	 float: right;
	}
	.sp6{
	font-size: 24px;
	font-weight: 700;
	color: #3f3f3f;
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
.dropdown-nav {
	display:flex;
	width:100%;
	height: 100%;
}
.dropdown-nav,
.dropdown-nav ul {
	margin: 0;
    padding: 0;
    list-style: none;
    color: #6C7AEF;
    font-size:16px;
    text-align: center;
}
.dropdown-nav li {
	padding: 0.5em;
	display: flex;
	justify-content: center;
    align-items: center;	
}
.dropdown-nav > li {
	position: relative;
	width: 120px;
	height: 100%;
}
.dropdown-nav > li.right-menu {
	justify-content: flex-end;
	padding: 0.5em 0;
	width: auto;
	height: 100%;
	min-width: 120px;
}
.dropdown-nav ul {
    position: absolute;
    top:100%;
    left:0;
}
.dropdown-nav ul {
    display: none;
}
.dropdown-nav li:hover > ul {
    display: block;
}
.dropdown-nav a{
    display: block;
    width: 100%;
    text-decoration: none;
    color: #6C7AEF;;
    text-align: center;
}
.dropdown-nav ul {
    width: 100%;
    background-color: white;
    border: 1px solid #A8B0E9;
    padding: 0.5em;
}
.dropdown-nav li:hover > a {
    color: #6C7AEF;
    font-weight: bold;
}

/* 9) */
.dropdown-nav {
    position: relative;
}
.dropdown-nav > .right-menu {
    position: absolute;
    right: 0;
    top: 0;
}

header.header-fixed {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
		//챌린지 썸네일이 없으면 기본 이미지로 대체
		$(".chal-img").on("error", function(){
			$(this).attr("src", "/images/bg_default.png");
		});
		
		//인증샷이 없으면 img 태그 가리기
		$(".confirm-img").on("error", function(){
			$(this).addClass("no-img");
		});
		
		//달성률 소수점 자르기
		var achieveString = $(".achieve").text();
		var achieve = Number(achieveString);
		
		var achieveCut = achieve.toFixed(0);
		
		$(".achieve").text(achieveCut);
	});
	
	//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function (event) {
        if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
          	location.href = location.href;
        }
    });
</script>
<body>
<div class="container-794 mt-92">
	<div class="row">
		<div class="row row-1">
			<p class="p1">내 인증글</p>
			<p class="p2">챌린지 정보</p>
	</div>

	<div class="row row-parenet">
		<a href="/chal/detail?chalNo=${chalDto.chalNo}">
	<div class="row-2">
		<img src="/chal/detail/download?chalNo=${chalDto.chalNo}" class="chal-img chal-info-img">
	</div>

 		<!-- 2단 시작 -->
	<div class="row row-3">
		<c:choose>
		<c:when test="${chalVO.endDday > 0 && chalVO.endDday < 28}">
			<span class="label label-status" >${chalVO.endDday}일 뒤 종료</span>			
		</c:when>
		<c:when test="${chalVO.endDday == 0}">
			<span class="label label-status" >오늘 종료</span>			
		</c:when>
		<c:when test="${chalVO.endDday < 0}">
			<span class="label label-status" >종료</span>	
		</c:when>
		<c:otherwise>
    		<span class="label label-status" >${chalVO.getDDay()}일 뒤 시작</span>
		</c:otherwise>
		</c:choose>	
   </div>
    
    <div class="row row-4">  
    	<p class="p3">${chalDto.chalTitle}</p>
    </div>
    
     <div class= "row row-5"> 
         <p class="p4">${chalDto.startDate} ~ ${chalVO.endDate}</p>
     </div>

	 <div class="row row-6"> 
     <c:choose>
		<c:when test="${chalDto.chalTopic == '그 외'}">
			<span class="label label-category" >기타</span>
		</c:when>
		<c:otherwise>	
			<span class="label label-category" >${chalDto.chalTopic}</span>
		</c:otherwise>
	</c:choose>
	 </div>
	 
	 <div class="row row-7"> 
	 	 <span class="label label-achieve">현재 달성률 &nbsp;<span class="achieve">${listCnt*100/28}</span>%</span>
     </div>
</a>
</div> 

	 	<button class="navbtn" type="submit" id="navbutton1" onclick="location.href='http://localhost:8888/confirm/write?chalNo=${chalDto.chalNo}';">
	 	인증하기
	 	</button>
	 </div>

 	<div class="row row-8">
 		<p class="p5">전체(${listCnt})</p>
 	</div>
       
     <div class="row-9 notice-border">
	       <c:forEach var="noticeList" items="${noticeList}"><br>
	     		<span class="label label-notice" >공지</span>
		       	<span class="sp4" >${noticeList.noticeTitle}</span><br>
		       	<span class="sp5">${noticeList.noticeTime}</span><br>
	     		<hr>
	       </c:forEach>
     </div>     
     
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


	<div  class="row-last2 confirm-empty">
		 <c:if test="${listCnt == 0}">
	      		<span class="sp6">작성한 인증글이 없습니다</span>
	      </c:if>
	 </div>
    </div>

	<div class="row row-last center  mb-40">
		<!-- 이전 -->
		<ul class=" pagenation">
			<c:choose>
				<c:when test="${not vo.isFirst()}">
					<li><a href="mylist?chalNo=${chalDto.chalNo}&p=${vo.firstBlock()}">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&laquo;</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${vo.hasPrev()}">
					<li><a href="mylist?chalNo=${chalDto.chalNo}&p=${vo.prevBlock()}">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&lt;</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
				<c:choose>
					<c:when test="${vo.p == i}">
						<li><a href="#" class="on">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="mylist?chalNo=${chalDto.chalNo}&p=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${vo.hasNext()}">
					<li><a href="mylist?chalNo=${chalDto.chalNo}&p=${vo.nextBlock()}">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&gt;</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${not vo.isLast()}">
					<li><a href="mylist?chalNo=${chalDto.chalNo}&p=${vo.lastBlock()}">&raquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&raquo;</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
	</div>
</body>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>