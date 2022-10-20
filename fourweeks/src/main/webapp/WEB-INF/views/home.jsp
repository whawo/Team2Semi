<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 템플릿 페이지인 header.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<div class="container-900 mt-40 mb-40">
	<div class="row center">
		<h1>홈페이지 방문을 환영합니다!</h1>
	</div>
	
	<div class="row float-container">
		<div class="float-left w-50 p-20">
			<div class="row">
				<h2>
					최근에 작성된 게시글
					<small><a href="board/list">더보기</a></small>
				</h2>	
			</div>
			
			<div class="row">
				<table class="table table-slit">
					<thead>
						<tr>
							<th width="50%">제목</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="boardDto" items="${boardList}">
						<tr>
							<td align="left">
								<a href="board/detail?boardNo=${boardDto.boardNo}">
									${boardDto.boardTitle}	
								</a>
							</td>
							<td>${boardDto.boardWriter}</td>
							<td>${boardDto.boardRead}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="row mt-40">
				<h2>이 달의 게시글 작성왕</h2>
			</div>
			
			<div class="row">
				<table class="table table-slit">
					<thead>
						<tr>
							<th>아이디</th>
							<th>닉네임</th>
							<th>작성수</th>
							<th>순위</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="memberDto" items="${memberList}">
						<tr>
							<td>${memberDto.memberId}</td>
							<td>${memberDto.memberNick}</td>
							<td>${memberDto.cnt}</td>
							<td>${memberDto.rank}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="row mt-40">
				<h2>
					포켓몬스터 현황
					<small><a href="pocketmon/list">더보기</a></small>
				</h2>
			</div>
			
			<div class="row">
				<table class="table table-slit">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>속성</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="pocketmonDto" items="${pocketmonList}">
						<tr>
							<td>${pocketmonDto.no}</td>
							<td>${pocketmonDto.name}</td>
							<td>${pocketmonDto.type}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="float-left w-50 p-20">
		
			<div class="row">
				<h2>
					최근에 작성된 방명록
					<small><a href="guestbook/list">더보기</a></small>
				</h2>
			</div>
			
			<div class="row">
				<table class="table table-slit">
					<thead>
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th>메뉴</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="guestBookDto" items="${guestBookList}">
						<tr>
							<td>${guestBookDto.no}</td>
							<td>${guestBookDto.name}</td>
							<td><a href="guestbook/detail?no=${guestBookDto.no}">보러가기</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="row mt-40">
				<h2>
					최근 등록 음원
					<small><a href="music/list">더보기</a></small>
				</h2>
			</div>
			
			<div class="row">
				<table class="table table-slit">
					<thead>
						<tr>
							<th>제목</th>
							<th>가수</th>
							<th>앨범</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="musicDto" items="${musicList}">
						<tr>
							<td>
								<a href="music/detail?musicNo=${musicDto.musicNo}">
									${musicDto.musicTitle}
								</a>
							</td>
							<td>${musicDto.musicArtist}</td>
							<td>${musicDto.musicAlbum}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</div>

<%-- 템플릿 페이지인 footer.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
