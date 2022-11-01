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
 
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/basic.css">
    

    <style>
    div,ul, li{
    border: 1px dotted transparent;
    }
    .row-move{
    margin: 10px  0 10px 321px;
    }
    .row-1{
    margin-bottom: 30px;
    }
    .row-2{
    margin-bottom: 30px;
    }
    .row-3{
    margin-bottom: 50px;
    }
    .row-9{
    margin-bottom: 30px;
    }
    .row-10{
    margin-top: 60px;
    margin-bottom: 200px;
    }
    .row-11{
    margin-top: 40px;
    }
   .p1{
   font-size: 20px;
   font-weight: 700;
   color: #3f3f3f;
   padding-top: 40px;
   }
   .p2{
   font-size: 14px;
   font-weight: 700;
   color: #3f3f3f;
   padding-top: 10px;
   }
   .p3{
    font-size: 12px;
 	color: #3f3f3f;
 	padding-top: 10px;
   }
   .p4{
     font-size: 16px;
     font-weight: 700;
 	 color: #3f3f3f;
 	 margin-top: 40px;
 	 margin-bottom: 40px;
   }
   .p5{
     font-size: 24px;
     font-weight: 700;
 	 color: #3f3f3f;
 	 text-align: center;
 	 padding-top: 150px;
 	 line-height: 2;
   }
   a:visited{
   }
   .a1{
   font-size: 16px;
   color: #6c7aef;
   border: 1px solid #e5e6f9;
   border-radius: 0.5em;
   background-color: #e5e6f9;
   padding: 10px 65px;
   }
   .a2{
   font-size: 16px;
   font-weight: 700;
   color: #3f3f3f;
   }
.ul-1{
	list-style: none;
	padding-bottom: 20px;
	overflow: hidden;
}
.li-1{
float: left;
width: 33.3%;
border: none;
border-bottom: 1px solid #707070;
cursor:pointer;
}
.c1{
display: block;
padding: 20px;
text-align: center;
}
.c2{
display: block;
padding: 20px;
text-align: center;
}
.c3{
display: block;
padding: 20px;
text-align: center;
}
 .row-5{
position: relative; 
bottom: 180px;
left: 260px; 
margin-bottom: -150px;
}
.row-6{
margin-top: 20px;
}
.row-7{
position: relative;
margin-top: 30px;
margin-bottom: 25px;
}
.row-8{
position: absolute;
bottom: 60px;
left: 350px;
}
	.c1-hover:active,
	.c1-hover:hover{
	font-weight: 700;
	color:  #6c7aef;
	}
	.c2-hover:active,
	.c2-hover:hover{
	font-weight: 700;
	color:  #6c7aef;
	}
	.c3-hover:active,
	.c3-hover:hover{
	font-weight: 700;
	color:  #6c7aef;
	}

