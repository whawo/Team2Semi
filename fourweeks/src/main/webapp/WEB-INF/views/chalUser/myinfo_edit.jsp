<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="계정 관리" name="title"/>
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
		//프로필 이미지가 없으면 기본 아이콘으로 대체
		$(".user-img").on("error", function(){
			$(this).replaceWith("<i class='fa-solid fa-circle-user'></i>");
		});
		
		$(".btn-leave").click(function(){
			var choice = confirm("정말 탈퇴하시겠습니까?");
            if(!choice) {
                return false;
            } else {
            	return true;
            }
		});
	});
</script>
<div class="container-794">
	<div class="row center">
		계정 관리
	</div>
	<div class="row">
		<form action="edit" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userId" value="${userDto.userId}">
			프로필 사진: <img src="/profile/download?userId=${userDto.userId}" width="100" height="100" class="user-img">
			<br><br>
			<input type="file" name="attachment" accept="jpg, png"><br><br>
			<!--  선택한 파일 취소하기(js) -->
			<button type="button">삭제</button>
			<br><br>
			아이디 : ${userDto.userId}
			<br><br>
			닉네임 : <input type="text" name="userNick" required placeholder="4~10자의 한글/영문/숫자" value="${userDto.userNick}">
			<span>이미 사용 중인 닉네임입니다</span>
			<span>닉네임을 입력해주세요</span>
			<span>4~10자의 한글/영문/숫자만 입력 가능합니다</span>				
			<br><br>
			이메일 : <input type="text" name="userEmail" required placeholder="예) id@4weeks.com" value="${userDto.userEmail}">
			<span>이메일을 입력해주세요</span>				
			<br><br>
			비밀번호 : <a href="edit/pw">비밀번호 변경</a>
			<br><br>
			<!-- 탈퇴 버튼 클릭 시, 확인 팝업 노출(jQuery) -->
			<a href="/leave" class="btn-leave">탈퇴하기</a>
			<br><br>
			<a href="/mypage">취소</a>
			<button type="submit">저장하기</button>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>