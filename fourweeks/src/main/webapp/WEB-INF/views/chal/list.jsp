<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="4weeks" name="title"/>
</jsp:include>
	<%-- 테스트용 이미지사이즈 커스텀, 디자인시 삭제요망 --%>
	<style>
		.list-img {
			width: 100px;
			height: 100px;
		}
	</style>
	
	<%-- jQuery 시작 --%>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script>
		$(function(){
			//챌린지 썸네일이 없으면 기본 이미지로 대체
			$(".list-img").on("error", function(){
				$(this).attr("src", "/images/bg_default.png");
			});
			//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
			$(window).bind("pageshow", function (event) {
		        if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
		          	location.href = location.href;
		        }
		    });
			// 사용자가 선택한 주제를 selected 시켜라, type이 null이면 "chal_tilte"을 찍어라
			$("#autoSelect-type").val("${param.type}" || "chal_title");
			// 사용자가 선택한 정렬을 selected 시켜라, alignType이 null이면 "d_day asc"를 찍어라
			$("#autoSelect-alignType").val(decodeURIComponent("${param.alignType}" || "d_day asc"));
		});
	</script>
	
		<%-- 검색 시작 --%>
		<form action="list">
			<select name="type" id="autoSelect-type">
				<option value="chal_title" selected>전체</option>
				<option value="운동">운동</option>
				<option value="식습관">식습관</option>
				<option value="생활">생활</option>
				<option value="정서">정서</option>
				<option value="취미">취미</option>
				<option value="학습">학습</option>
				<option value="환경">환경</option>
				<option value="그 외">그 외</option>
			</select>
			<input name="keyword" value="${param.keyword}" 
				autocomplete="off" placeholder="지금 나에게 필요한 습관은?">
			<button type="submit">검색</button>
			<select name="alignType" id="autoSelect-alignType" onchange="this.form.submit()">
				<option value="d_day asc">시작 임박</option>
				<option value="chal_person desc">참가자 많은 순</option>
				<option value="chal_person asc">참가자 적은 순</option>
			</select>
		</form>
		
		<%-- 모집중 페이지 --%>
		<c:forEach var="chalDto" items="${list}">
			<div> 
				<div>
					<div>
						<a href="detail?chalNo=${chalDto.chalNo}">
							<img class="list-img" src="detail/download?chalNo=${chalDto.getChalNo()}">
						</a>
					</div>
					<div>
						<a href="detail?chalNo=${chalDto.chalNo}">
							${chalDto.chalTitle}
						</a>
					</div>
					<div>${chalDto.chalPerson}명 / 10명</div>
					<c:if test="${chalDto.getDDay() == 0}">
						<div>오늘 시작</div>
					</c:if>
					<c:if test="${chalDto.getDDay() > 0}">
						<div>${chalDto.getDDay()}일 뒤 시작</div>
					</c:if>
					<div>~${chalDto.endDate}</div>
					<div>
						<c:if test="${chalDto.getDDay() > -1}">
							<span>모집중</span>
						</c:if>
						<span>${chalDto.chalTopic}</span>
					</div>
					<br>
				</div>
			</div>
		</c:forEach>
		<c:if test="${vo.count == 0}">
			<div>검색 결과가 없습니다.</div>
		</c:if>
		
		<%-- 페이지 네비게이터 시작 --%>
		<c:if test="${vo.count > 0}">
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
		</c:if>
		<hr> <!-- 모집중 페이지 끝 -->
		
		<%-- 전체 페이지 시작 --%>
		<c:forEach var="chalDtoRecruited" items="${recruitedList}">
			<div> 
				<div>
					<div>
						<a href="detail?chalNo=${chalDtoRecruited.chalNo}">
							<img class="list-img" src="detail/download?chalNo=${chalDtoRecruited.getChalNo()}">
						</a>
					</div>
					<div>
						<a href="detail?chalNo=${chalDtoRecruited.chalNo}">
							${chalDtoRecruited.chalTitle}
						</a>
					</div>
					<div>${chalDtoRecruited.chalPerson}명 / 10명</div>
					
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
					<div>~${chalDtoRecruited.endDate}</div>
					<div>
						<c:choose>
							<c:when test="${chalDtoRecruited.getDDay() < -28}">
								<span>종료</span>
							</c:when>
							<c:when test="${chalDtoRecruited.getDDay() < 0}">
								<span>진행중</span>
							</c:when>
							<c:otherwise>
								<span>모집중</span>
							</c:otherwise>
						</c:choose>
						<span>${chalDtoRecruited.chalTopic}</span>
					</div>
					<br>
				</div>
			</div>
		</c:forEach>
		<c:if test="${vo.count == 0}">
			<div>검색 결과가 없습니다.</div>
		</c:if>
		<%-- 페이지 네비게이터 시작 --%>
		<c:if test="${voRecruited.count > 0}">
			<c:choose>
				<c:when test="${not voRecruited.isFirst()}">
					<a href="list?p=${voRecruited.firstBlock()}&${voRecruited.parameter()}">&laquo;</a>
				</c:when>
				<c:otherwise>
					<a href="#">&laquo;</a>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${voRecruited.hasPrev()}">
					<a href="list?p=${voRecruited.prevBlock()}&${voRecruited.parameter()}">&lt;</a>
				</c:when>
				<c:otherwise>
					<a href="#">&lt;</a>
				</c:otherwise>
			</c:choose>
			<!-- 숫자 -->
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
			<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
			<c:choose>
				<c:when test="${voRecruited.hasNext()}">
					<a href="list?p=${voRecruited.nextBlock()}&${voRecruited.parameter()}">&gt;</a>
				</c:when>
				<c:otherwise>
					<a href="#">&gt;</a>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${not voRecruited.isLast()}">
					<a href="list?p=${voRecruited.lastBlock()}&${voRecruited.parameter()}">&raquo;</a>
				</c:when>
				<c:otherwise>
					<a href="#">&raquo;</a>
				</c:otherwise>
			</c:choose>
		</c:if>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>