.btn1{
font-size:16px;
font-weight: 700;
border: 2px solid  #6c7aef;
border-radius: 0.5em;
background-color: #FFF;
color:  #6c7aef;
padding: 14px 145px;
margin-left: 10px;
cursor:pointer;
}
.btn1:disabled{
font-size:16px;
font-weight: 700;
border: 2px solid  #DDDDDD;
border-radius: 0.5em;
background-color: #DDDDDD;
color:  #AAAAAA;
padding: 14px 146px;
}
.btn2{
font-size:16px;
font-weight: 700;
border: 2px solid  #6c7aef;
border-radius: 0.5em;
background-color: #FFF;
color:  #6c7aef;
padding: 14px 145px;
margin-left: 22px;
cursor:pointer;
}
.btn2:disabled{
font-size:16px;
font-weight: 700;
border: 2px solid  #DDDDDD;
border-radius: 0.5em;
background-color: #DDDDDD;
color:  #AAAAAA;
padding: 14px 145px;
margin-left: 10px;
}
.btn3{
border: 1px solid #DDDDDD;
border-radius: 0.5em;
background-color: #DDDDDD;
font-color: #AAAAAA;
font-size: 16px;
font-weight: 700;
width: 100px;
height:50px;
cursor:pointer;
}
.btn4{
color: #FFF;
}
.btn4{
border: 1px solid #6c7aef;
border-radius: 0.5em;
background-color: #6c7aef;
font-color: #FFF;
font-size: 16px;
font-weight: 700;
width: 100px;
height:50px;
cursor:pointer;
}
.btn4:visited{
color:#FFFFFF;
}
.btn5{
font-size:16px;
font-weight: 700;
border: 2px solid  #6c7aef;
background-color: #6c7aef;
border-radius: 0.5em;
color:  #FFF;
padding: 14px 100px;
margin-left: 238px;
cursor:pointer;

}
.img0{
border-radius: 50%;
width: 100px;
height: 100px;
}
.img-1{
border-radius: 0.5em;
}
.label-wait,
.label-progress,
.label-category{
width: 60px;
border-radius:0.5em;
}
.label-success{
width: 120px;
border-radius:0.5em;
}
.label-close{
width: auto;
border-radius:0.5em;
}
.lab-e{
padding-right: 23px;
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

<div class="row container-794 row-move ">	
	<p class="p1 mt-92">마이페이지</p>
	<div class="row  row-1 center">
	<img src="/profile/download?userId=${myDto.userId}"  class="img0">
	<p class="p2">${myDto.getUserNick()}</p>
	<p class="p3">${myDto.userEmail}</p>
	</div>
	
	<div class="row center row-2">
	<a class="a1"  href="mypage/edit/auth">계정 관리</a>
	</div>
	
	<div class="row">
		<p class="p4">챌린지 현황</p>
	</div>
	
<div class="row row-11">
<ul class="ul-1 tabs">
	<li  class="li-1 c1 c1-hover active" rel="tab1">${chalDto.size()}<p>참가중</p></li>
	<li  class="li-1 c2 c2-hover" rel="tab2">${chalEndDto.size()}<p>완료</p></li>
	<li  class="li-1 c3 c3-hover" rel="tab3">${createDto.size()}<p>개설</p></li>
</ul>	
</div>


<div class="row">
<div  id="tab1"  class="row tab_content">
<c:choose>
			<c:when test="${chalDto.size() == 0}">
			<div class="row row-9">
				<button class="btn1" onclick="location.href='/confirm/write';" disabled>챌린지 인증</button>
   			 	<button class="btn2" onclick="location.href='/chal/create';">챌린지 개설</button>
				<p class="p5">참가한 <br> 챌린지가 없습니다.</p>
				</div>
				<div class="row row-10">
				<button class="btn5" onclick="location.href='/chal/list';" >챌린지 둘러보기</button>
			</div>
			</c:when>

<c:otherwise>
 <div class="row row-3"> 
	<a class="btn1" href ="/confirm/write">챌린지 인증</a>
	<a class="btn2" href ="/chal/create"> 챌린지 개설</a>
</div>
<c:forEach var="chalDto" items="${chalDto}">

<div class="row row-4">
		<a href="chal/mychal?userId=${loginId}&chalNo=${chalDto.chalNo}">
		<img class="img-1" src="chal/detail/download?chalNo=${chalDto.getChalNo()}" width="250" height="170" class="chal-img">
		</a>
</div>

 <div class="row row-5"> 
<c:choose>
		<c:when test="${chalDto.getEndDDay() > 0 && chalDto.getEndDDay() < 28}">
		        <input class="label-close  lab-e" placeholder="	${chalDto.getEndDDay()}일 뒤 종료" disabled>
		</c:when>
		<c:when test="${chalDto.getEndDDay() == 0}">
			 <input class="label-close"  placeholder="	오늘 종료" disabled>
		</c:when>
		<c:when test="${chalDto.getEndDDay() < 0}">
		<input class="label-close" placeholder="종료" disabled>
		</c:when>
		<c:when test="${chalDto.getDDay() == 1}">
			<input class="label-close"  placeholder="내일부터 시작" disabled>
		</c:when>
				<c:when test="${chalDto.getDDay() == 0}">
			<input class="label-close" placeholder="오늘 시작" disabled>
		</c:when>
		<%--시작 전에 인증글 리스트 조회 불가 -> 해당 기능 구현 후 아래 구문 삭제, 위 구문을 otherwise로 변경 --%>
		<c:otherwise>
		<input class="label-close" placeholder="${chalDto.getDDay()}일 뒤 시작" disabled>
		</c:otherwise>
</c:choose>
	
	<div class="row row-6">
		<a class="a2" href="chal/mychal?userId=${loginId}&chalNo=${chalDto.chalNo}">${chalDto.chalTitle}</a>
	</div>
	<div class="row row-7">${chalDto.getStartDate()}~${chalDto.getEndDate()}</div>
		<input class="label-category" placeholder="${chalDto.getChalTopic()}" disabled>
		<input class="label-success" placeholder="현재 달성률 : <fmt:formatNumber type="number" pattern="0" value="${chalDto.cnt*100/28}"/>%" disabled>
		
<div class="row row-8">		
				 <c:choose>
					<c:when test="${chalDto.getDDay()>0}">
					 <button class="btn3"  disabled>내 인증글</button>
				 </c:when>
				 <c:otherwise>
				 	<button class="btn4" onclick="location.href='/confirm/mylist?chalNo=${chalDto.chalNo}';">내 인증글</button>
				 </c:otherwise>
				 </c:choose>
</div>
				 </div>

 
</c:forEach>
</c:otherwise>
</c:choose>
        </div>

          <!-- #tab2 --> 

<div id="tab2" class="row row-9 tab_content">

<c:choose>
		<c:when test="${chalEndDto.size() == 0}">
<div class="row row-9 ">
			<button class="btn1" onclick="location.href='/confirm/write';" disabled>챌린지 인증</button>
   			 	<button class="btn2" onclick="location.href='/chal/create';">챌린지 개설</button>
			<p class="p5">완료한 <br> 챌린지가 없습니다.</p>
</div>		
<div class="row row-10">
	<button class="btn5" onclick="location.href='/chal/list';" >챌린지 둘러보기</button>
</div>
		</c:when>
		
<c:otherwise>
 <div class="row row-3"> 
	<a class="btn1" href ="/confirm/write">챌린지 인증</a>
	<a class="btn2" href ="/chal/create"> 챌린지 개설</a>
</div>
	<c:forEach var="chalEndDto" items="${chalEndDto}">
<div class="row row-4">
		<a href="chal/mychal?userId=${loginId}&chalNo=${chalEndDto.chalNo}">
		<img class="img-1" src="chal/detail/download?chalNo=${chalEndDto.getChalNo()}" width="250" height="170" class="chal-img">
		</a>
</div>
<div class="row row-5"> 
<c:choose>
		<c:when test="${chalEndDto.getEndDDay() > 0 && chalEndDto.getEndDDay() < 28}">
		        <input class="label-close lab-e"  placeholder="	${chalDto.getEndDDay()}일 뒤 종료" disabled>
		</c:when>
		<c:when test="${chalEndDto.getEndDDay() == 0}">
			 <input class="label-close"  placeholder="오늘 종료" disabled>
		</c:when>
		<c:when test="${chalEndDto.getEndDDay() < 0}">
		<input class="label-close" placeholder="종료" disabled>
		</c:when>
		<c:when test="${chalEndDto.getDDay() == 1}">
			<input class="label-close"  placeholder="내일부터 시작" disabled>
		</c:when>
				<c:when test="${chalEndDto.getDDay() == 0}">
			<input class="label-close" placeholder="오늘 시작" disabled>
		</c:when>
		<%--시작 전에 인증글 리스트 조회 불가 -> 해당 기능 구현 후 아래 구문 삭제, 위 구문을 otherwise로 변경 --%>
		<c:otherwise>
		<input class="label-close" placeholder="${chalEndDto.getDDay()}일 뒤 시작" disabled>
		</c:otherwise>
</c:choose>
	
	<div class="row row-6">
		<a class="a2" href="chal/mychal?userId=${loginId}&chalNo=${chalEndDto.chalNo}" maxlength="40"> ${chalEndDto.chalTitle}</a>
	</div>
	<div class="row row-7">${chalEndDto.getStartDate()}~${chalEndDto.getEndDate()}</div>
		<input class="label-category" placeholder="${chalEndDto.getChalTopic()}" disabled>
		<input class="label-success" placeholder="현재 달성률 : <fmt:formatNumber type="number" pattern="0" value="${chalEndDto.cnt*100/28}"/>%" disabled>
		
<div class="row row-8">		
				 <c:choose>
					<c:when test="${chalEndDto.getDDay()>0}">
					 <button class="btn3"  disabled>내 인증글</button>
				 </c:when>
				 <c:otherwise>
				  	<button class="btn4" onclick="location.href='/confirm/mylist?chalNo=${chalEndDto.chalNo}';">내 인증글</button>
				 </c:otherwise>
				 </c:choose>
</div>
				 </div>

</c:forEach>
</c:otherwise>
</c:choose>
    </div> 
    


<div id="tab3" class=" row row-9 tab_content">

	<c:choose>
		<c:when test="${createDto.size() == 0}">
		<div class="row row-9">
			<button class="btn1" onclick="location.href='/confirm/write';" disabled>챌린지 인증</button>
   			 	<button class="btn2" onclick="location.href='/chal/create';">챌린지 개설</button>
			<p class="p5">개설한 <br> 챌린지가 없습니다.</p>
			</div>
			<div class="row row-10">
				<button class="btn5" onclick="location.href='/chal/list';" >챌린지 둘러보기</button>
			</div>
		</c:when>

<c:otherwise>
 <div class="row row-3"> 
	<a class="btn1" href ="/confirm/write">챌린지 인증</a>
	<a class="btn2" href ="/chal/create"> 챌린지 개설</a>
</div>
        <c:forEach var="createDto" items="${createDto}">
        
<div class="row row-4">
		<a href="chal/mychal?userId=${loginId}&chalNo=${createDto.chalNo}">
		<img class="img-1" src="chal/detail/download?chalNo=${createDto.getChalNo()}" width="250" height="170" class="chal-img">
		</a>
</div>
<div class="row row-5"> 
<c:choose>
		<c:when test="${createDto.getEndDDay() > 0 && createDto.getEndDDay() < 28}">
		        <input class="label-close " placeholder="	${createDto.getEndDDay()}일 뒤 종료" disabled>
		</c:when>
		<c:when test="${createDto.getEndDDay() == 0}">
			 <input class="label-close"  placeholder="	오늘 종료" disabled>
		</c:when>
		<c:when test="${createDto.getEndDDay() < 0}">
		<input class="label-close" placeholder="종료" disabled>
		</c:when>
		<c:when test="${createDto.getDDay() == 1}">
			<input class="label-close"  placeholder="내일부터 시작" disabled>
		</c:when>
				<c:when test="${createDto.getDDay() == 0}">
			<input class="label-close" placeholder="오늘 시작" disabled>
		</c:when>
		<%--시작 전에 인증글 리스트 조회 불가 -> 해당 기능 구현 후 아래 구문 삭제, 위 구문을 otherwise로 변경 --%>
		<c:otherwise>
		<input class="label-close" placeholder="${createDto.getDDay()}일 뒤 시작" disabled>
		</c:otherwise>
</c:choose>
	
	<div class="row row-6">
		<a class="a2" href="chal/mychal?userId=${loginId}&chalNo=${createDto.chalNo}" maxlength="40"> ${createDto.chalTitle}</a>
	</div>
	<div class="row row-7">${createDto.getStartDate()}~${createDto.getEndDate()}</div>
		<input class="label-category" placeholder="${createDto.getChalTopic()}" disabled>
		<input class="label-success" placeholder="현재 달성률 : <fmt:formatNumber type="number" pattern="0" value="${createDto.cnt*100/28}"/>%" disabled>
		
<div class="row row-8">		
				 <c:choose>
					<c:when test="${createDto.getDDay()>0}">
					 <button class="btn3"  disabled>내 인증글</button>
				 </c:when>
				 <c:otherwise>
				 	<button class="btn4" onclick="location.href='/confirm/mylist?chalNo=${createDto.chalNo}';">내 인증글</button>
				 </c:otherwise>
				 </c:choose>
				</div>
				 </div>

</c:forEach> 



</c:otherwise>
</c:choose>
    </div> 
</div>


<div class="row">
        <ul class="page">
            <li><a href="#">&lt;</a></li>
            <li><a href="#">1</a></li>
            <li class="on"><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">6</a></li>
            <li><a href="#">&gt;</a></li>
        </ul>
    </div>
</div> 


</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>