<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="계정 관리" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.row{
 margin-top: 20px;
}
.row-1{
margin-top: 100px;
}
.row-2{
margin-top: 40px;
margin-left: 300px;
}
.row-3{
margin-top: 50px;
}
.row-4{
margin-top: 30px;
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
border: 1px dotted transparent;
}
.img1{
border-radius: 50%;
margin-top: 50px;
margin-left: 85px;
margin-bottom: -30px;
}
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
.sp-1{
margin-top: 45px;
font-size: 16px;
font-weight: 700;
color: #3f3f3f;
}
.sp-0{
position: relative;
font-size: 16px;
font-weight: 700;
color: #3f3f3f;
}
.sp-e{
color:#eb6f7f;
padding-left: 105px;
}
.p1{
font-size: 24px;
font-weight: 700;
color: #3f3f3f;
}

.user-img{
margin-left: 55px;
}
.img-input{
display:none;
}

     	.preview{
      	margin-left: 63px;
      	position: absolute;
      	top: 200px;
     	}
        .thumbnail{
            display: none;
        }

        .input-file-upload{
            padding: 6px 17px; 
            background-color: #e5e6f9;
            border-radius: 0.5em;
            color: #6c7aef;
            cursor: pointer;
        }
        .input-file-blind{
            display: none;
        }
        
        	.img-lab{
        		margin-left:30px;
        		padding: 10px 30px;
        		font-size: 14px;
        	}
		.img-btn{ 
			margin-left:6px;
			border: 2px solid #AAAAAA;
			border-radius: 0.5em;
			background-color: transparent;
			padding: 9px 30px; 
			text-align: center;
			color: #AAAAAA;
			font-size: 14px;
		}
		.img-btns{
			padding-top: 161px;
		}
        .btn-leave{
			border: 2px solid #AAAAAA;
			border-radius: 0.5em;
			background-color: transparent;
			padding: 4px 16px;
			text-align: center;
			color: #AAAAAA;
        }

        .change-btn{
     	   border: 2px solid #e5e6f9;
			border-radius: 0.5em;
			background-color: #e5e6f9;
			padding: 4px 16px; 
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
        
      .fail-message,
    .NNNNN-message{
        display: none;
    }
    .fail-message,
    .NNNNN-message{
        color: #eb6f7f;
    }
    .input.success {
        border-color: #6c7aef;
    }
    .input.success ~ .success-message{
        display: block;
    }
    .input.fail ~ .fail-message{
        display: block;
    }
        
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
		//프로필 이미지가 없으면 기본 아이콘으로 대체
		$(".user-img").on("error", function(){
			$(this).replaceWith("<i class='fa-solid fa-circle-user fa-10x'></i>");
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
             /* var inputImage = document.getElementById("input-image")
             inputImage.addEventListener(function(e){
                 $("[name=attachment]")(e.target)
             }); */
         });
         /* $("button[name=thumbnail-delete]").click(function(){
             $(".preview").attr("src", "<i class='fa-solid fa-circle-user fa-10x'></i>");
         }); */
         
         //사진 삭제 버튼 클릭 시, 테이블 데이터/실제 파일 삭제
		$(".btn-delete-file").click(function(){
			$(".preview").attr("src", "${pageContext.request.contextPath}/images/avatar.png");
			$.ajax({
		        //인증샷 삭제 메소드 호출
		        url : "${pageContext.request.contextPath}/rest/chal/user_img/delete?${loginId}",
		        method : "get",
		        dataType : "json",
		        async : false,
		        success : function(resp) {
		        	$(".preview").attr("src", "${pageContext.request.contextPath}/images/avatar.png");
		        }
		    });
		});
     });
	 
	 function checkNick(){
         var input = document.querySelector("input[name=userNick]");
         var userNick = input.value;
         var regex = /^[가-힣a-z0-9]{4,10}$/;
         var judge = regex.test(userNick);
         console.log("rege" + judge);
         input.classList.remove("success", "error");
         if(judge){
             input.classList.add("success");
             return true;
         }else{
             input.classList.add("error");
             return false;
         }
     }
	 
	   function checkEmail(){
           var input = document.querySelector("input[name=userEmail]");
           var userEmail = input.value;
           var regex =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
           var judge = regex.test(userEmail);

           input.classList.remove("success", "fail");
           if(judge){
               input.classList.add("success");
           }else{
               input.classList.add("fail");
           }
       }
	 
</script>
<div class=" container-1200">
<div class="row container-794 row-move">

	<div class="row  row-3">
		<p class="p1">계정 관리</p>
	</div>
	
<form action="edit" method="post" enctype="multipart/form-data">
	<div class="row  row-1">
			<input type="hidden" name="userId" value="${userDto.userId}">

			<span class="sp-0">프로필 사진</span> <img class="img1 preview" src="${pageContext.request.contextPath}/user/profile/download?userId=${userDto.userId}" width="100" height="100">
	</div>
	
	<div class="row  row-img">
			<!-- <input type="file" name="attachment" accept="jpg, png" class="img-input"> -->
			<!--  선택한 파일 취소하기(js) -->
		<input id="input-file" type="file" name="attachment" class="img-input">
	</div>
	<div class="row row-2">
                        <label class="input-file-upload img-lab" for="input-file">사진변경</label>        
                        <button type="button" class="delete-file-upload img-btn btn-delete-file" name="thumbnail-delete">삭제</button>
	</div>
	<div class="row  ">			
	 <span class="sp-1">아이디</span><input class="input short-text-box  id-box" name="userId"  value="${userDto.userId}" disabled>
	</div>
<div class="row  ">
			 <span class="sp-1">닉네임</span><input type="text" name="userNick" class="input short-text-box short-hover input-box nick-input" placeholder="4~10자의 한글/영문/숫자" value="${userDto.userNick}" onblur="checkNick();"><br>
			<span class="fail-message">이미 사용 중인 닉네임입니다</span><br>
			<span class="fail-message">닉네임을 입력해주세요</span><br>
			<span class="fail-message">4~10자의 한글/영문/숫자만 입력 가능합니다</span>				
</div>
<div class="row  ">			
		 <span class="sp-1">이메일</span><input type="text" name="userEmail" class="input short-text-box short-hover input-box" placeholder="예) id@4weeks.com" value="${userDto.userEmail}" onblur="checkEmail"><br>
			<span class="fail-message">이메일을 입력해주세요</span>				
</div>
<div class="row row-4">
		<span class="sp-1">비밀번호</span><a href="edit/pw" class="change-btn a-btn1">비밀번호 변경</a>
			<!-- 탈퇴 버튼 클릭 시, 확인 팝업 노출(jQuery) -->
</div>

<div class="row  row-leave">
			<a href="${pageContext.request.contextPath}/user/leave" class="btn-leave " >탈퇴하기</a>
</div>
			
<div class="row center  row-btns">
			<a href="${pageContext.request.contextPath}/user/mypage" class="smallbtn cancel-btn"   id="smallbutton3">취소</a>
			<button  class="save-btn" type="submit">저장하기</button>
</div>
		</form>
</div>
</div>