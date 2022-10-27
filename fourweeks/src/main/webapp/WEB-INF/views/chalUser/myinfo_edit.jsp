<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="계정 관리" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
/*  
	10.27 
	디자인 수정해야할 것 : 
	- 프로필 사진 글자 가운데에 맞춰야함 
	- 사진변경 삭제 구현하기 

*/

.row{
 margin-top: 20px;
}
.row-move{
margin: 50px 0 50px 303px;
} 
.row-leave{
	margin-top: 65px;
}
.row-btns{
margin-top: 79px;
}
div{
border: 1px dotted gray;
}

img{
border-radius: 50%;
}
/* input-box들   */
.id-box{
border: 1px solid transparent;
width: 420px;
margin-left: 55px;
}
input[name="userId"]:disabled{
background-color:transparent;
}
.input-box{
border: 2px solid #AAAAAA;
border-radius: 0.5em;
width:420px;
margin-left: 55px;
}

/*  */
.sp-1{
margin-top: 45px;
font-size: 16px;
font-weight: 700;
}
.sp-0{
margin-bottom:45px;
font-size: 16px;
font-weight: 700;
}
.sp-e{
color:#eb6f7f;
padding-left: 105px;
}
.user-img{
margin-left: 55px;
}
.img-input{
display:none;
}

     /* 이미지 보기  */
     	.row-img{
      	margin-left: 63px;
     	}
        .thumbnail{
            display: none;
        }

           /* 업로드 버튼 */
        .input-file-upload{
            padding: 6px 17px; 
            background-color: #e5e6f9;
            border-radius: 0.25em;
            color: #6c7aef;
            cursor: pointer;
        }
        .input-file-blind{
            display: none;
        }
        
        /* 이미지 업로드 버튼들 */
        	.img-lab{
        		margin-left:30px;
        	}
		.img-btn{ /* 삭제 버튼 */
			margin-left:6px;
			border: 2px solid #AAAAAA;
			border-radius: 0.25em;
			background-color: transparent;
			padding: 4px 16px; /* 삭제 버튼 크기 조절 */
			text-align: center;
			color: #AAAAAA;
		}
		.img-btns{
			padding-top: 161px; /* 미리보기와 사진변경/삭제 간의 높이 맞춤 */
		}
        /* 버ㅌㅡㄴ  */
        .btn-leave{
			border: 2px solid #AAAAAA;
			border-radius: 0.5em;
			background-color: transparent;
			padding: 4px 16px; /* 삭제 버튼 크기 조절 */
			text-align: center;
			color: #AAAAAA;
        }

        .change-btn{
     	   border: 2px solid #e5e6f9;
			border-radius: 0.5em;
			background-color: #e5e6f9;
			padding: 4px 16px; /* 삭제 버튼 크기 조절 */
			text-align: center;
			color: #6c7aef;
        }
        .cancel-btn{
        width:150px;
        margin-right:10px;
        }
        .a-btn1{
        margin-left:45px;
        }
</style>
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
	
	 $(function(){
         $("[name=attachment]").change(function(e){
             //input[type=file] 태그에는 files라는 속성이 존재
             console.log(this.files);
             if(this.files.length > 0){
                 //읽는 도구
                 var reader = new FileReader();

                 //읽을 때 해야할 작업
                 reader.onload = function(e){
                     //읽은 내용 정보가 e에 들어 있음
                     var preview = document.getElementById("preview")
                     $(".preview").attr("src", e.target.result);
                 };
                 reader.readAsDataURL(this.files[0]);//읽어라
             }
             // 사진 변경하기 
             var inputImage = document.getElementById("input-image")
             inputImage.addEventListener(function(e){
                 $("[name=attachment]")(e.target)
             });
         });
         $("button[name=thumbnail-delete]").click(function(){
             $(".preview").attr("src", "/images/bg_default.png");
         });
     });
</script>
<div class="row container-1200">
<div class="row container-794 row-move">

	<div class="row ">
		<h1>계정 관리</h1>
	</div>
	
<form action="edit" method="post" enctype="multipart/form-data">
	<div class="row  row-side1">
			<input type="hidden" name="userId" value="${userDto.userId}">
			<span class="sp-0">프로필 사진</span> <img src="/profile/download?userId=${userDto.userId}" width="100" height="100" class="user-img">
	</div>
	
	<div class="row  row-img">
			<!-- <input type="file" name="attachment" accept="jpg, png" class="img-input"> -->
			<!--  선택한 파일 취소하기(js) -->
						 <input id="input-file" type="file" name="attachment" class="img-input">
	</div>
	<div class="row">
                        <label class="input-file-upload img-lab" for="input-file">사진변경</label>        
                        <button class="delete-file-upload img-btn" name="thumbnail-delete">삭제</button>
	</div>
	<div class="row  ">			
	 <span class="sp-1">아이디</span><input class="input short-text-box  id-box" name="userId"  value="${userDto.userId}" disabled>
	</div>
<div class="row  ">
			 <span class="sp-1">닉네임</span><input type="text" name="userNick" class="input short-text-box short-hover input-box" placeholder="4~10자의 한글/영문/숫자" value="${userDto.userNick}"><br>
			<span class="sp-e">이미 사용 중인 닉네임입니다</span><br>
			<span class="sp-e">닉네임을 입력해주세요</span><br>
			<span class="sp-e">4~10자의 한글/영문/숫자만 입력 가능합니다</span>				
</div>
<div class="row  ">			
		 <span class="sp-1">이메일</span><input type="text" name="userEmail" class="input short-text-box short-hover input-box" placeholder="예) id@4weeks.com" value="${userDto.userEmail}"><br>
			<span class="sp-e">이메일을 입력해주세요</span>				
</div>
<div class="row ">
		<span class="sp-1">비밀번호</span><a href="edit/pw" class="change-btn a-btn1">비밀번호 변경</a>
			<!-- 탈퇴 버튼 클릭 시, 확인 팝업 노출(jQuery) -->
</div>

<div class="row  row-leave">
			<a href="/leave" class="btn-leave " >탈퇴하기</a>
</div>
			
<div class="row center  row-btns">
			<a href="/mypage" class="smallbtn cancel-btn"   id="smallbutton3">취소</a>
			<button  class="save-btn" type="submit">저장하기</button>
</div>
		</form>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>