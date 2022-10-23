 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4weeks 챌린지</title>
		<style>
			.img {
				width: 100px;
				height: 100px;
			}
		</style>
	</head>
	<body>
		<div class="page-1">
			<%-- 검색 시작 --%>
			<c:set var="type" value="${param.type}"></c:set>
			<form action="list">
				<c:choose>
					<c:when test="${type eq null}">
						<select name="type">
							<option value="chal_title">전체</option>
							<option value="'운동'">운동</option>
							<option value="'식습관'">식습관</option>
							<option value="'생활'">생활</option>
							<option value="'정서'">정서</option>
							<option value="'취미'">취미</option>
							<option value="'학습'">학습</option>
							<option value="'환경'">환경</option>
							<option value="'그 외'">그 외</option>
						</select>
					</c:when>
					<c:when test="${type eq 'chal_title'}">
						<select name="type">
							<option value="chal_title" selected>전체</option>
							<option value="'운동'">운동</option>
							<option value="'식습관'">식습관</option>
							<option value="'생활'">생활</option>
							<option value="'정서'">정서</option>
							<option value="'취미'">취미</option>
							<option value="'학습'">학습</option>
							<option value="'환경'">환경</option>
							<option value="'그 외'">그 외</option>
						</select>
					</c:when>
					<c:when test="${type eq '운동'}">
						<select name="type">
							<option value="chal_title">전체</option>
							<option value="'운동'" selected>운동</option>
							<option value="'식습관'">식습관</option>
							<option value="'생활'">생활</option>
							<option value="'정서'">정서</option>
							<option value="'취미'">취미</option>
							<option value="'학습'">학습</option>
							<option value="'환경'">환경</option>
							<option value="'그 외'">그 외</option>
						</select>
					</c:when>
					<c:when test="${param.type eq '%27식습관%27'}">
						<select name="type">
							<option value="chal_title">전체</option>
							<option value="'운동'">운동</option>
							<option value="'식습관'" selected>식습관</option>
							<option value="'생활'">생활</option>
							<option value="'정서'">정서</option>
							<option value="'취미'">취미</option>
							<option value="'학습'">학습</option>
							<option value="'환경'">환경</option>
							<option value="'그 외'">그 외</option>
						</select>
					</c:when>
					<c:when test="${param.type eq '%27생활%27'}">
						<select name="type">
							<option value="chal_title">전체</option>
							<option value="'운동'">운동</option>
							<option value="'식습관'">식습관</option>
							<option value="'생활'" selected>생활</option>
							<option value="'정서'">정서</option>
							<option value="'취미'">취미</option>
							<option value="'학습'">학습</option>
							<option value="'환경'">환경</option>
							<option value="'그 외'">그 외</option>
						</select>
					</c:when>
					<c:when test="${param.type eq '%27정서%27'}">
						<select name="type">
							<option value="chal_title">전체</option>
							<option value="'운동'">운동</option>
							<option value="'식습관'">식습관</option>
							<option value="'생활'">생활</option>
							<option value="'정서'" selected >정서</option>
							<option value="'취미'">취미</option>
							<option value="'학습'">학습</option>
							<option value="'환경'">환경</option>
							<option value="'그 외'">그 외</option>
						</select>
					</c:when>
					<c:when test="${param.type eq '%27취미%27'}">
						<select name="type">
							<option value="chal_title">전체</option>
							<option value="'운동'">운동</option>
							<option value="'식습관'">식습관</option>
							<option value="'생활'">생활</option>
							<option value="'정서'">정서</option>
							<option value="'취미'" selected>취미</option>
							<option value="'학습'">학습</option>
							<option value="'환경'">환경</option>
							<option value="'그 외'">그 외</option>
						</select>
					</c:when>
					<c:when test="${param.type eq '학습'}">
						<select name="type">
							<option value="chal_title">전체</option>
							<option value="'운동'">운동</option>
							<option value="'식습관'">식습관</option>
							<option value="'생활'">생활</option>
							<option value="'정서'">정서</option>
							<option value="'취미'">취미</option>
							<option value="'학습'" selected>학습</option>
							<option value="'환경'">환경</option>
							<option value="'그 외'">그 외</option>
						</select>
					</c:when>
					<c:when test="${param.type eq '%27환경%27'}">
						<select name="type">
							<option value="chal_title">전체</option>
							<option value="'운동'">운동</option>
							<option value="'식습관'">식습관</option>
							<option value="'생활'">생활</option>
							<option value="'정서'">정서</option>
							<option value="'취미'">취미</option>
							<option value="'학습'">학습</option>
							<option value="'환경'" selected>환경</option>
							<option value="'그 외'">그 외</option>
						</select>
					</c:when>
					<c:otherwise>
						<select name="type">
							<option value="chal_title">전체</option>
							<option value="'운동'">운동</option>
							<option value="'식습관'">식습관</option>
							<option value="'생활'">생활</option>
							<option value="'정서'">정서</option>
							<option value="'취미'">취미</option>
							<option value="'학습'">학습</option>
							<option value="'환경'">환경</option>
							<option value="'그 외'" selected>그 외</option>
						</select>
					</c:otherwise>
				</c:choose>
				<input name="keyword" value="${param.keyword}" autocomplete="off" placeholder="지금 나에게 필요한 습관은?">
				<button type="submit">검색</button>
			</form>
			<%-- 검색 끝 --%>
			
			<%-- 모집중 페이지 --%>
			<c:forEach var="chalDto" items="${list}">
				<div> 
					<div>
						<div>
							<a href="detail?chalNo=${chalDto.chalNo}">
								<img class="img" src="detail/download?chalNo=${chalDto.getChalNo()}">
							</a>
						</div>
						<div>
							<a href="detail?chalNo=${chalDto.chalNo}">
								${chalDto.chalTitle}
							</a>
						</div>
						<div>${chalDto.chalPerson}명 / 10명</div>
						<div>${chalDto.getDDay()}일 뒤 시작</div>
						<div>~${chalDto.endDate}</div>
						<div>
							<c:if test="${chalDto.getDDay() > 0}">
								<span>모집중</span>
							</c:if>
							<span>${chalDto.chalTopic}</span>
						</div>
						<br>
					</div>
				</div>
			</c:forEach>
			<c:if test="${chalDto.getRn() == null}">
				<div>검색 결과가 없습니다.</div>
			</c:if>
		</div>
		<%-- 모집중 페이지 끝 --%>
		
		<%-- 전체 페이지 시작 --%>
		
		<%-- 전체 페이지 끝 --%>
		
		<%-- 페이지 네비게이터 시작 --%>
			<c:choose>
				<c:when test="${not vo.isFirst()}">
					<a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a>
				</c:when>
				<c:otherwise>
					<a href="#">&laquo;</a>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${vo.hasPrev()}">
					<a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a>
				</c:when>
				<c:otherwise>
					<a href="#">&lt;</a>
				</c:otherwise>
			</c:choose>
			
			<!-- 숫자 -->
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
			
			<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
			<c:choose>
				<c:when test="${vo.hasNext()}">
					<a href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a>
				</c:when>
				<c:otherwise>
					<a href="#">&gt;</a>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${not vo.isLast()}">
					<a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a>
				</c:when>
				<c:otherwise>
					<a href="#">&raquo;</a>
				</c:otherwise>
			</c:choose>
		<%-- 페이지 네비게이터 끝 --%>
		</body>
</html>