<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지글 상세" name="title" />
</jsp:include>
<style>
	.notice-img.no-img {
		display: none;
	}
	.notice-time {
		color: gray;
		font-size: 14px;
	}
	.cancel-btn {
		margin-top: 30px; 
	}
	textarea {
			    width: 100%;
			    border: none;
			    resize: none;
	}
</style>
<script>
	$(function(){
		//첨부파일이 없으면 img 태그 가리기
		$(".notice-img").on("error", function(){
			$(this).addClass("no-img");
		});
		//돌아가기 버튼 클릭 시, 이전 페이지로 이동
		$(".btn-go-back").click(function(){
			history.back();
        });
	});
	
	//뒤로가기로 돌아왔을 때, 이미지 onerror 이벤트 실행을 위해 새로고침
	$(window).bind("pageshow", function (event) {
        if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
          	location.href = location.href;
        }
    });
</script>
	<div class="container-500 mt-50">
		<div class="row left">
			<h3>[no.${detailDto.noticeNo}]</h3> 
			<h2>${detailDto.noticeTitle}</h2>
			<span class="notice-time">${detailDto.noticeTime}</span>
			<c:if test="${detailDto.noticeModified != null}">
				<span class="notice-time">&nbsp; [수정됨] ${detailDto.noticeModified}</span>
			</c:if>
		</div>
		<div class="row center">
			<table class="table table-border">
				<tbody>
					<tr height="350" valign="top">
						<td>${detailDto.noticeContent}
						<img src="detail/download?noticeNo=${detailDto.noticeNo}" class="notice-img  mt-20" width="400"></td>
					</tr>
				</tbody>
			</table>		
		</div>
		
		<div class="row center">
			<a type="button" class="smallbtn btn-go-back" id="smallbutton3">돌아가기</a>
		</div>
	</div>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/template/footer.jsp"></jsp:include>
 