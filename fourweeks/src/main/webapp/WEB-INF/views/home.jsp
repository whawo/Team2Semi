<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 템플릿 페이지인 header.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="4weeks" name="title"/>
</jsp:include>
		<style>
			.img {
				width: 100px;
				height: 100px;
			}
		</style>
		<div>
			<div>함께 해요, 좋은 습관 챌린지</div>
			<div>‘내일 일은 내일의 내가 할 거야.’ 미루는 습관에 데어본 적 있나요? 
			내가 원하는 대로 내 삶을 만들 수 있도록 오늘의 내가 할 수 있는 최선을 다해봐요. 
			4weeks에서는 같은 목표를 가진 사람들과 함께하니까 끝까지 해낼 수 있어요. 
			나에게 필요한 작은 습관 하나만 만들어보세요. 그 다음은 쉽습니다.
			</div>
			<div>#목표관리 #습관형성 #갓생살기</div>
			<img src="/images/main_banner_illust.png">
		</div>
		<hr> <!-- 구역나눔, 삭제필요 -->
		
		<%-- 검색 시작 --%>
		<form action="chal/list">
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
			<input name="keyword" value="${param.keyword}" autocomplete="off" placeholder="지금 나에게 필요한 습관은?">
			<button type="submit">검색</button>
		</form>
		<%-- 검색 끝 --%>
		
		<%-- 주제별 리스트 시작 --%>
		<div>
			<a href="chal/list?type=%27생활%27&keyword=">규칙적인 생활</a>
			<a href="chal/list?type=%27운동%27&keyword=">운동</a>
			<a href="chal/list?type=%27식습관%27&keyword=">식습관</a>
			<a href="chal/list?type=%27정서%27&keyword=">마음챙김</a>
			<a href="chal/list?type=%27취미%27&keyword=">취미</a>
			<a href="chal/list?type=%27학습%27&keyword=">학습</a>
			<a href="chal/list?type=%27환경%27&keyword=">에코•펫</a>
		</div>
		<%-- 주제별 리스트 끝 --%>
		<hr> <!-- 구역나눔, 삭제필요 -->
		
		<div>
			<span>지금 바로 시작하는 거야!</span>
			<a href="chal/list">전체보기</a>
		</div>
		<hr> <!-- 구역나눔, 삭제필요 -->
		
		<%-- 참가자 많은 순 16개 출력 --%>
		<div>
			<c:forEach var="chalDto" items="${list}">
					<div>
						<a href="chal/detail?chalNo=${chalDto.chalNo}">
							<img class="img" src="chal/detail/download?chalNo=${chalDto.getChalNo()}">
							<c:if test="${chalDto.getChalNo() == null}">
								<img class="img" src="/images/bg_default.png">
							</c:if>
						</a>
					</div>
					<div>
						<a href="chal/detail?chalNo=${chalDto.chalNo}">
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
			</c:forEach>
		</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>