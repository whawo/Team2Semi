<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="인증글 수정" name="title"/>
</jsp:include> 
<style>
	textarea {
		resize:none;
	}
	
	.confirm-img.no-img {
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script> 코드 변경
<script>
	$(function() {
			//선택된 챌린지 번호를 input type=hidden에 추가
			var chalNo = parseInt($(this).find("option:selected").attr("value"));
			$("input[name=chalNo]").val(chalNo);
			
			//선택된 챌린지 인증방법을 .how-confirm에 추가
			var howConfirm = $("select[name=chalTitle]").find("option:selected").attr("data-howConfirm");
			$(".how-confirm").val(howConfirm);
			
			//인증샷이 없으면 img 영역 미노출
			$(".confirm-img").on("error", function(){
				$(this).addClass("no-img");
			});
			
			//form submit 시 select disabled 속성 제거
			$(".confirm-form").submit(function(){
				$(this).removeAttr('disabled');
            });
			
			//취소버튼 클릭 시, 이전 페이지로 이동
			$(".btn-edit-cancel").click(function(){
				history.back();
	        });
	});
	// 저장하지 않고 벗어날 경우 alert창 띄움
	window.onbeforeunload = function(e) {
	    var dialogText = "사이트에서 나가시겠습니까? 변경사항이 저장되지 않을 수 있습니다.";
	    e.returnValue = dialogText;
	    return dialogText;
	};
</script>    

	<form action="edit" method="post" enctype="multipart/form-data" class="confirm-form">
	<input type="hidden" name="confirmNo" value="${confirmVO.confirmNo}">
	<input type="hidden" name="userId" value="${confirmVO.userId}">
		1. 인증할 챌린지를 선택해주세요.
		<br>
		<!-- 기존 챌린지 자동 선택, 수정 불가 (form submit 시 disabled 속성 제거) -->
		<select name="chalTitle" disabled>
			<option value="">선택하기</option>
			<c:forEach var="list" items="${chalList}">
				<option value="${list.chalNo}" data-chalTitle="${list.chalTitle}" data-howConfirm="${list.howConfirm}" <c:if test="${confirmVO.chalNo == list.chalNo}">selected</c:if>>${list.chalTitle}</option>
		  	</c:forEach>
		</select>
		<input type="hidden" name="chalNo">
		<br><br>
		
		✅ 인증 방법
		<br>
		<textarea class="how-confirm" rows="5" readonly></textarea>
		
		<br><br>
		2. 인증글 제목을 입력해주세요.
		<br>
		타인에게 불쾌감을 주는 단어를 사용할 경우 계정이 영구정지 될 수 있습니다.
		<br>
		<input type="text" name="confirmTitle" placeholder="예) 2022.09.03(토) 헬스 인증" value = "${confirmVO.confirmTitle}" required autocomplete="off">
		<br><br>
		<span><!-- 글자 수 --></span>/40
		<span>제목을 입력해주세요.</span>
		<span>40자까지만 입력할 수 있어요.</span>
		<br><br>
		
		3. 실천한 내용을 입력해주세요.
		<br>
		실천 여부를 알 수 있도록 구체적으로 적어주세요.
		<br>
		<textarea name="confirmContent" placeholder="예) 매일 깃 커밋하기 - 오늘 날짜와 커밋 내역이 보이도록 깃 허브 히스토리를 캡쳐해서 인증샷으로 첨부하기" rows="10" required required autocomplete="off">${confirmVO.confirmContent}</textarea>
		<br><br>
		<span><!-- 글자 수 --></span>/300
		<span>내용을 입력해주세요.</span>
		<span>300자까지만 입력할 수 있어요.</span>
		<br><br>
		
		4. 챌린지 인증샷을 등록하세요. (선택)
		<br>
		jpg, png 파일만 업로드할 수 있어요.
		<br>
		<img src = "detail/download?confirmNo=${confirmVO.confirmNo}" width="200" height="200" class="confirm-img">
		<input type="file" name="attachment" accept="jpg, png"><br><br>
		<!--  선택한 파일 취소하기(js) -->
		<button type="button">삭제</button>
		<br><br>
		<button type="button" class="btn-edit-cancel">취소</button>
		<button type="submit">인증글 저장하기</button>
	</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>