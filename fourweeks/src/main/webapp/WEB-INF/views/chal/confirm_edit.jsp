<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="인증글 수정" name="title"/>
</jsp:include> 

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.js"></script>
    
<style>
 div{
          border: 1px dotted transparent; 
          display: block;
        }
        
        /* row 모음 */
        
        input::placeholder,
        textarea::placeholder{
            font-size: 14px;
            color: #AAAAAA;
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
           /* margin-top: 46px;*/
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
        .calendar{ /* 챌린지 예상 종료일 */
            width: 600px;
        }
        #short-text-box{
            border: 1px solid #AAAAAA;
            border-radius: 0.25em;
            width: 200px;
            height: 40px;
        }
        /* 챌린지 예상 종료일 수정 삭제 x  */
       
        /* btn */
        .cancel-btn{
            width: 150px;
            margin-right: 20px;
            margin-top: 75px; /* 취소,개설하기 버튼과 위에 7번 사이 간격*/
        }
        .create-btn{
            width: 320px;
        }
        .confirm-check{
            /* 셀렉창  */
            width: 600px;
        }
        /* 인증 방법  */
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
    /*    이미지 업로드 및 미리보기 및 삭제 */ 
    .thumbnail{
            display: none;
        }
        img{
            float: left;
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
        .preview{
            border-radius: 0.5em;
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
    .confirm-check:focus
    .confirm-check:hover{
        color: #6c7aef;
        font-weight: bold;
    }
       .row-7{ /* 이미지 미리보기와 7번이 겹치기 때문에 조절 */
            padding-top: 20px;
        }
        
      /* 에러 모음 */
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
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function() {
			//선택된 챌린지 번호를 input type=hidden에 추가
			var chalNo = parseInt($(this).find("option:selected").attr("value"));
			$("input[name=chalNo]").val(chalNo);
			
			//선택된 챌린지 인증방법을 .how-confirm에 추가
			var howConfirm = $("select[name=chalTitle]").find("option:selected").attr("data-howConfirm");
			$(".how-confirm").val(howConfirm);
			
			//인증샷이 없으면 기본 이미지 노출
			$(".preview").on("error", function(){
				 $(".preview").attr("src", "${pageContext.request.contextPath}/images/bg_default.png");
			});
			
			//form submit 시 select disabled 속성 제거
			$(".confirm-form").submit(function(){
				$(this).removeAttr('disabled');
            });

			//취소버튼 클릭 시, 이전 페이지로 이동
			$(".btn-edit-cancel").click(function(){
				history.back();
	        });
			
			//사진 삭제 버튼 클릭 시, 테이블 데이터/실제 파일 삭제
			$(".btn-delete-file").click(function(){
				$(".preview").attr("src", "${pageContext.request.contextPath}/images/bg_default.png");
				$.ajax({
			        //인증샷 삭제 메소드 호출
			        url : "${pageContext.request.contextPath}/rest/chal/confirm_img/delete?confirmNo=${param.confirmNo}",
			        method : "get",
			        dataType : "json",
			        async : false,
			        success : function(resp) {
			        	$(".preview").attr("src", "${pageContext.request.contextPath}/images/bg_default.png");
			        }
			    });
			});
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
                // 사진 변경하기 
                var inputImage = document.getElementById("input-image")
                inputImage.addEventListener(function(e){
                    $("[name=attachment]")(e.target)
                });
            });
            /* $("button[name=thumbnail-delete]").click(function(){
                $(".preview").attr("src", "${pageContext.request.contextPath}/images/bg_default.png");
            }); */
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

</script>    

	<form action="edit" method="post" enctype="multipart/form-data" class="confirm-form">
	<input type="hidden" name="confirmNo" value="${confirmVO.confirmNo}">
	<input type="hidden" name="userId" value="${confirmVO.userId}">
	
	<div class="container-1200">
	  <div class="row row-1">
                <p class="p1"> 1.수정할 챌린지를 선택해주세요.</p>
		<br>
		<!-- 기존 챌린지 자동 선택, 수정 불가 (form submit 시 disabled 속성 제거) -->
		<select  class="dropdown dropdown-check confirm-check"  name="chalTitle" disabled>
			<option  id="select" selected="selected" value="">선택하기</option>
			<c:forEach var="list" items="${chalList}">
				<option value="${list.chalNo}" data-chalTitle="${list.chalTitle}" data-howConfirm="${list.howConfirm}" <c:if test="${confirmVO.chalNo == list.chalNo}">selected</c:if>>${list.chalTitle}</option>
		  	</c:forEach>
		</select>
		<input type="hidden" name="chalNo">
		</div>
		 <div class="row row-2">
			✅ 인증 방법
			<br><br>
			<textarea class="how-confirm" rows="5" readonly></textarea>
  		</div>
  		
  		<div class="row row-3">
			<p class="p1">2. 인증글 제목을 입력해주세요.</p>
			<p class="p2">타인에게 불쾌감을 주는 단어를 사용할 경우 계정이 영구정지 될 수 있습니다.</p>
			<br>
			<input name="confirmTitle" class="short-text-underlinebox uderline-hover  helper-text1" type="text" value = "${confirmVO.confirmTitle}" placeholder="예) 아침 6시에 일어나기 " id="text-underlinebox1"  autocomplete="off" maxlength="40">
			<span  class="helper-text-40 helper-css sp-2">0</span> /40
			<span class="fail-message">필수 항목 입니다.</span>
			<br><br>
		</div>
		
	  <div class="row row-4">
         <p class="p1">3. 실천한 내용을 입력해 주세요.</p>
		 <p class="p2"> 실천 여부를 알 수 있도록 구체적으로 적어주세요.</p>
		<br>
		<textarea name="confirmContent" placeholder="예) 매일 깃 커밋하기 - 오늘 날짜와 커밋 내역이 보이도록 깃 허브 히스토리를 캡쳐해서 인증샷으로 첨부하기" rows="10" required required autocomplete="off"  class="helper-text2  short-hover">${confirmVO.confirmContent}</textarea>
		<span  class="helper-text-40 helper-css sp-3">0</span> /300
		<span>내용을 입력해주세요.</span>
		<span class="fail-message">필수 항목 입니다.</span>
	  </div>
		
		<div class="row row-5">
		  <p class="p1">4. 챌린지 인증샷을 등록하세요.(선택)</p>
          <p class="p2">jpg, png 파일만 업로드할 수 있어요.</p>
			<div class="row">
				<input id="input-file" type="file" class="thumbnail"  name="attachment" accept="jpg, png" class="thumbnail">
				<img class="preview" src="detail/download?confirmNo=${confirmVO.confirmNo}" width="250" height="200">
				</div>
			<div class="row img-btns">
				<label class="input-file-upload img-lab" for="input-file">사진변경</label>     
				<button type="button" class="delete-file-upload img-btn btn-delete-file" name="thumbnail-delete" >삭제</button>
			</div>
	</div>

		<div class="row-7 center">
			<a type="button"  class="smallbtn cancel-btn btn-edit-cancel" id="smallbutton3">취소</a>
			<button  class="smallbtn create-btn" type="submit"  id="smallbutton1">인증글 저장하기</button>
		</div>
</div>	
	</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>