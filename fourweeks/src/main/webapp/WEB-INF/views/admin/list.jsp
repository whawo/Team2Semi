<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
	<jsp:param value="공지 목록" name="title" />
</jsp:include>
<style>
	.write-btn {
		width: 80px;
		height:42px;
	}
	
	.search-btn {
		width: 80px;
		height: 60px;
	}
	
	.search-bar {
		width: 450px;
		height: 60px;
		font-size: 16px;
		padding: 15px;
		border: 2px solid #6c7aef;
		border-radius: 0.5em;
	}
	
	input:focus {
		outline: none;
	}
	
	.edit-btn {
		width: 120px;
	}
	
	td > a {
		color: #6C7AEF;
		font-weight: bold;
	}
	
	th > a {
		color: black;
		font-weight: bold;
	}
	
	td > a,
	th > a {
		text-decoration: none;
	}
	
	th > a:visited {
		color: black;
		font-weight: bold;
	}
	
	td > a:visted {
		color: #6C7AEF;
		font-weight: bold;
	}
	
</style>

<div id="dashboard">
	<div class="container-600 mt-40 mb-40">
		
		<div class="row center">
			<h2>공지 목록</h2>
		</div>
		
		<div class="row right">
			<a href="write" class="smallbtn write-btn" id="smallbutton1">글쓰기</a>
		</div>
		
		<form action="list" method="get">
			<div class="row center mt-40">
				<input class="input search-bar"  name="keyword" placeholder="글 제목" required autocomplete="off">
				<button type="submit" class="smallbtn search-btn" id="smallbutton3">검색</button>
			</div>
		</form>
		
		<div class="row mt-40">
		<table class="table table-slit w-100">
			<tbody>
				<c:forEach var="list" items="${list}">
				<tr>
						<th width="10%"><a href="detail?noticeNo=${list.noticeNo}">${list.noticeNo}</a></th>
						<td width="50%"><a href="detail?noticeNo=${list.noticeNo}">${list.noticeTitle}</a></td>
					    <td width="20%">${list.noticeTime}</td>
				     	<td width="20%"><a class="smallbtn edit-btn" id="smallbutton4" href="edit?noticeNo=${list.noticeNo}">수정하기</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
	</div>
</div>
</body>
</html>


