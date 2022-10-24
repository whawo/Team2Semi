<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="4weeks" name="title" />
</jsp:include>
<style>
ul.list {
	list-style: none;
	padding: 0;
	margin: 0;
	border: 1px solid gray;
	font-size: 20px;
}

ul.list>li {
	border: 1px solid gray;
	padding: 0.5em;
}

ul.list>li:hover {
	color: #d63031;
}
</style>
<table class="table table-border">
		<tbody>
			<c:forEach var="dto" items="${dto}">
			<tr>
				<th>${dto.getUserId()}</th>
			</tr>
			</c:forEach>
		</tbody>
	</table>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





