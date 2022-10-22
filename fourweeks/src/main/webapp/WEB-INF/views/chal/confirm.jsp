<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="챌린지 인증" name="title"/>
</jsp:include>
<style>
	textarea {
		resize:none;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function() {
		$("select[name=chalTitle]").on("change", function(){
			//선택된 챌린지 번호를 input type=hidden에 추가
			var chalNo = parseInt($(this).find("option:selected").attr("value"));
			$("input[name=chalNo]").val(chalNo);
			
			//선택된 챌린지 인증방법을 .how-confirm에 추가
			var howConfirm = $("select[name=chalTitle]").find("option:selected").attr("data-howConfirm");
			$(".how-confirm").val(howConfirm);
		});
		//파라미터에 chalNo가 있을 때만 해당 챌린지를 자동으로 선택
		var urlParams = new URL(location.href).searchParams;
		var chalNo = urlParams.get('chalNo');
		if(chalNo){			
			$("select[name=chalTitle]").val(chalNo).attr("selected", "selected").trigger("change");
		}
	});
</script>    

	<form action="confirm" method="post" enctype="multipart/form-data">
		1. 인증할 챌린지를 선택해주세요.
		<br>
		<select name="chalTitle">
		  	<option value="">선택하기</option>
			<c:forEach var="list" items="${chalList}">
				<option value="${list.chalNo}" data-chalTitle="${list.chalTitle}" data-howConfirm="${list.howConfirm}">${list.chalTitle}</option>
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
		<input type="text" name="confirmTitle" placeholder="예) 2022.09.03(토) 헬스 인증" required autocomplete="off">
		<br><br>
		<span><!-- 글자 수 --></span>/40
		<span>제목을 입력해주세요.</span>
		<span>40자까지만 입력할 수 있어요.</span>
		<br><br>
		
		3. 실천한 내용을 입력해주세요.
		<br>
		실천 여부를 알 수 있도록 구체적으로 적어주세요.
		<br>
		<textarea name="confirmContent" placeholder="예) 매일 깃 커밋하기 - 오늘 날짜와 커밋 내역이 보이도록 깃 허브 히스토리를 캡쳐해서 인증샷으로 첨부하기" rows="10" required required autocomplete="off"></textarea>
		<br><br>
		<span><!-- 글자 수 --></span>/300
		<span>내용을 입력해주세요.</span>
		<span>300자까지만 입력할 수 있어요.</span>
		<br><br>
		
		4. 챌린지 인증샷을 등록하세요. (선택)
		<br>
		jpg, png 파일만 업로드할 수 있어요.
		<br>
		<!-- 썸네일 미리보기(js) 영역-->
		<input type="file" name="attachment" accept="jpg, png"><br><br>
		<!--  선택한 파일 취소하기(js) -->
		<button type="button">삭제</button>
		<br><br>
		<button type="button">취소</button>
		<button type="submit">인증글 저장하기</button>
	</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>