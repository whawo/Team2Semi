<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="챌린지 인증" name="title"/>
</jsp:include>
<html >
<head>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.js"></script>


    <style>
    body{
    font-size:12px;
    }
        div{
            display: block;
        }
        .row-0{
        margin-left: 120px;
        }
        .row-1{
        margin-top: 60px;
        }
        .row-2{
        margin-bottom: 50px;
        }
        .row-3{
       	padding-top: 20px;
        }
        .row-4{
        padding-top: 40px;
        }
        .row-5{
        padding-top: 50px;
        }
        .row-7{
        margin-top: 50px;
        }

        input::placeholder,
        textarea::placeholder{
            font-size: 14px;
            color: #AAAAAA;
        }
       select{
       outline:none;
       }
       select:hover{
       border: 2px solid #6c7aef;
       }
        textarea{
            width: 600px;
            height: 200px;
            padding: 10px;
            box-sizing: border-box;
            border: solid 2px #DDDDDD;
			border-radius: 0.5em;
			font-size: 16px;
			resize: none;
        }

        label{
            margin: 0 10px 10px;
            padding: 0 0 5px;
        }
        .p1{
            font-size: 20px;
            color: #3f3f3f;
            font-weight: bold;
            margin-top: 46px;
             margin-bottom:16px;
        }
        .p2{
            font-size: 12px;
            color: #3f3f3f;
            margin-bottom:30px;
        }

        .short-text-underlinebox{
            width: 600px;
        }
        .calendar{
            width: 600px;
        }

        #short-text-box{
            border: 1px solid #AAAAAA;
            border-radius: 0.25em;
            width: 200px;
            height: 40px;
        }
        .cancel-btn{
            width: 150px;
            margin-right: 20px;
            margin-top: 75px; 
        }
        .create-btn{
            width: 320px;
        }
        .confirm-check{
            width: 600px;
        }
        .blind{
            position:absolute;
            clip: rect(0 0 0 0);
            width: 1px;
            height: 1px;
            margin: -1px;
            overflow: hidden;
        }
        h2{
            font-size: inherit;
            line-height: inherit;
            padding: 0;

            display: block;
            margin-block-start: 0.73em;
            margin-block-end: 0.73em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            font-weight: bold;
        }
        .sp-1{
            display: block;
            padding: 15px 0;
            margin-top: 11px;
            background-color: #e5e6f9;
            border: 1px solid #e5e6f9;
            border-radius: 1em;
            font-size: 14px;
            color: #6c7aef;
            font-weight: 700;
            text-align: center;
            text-decoration: none;
        }
        .sp-2{
        font-size: 12px;
        }
        i{
            font-size:normal;
        }
        .c-end{
            display: inline-block;
            width: 60px;
            height: 12px;
            background-position: -139px -300px;
            background-repeat: no-repeat;
            vertical-align: top;
            margin: 2px 5px 0 0;
        }
    .thumbnail{
            display: none;
        }
        img{
            float: left;
        }
      .input-file-upload{
            padding: 10px 30px; 
            background-color: #e5e6f9;
            border-radius: 0.5em;
            color: #6c7aef;
            cursor: pointer;
            	font-size: 14px;
        }
        .input-file-blind{
            display: none;
        }
        .preview{
            border-radius: 0.5em;
            margin-top: 10px;
        }
        	.img-lab{
        		margin-left:30px;
        	}
		.img-btn{ 
			margin-left:6px;
			border: 2px solid #AAAAAA;
			border-radius: 0.5em;
			background-color: transparent;
			padding: 10px 30px; 
			color: #AAAAAA;
			font-size: 14px;
		}
		.img-btns{
			padding-top: 172px; 
		}

    .confirm-check:focus
    .confirm-check:hover{
        color: #6c7aef;
        font-weight: bold;
    }
    .row-7{
            padding-top: 20px;
        }
        
 		.fail-message {
		display: none;
	}
	.input.fail ~ .fail-message {
		display: block;
		font-size:12px;
	    color: #eb6f7f;
	}
	
	.input ~ .find-error {
		font-size:12px;
	    color: #eb6f7f;
	}

	
    
    </style>
	<script defer src="https://code.jquery.com/jquery-3.6.1.js"></script>
     <script type="text/javascript">
     

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

  // 이미지 
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
            });
            $("button[name=thumbnail-delete]").click(function(){
                $(".preview").attr("src", "/images/bg_default.png");
            });
        });
  
    
    // help-text
     $(function(){
            $(".helper-text1").on("input", function(){
                var text = $(this).val();
                $(this).next().text(text.length);
                if(text.length > 40){
                    $(this).next();
                }
                else {
                    $(this).next().css("color", "#3f3f3f");
                }
            });
        });
     $(function(){
         $(".helper-text2").on("input", function(){
             var text = $(this).val();
             $(this).next().text(text.length);
             if(text.length > 300){
                 $(this).next();
             }
             else {
                 $(this).next().css("color", "#3f3f3f");
             }
         });
     });
     
     $(function(){
    		$(".btn-edit-cancel").click(function(){
				history.back();
	        });
     });
