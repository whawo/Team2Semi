   <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="4weeks" name="title" />
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
    </head>
<body>
        <ul class="list">
			<li>챌린지 이미지 :<img
				src="detail/download?chalNo=${chalDto.getChalNo()}"></li>
			<li>챌린지 제목 : ${chalDto.getChalTitle()}</li>
			<li>챌린지 시작일: ${chalDto.getStartDate()}~${chalVO.endDate}</li>
			<a href = "/chal/detail?chalNo=${chalDto.getChalNo()}"><button>챌린지 바로가기</button></a><br>
			</ul>
			
    <ul class="tabs">
        <li class="active" rel="tab1">탭1</li>
        <li rel="tab2">탭2</li>
    </ul>
    
    <div class="tab_container">
    
        <!-- #tab1 -->
        <div id="tab1" class="tab_content">
    
		<ul class="list">
            달성률 : <fmt:formatNumber type="number" 
				 pattern="0" value="${progressDto*100/28}"/>%
		</ul>

        </div>

          <!-- #tab2 --> 
    <div id="tab2" class="tab_content">
<table class="table table-border">
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
</div>

</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>