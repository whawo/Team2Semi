<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지글 상세" name="title" />
</jsp:include>

<div class="container-500">
	<div class="row center">
		<h1>${detailDto.noticeNo}번 공지글</h1>
	</div>
	<h2>글 제목 : ${detailDto.noticeContent}</h2>
	<div class="row center">
		<table class="table table-border">
			<tbody>
				<tr height="250" valign="top">
					<th>내용</th>
					<td>${detailDto.noticeContent}
					<img src="detail/download?noticeNo=${detailDto.noticeNo}" class="chal-img detail-top-img  mt-92"></td>
				</tr>
			</tbody>
		</table>		
	</div>
	
	<div class="row center">
		<a class="btn btn-neutral" href="list">목록 보기</a>
	</div>
	<div class="row center">
		<a class="btn btn-negative" href="edit?noticeNo=${detailDto.noticeNo}">수정하기</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>  
 