/*  	 // 저장하지 않고 벗어날 경우 alert창 띄움
	window.onbeforeunload = function(e) {
	    var dialogText = "사이트에서 나가시겠습니까? 변경사항이 저장되지 않을 수 있습니다.";
	    e.returnValue = dialogText;
	    return dialogText;
	}; */
     

     </script>
     </head>
     <body>
        <div class="row-0 container-1200">
<c:choose>
	<c:when test="${chalList.size() == 0}">
		참가 중인 챌린지가 없습니다.
		<a href="/chal/list">챌린지 둘러보기</a>
	</c:when>
	<c:otherwise>
<form action="write" method="post" enctype="multipart/form-data" class="con-form">
            <div class="row row-1 mt-92">
            	<input type="hidden" name="userId" value="${loginId}">
                <p class="p1"> 1. 인증할 챌린지를 선택해주세요.</p>
                <select class="dropdown dropdown-check confirm-check"  name="chalTitle">
                    <option id="select" selected="selected" value="" >선택</option>
                    <c:forEach var="list" items="${chalList}">
                        <option value="${list.chalNo}" data-chalTitle="${list.chalTitle}" data-howConfirm="${list.howConfirm}">${list.chalTitle}</option>
                      </c:forEach>
                </select>
                <input type="hidden" name="chalNo">
            </div>
            
          <div class="row row-2">
          ✅ 인증 방법
                    <input class=" sp-1 calendar how-confirm" disabled>
            </div>

            <div class="row row-3">
                <p class="p1">2. 인증글 제목을 입력해주세요.</p>
                <p class="p2"> 타인에게 불쾌감을 주는 단어를 사용할 경우 계정이 영구정지 될 수 있습니다.</p>
                <input name="confirmTitle" class="short-text-underlinebox short-hover  helper-text1" type="text" placeholder="예) 아침 6시에 일어나기 " id="text-underlinebox1"  autocomplete="off" maxlength="40">
                <span  class="helper-text-40 helper-css sp-2">0</span> /40
                  <span class="fail-message">필수 항목 입니다.</span>
            </div>

            <div class="row row-4">
                <p class="p1">3. 실천한 내용을 입력해 주세요.</p>
                <p class="p2"> 실천 여부를 알 수 있도록 구체적으로 적어주세요.</p>
                <textarea  name="confirmContent" class="helper-text2  short-hover" placeholder="예) 매일 깃 커밋하기0 오늘 날짜와 커밋 내역이 보이도록 깃 허브 히스토리를 캡쳐해서 인증샷으로 첨부하기"  autocomplete="off" maxlength="300"></textarea>
                <span  class="helper-text-40 helper-css sp-3">0</span> /300
                  <span class="fail-message">필수 항목 입니다.</span>
            </div>

            <div class="row row-5">
                <p class="p1">4. 챌린지 인증샷을 등록하세요.(선택)</p>
                <p class="p2">jpg, png 파일만 업로드할 수 있어요.</p>
                <div class="row">
                    <input id="input-file" type="file" class="thumbnail"  name="attachment" accept="jpg, png" class="thumbnail">
                    <img class="preview" src="/images/bg_default.png" width="250" height="200">
                    <div class="row img-btns">
                        <label class="input-file-upload img-lab" for="input-file">사진변경</label>        
                        <button class="delete-file-upload img-btn" name="thumbnail-delete" type="button">삭제</button>
                    </div>
                </div>
            </div>

            <div class="row-7 center">
            <a type="button"  class="smallbtn cancel-btn btn-edit-cancel" id="smallbutton3" >취소</a>
                <button class="smallbtn create-btn" type="submit" id="smallbutton1">인증글 저장하기</button>
            </div>
 		</form>
		</c:otherwise>
	</c:choose>
</div>
</body>

</html>

