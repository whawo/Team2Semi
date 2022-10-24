<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지 개설</title>
</head>
<body>
	<div>
		원하는 챌린지를 직접 개설해보세요.
	</div>
	<div>
		내가 개설한 챌린지에 자동으로 참가하게 됩니다.
	</div>
	
	<form action="create" method="post" enctype="multipart/form-data">
		<div>
			<div>
				1. 어떤 주제와 관련이 있나요?
			</div>
			<div>			
				<label><input type="radio" name="chalTopic" value="운동" checked>운동</label>
				<label><input type="radio" name="chalTopic" value="식습관">식습관</label>
				<label><input type="radio" name="chalTopic" value="생활">생활</label>
				<label><input type="radio" name="chalTopic" value="정서">정서</label>
				<label><input type="radio" name="chalTopic" value="취미">취미</label>
				<label><input type="radio" name="chalTopic" value="학습">학습</label>
				<label><input type="radio" name="chalTopic" value="환경">환경</label>
				<label><input type="radio" name="chalTopic" value="그 외">그 외</label>
			</div>
		
			<div>
				2. 챌린지 제목을 입력해주세요.
			</div>
			<div>
				타인에게 불쾌감을 주는 단어를 사용할 경우 계정이 영구정지 될 수 있습니다.
			</div>
			<div>
				<input type="text" name="chalTitle" placeholder="예) 아침 6시에 일어나기" required autocomplete="off">
				<span><!-- 글자 수 --></span>
				<!-- helper text -->
				<span>제목을 입력해주세요.</span>
				<span>40자까지만 입력할 수 있어요.</span>
			</div>
			
			<div>
				3. 인증 방법을 입력해주세요.
			</div>
			<div>
				타인에게 불쾌감을 주는 단어를 사용할 경우 계정이 영구정지 될 수 있습니다.
			</div>
			<div>
				<textarea name="howConfirm" placeholder="예) 매일 깃 커밋하기 - 오늘 날짜와 커밋 내역이 보이도록 깃 허브 히스토리를 캡쳐해서 인증샷으로 첨부하기" rows="10" required autocomplete="off"></textarea>
				<span><!-- 글자 수 --></span>
				<!-- helper text -->
				<span>인증 방법을 입력해주세요.</span>
				<span>300자까지만 입력할 수 있어요.</span>
			</div>
			
			<div>
				4. 챌린지 시작일을 선택해주세요.
			</div>
			<div>
				개설일로부터 5일 이내에 시작해야 해요.
			</div>
			<div>
				<!-- datepicker -->
				<input type="text" name="startDate" required>
			</div>
			<div>
				<span>챌린지 예상 종료일 </span>
				<!-- 종료일: startDate + 28일 -->
				<span></span>
			</div>
			
			<div>
				5. 모집 방식을 확인해주세요.
			</div>
			<div>
				<span>[모집 방식] 선착순 자동 마감</span>
				<span>[참가 인원] 최대 10명까지 참가할 수 있어요. 챌린지 시작 전에 10명이 다 모이면 자동으로 모집이 마감됩니다.</span>
			</div>
			<div>
				<input type="checkbox" id="ck-recruit" required>
				<label for="ck-recruit">확인했어요!</label>
				<!-- helper text -->
				<span>확인 후 체크해주세요.</span>
			</div>
			
			<div>
				6. 챌린지 대표 이미지를 등록하세요. (선택)
			</div>
			<div>
				노출 위치에 따라  섬네일이 축소/확대되어 적용됩니다. 등록하지 않는 경우, 랜덤으로 기본 이미지가 적용됩니다.
			</div>
			<div>
				<input type="file" name="attachment" accept="jpg, png"><br><br>
				<!-- 썸네일 미리보기(js) -->
				<img>
				<!--  선택한 파일 취소하기(js) -->
				<button type="button">삭제</button>
			</div>
			
			<div>
				7. 챌린지를 소개해주세요. (선택)
			</div>
			<div>
				다른 사람들이 챌린지 참가를 결정할 때 참고할 수 있어요.
			</div>
			<div>
				<textarea name="chalContent" placeholder="예) 어려워서 하기 싫은 알고리즘 문제풀이 매일매일 같이 인증해요~!" rows="10" autocomplete="off"></textarea>
				<span><!-- 글자 수 --></span>
				<!-- helper text -->
				<span>500자까지만 입력할 수 있어요.</span>
			</div>
			
			<div>
				<button type="button">취소</button>
				<button type="submit">개설하고 참가하기</button>
			</div>
		</div>
	</form>
</body>
</html>