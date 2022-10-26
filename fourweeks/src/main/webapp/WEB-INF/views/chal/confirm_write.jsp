<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="챌린지 인증" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/css/basic.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.js"></script>


    <style>
        /*
        	10.25 
        	디자인 수정: 
        	- focus 선택자가 브라우저 보다 후에 선택되어서 적용 안됨 해결 하세요. ㅇ 
        	- 필수값을 입력 안했을 때 error메세지 추가하시길.... 
        	- 나머지 hover랑 글꼴 글색상만 체크하세욧   
        	 
            디자인 수정해야 할 것 
            - 글자들은 그냥 허옇게 하는지.. -> 뭔소리냐면 선택시에는 글자 색 다 지정되는데 커서를 다른곳을 클릭하면 글씨 색상이 다시 바뀜 
            - 챌린지 인증샷 삭제버튼 글자 가운데 정렬 
            - 사진 삭제가 안됨 ㅋㅋㅎㅎ 
        */
        div{
          /*   border: 1px dotted gray; */
            display: block;
        }

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

    /* 옵션 선택시 글꼴 색상과 굵기 지정 
        여기서 드는 의문점.. 
        글자들은 그냥 허옇게 하는지.. -> 뭔소리냐면 
        선택시에는 글자 색 다 지정되는데 커서를 다른곳을 클릭하면 글씨 색상이 다시 바뀜 
    */
    .confirm-check:focus
    .confirm-check:hover{
        color: #6c7aef;
        font-weight: bold;
    }
       .row-7{ /* 이미지 미리보기와 7번이 겹치기 때문에 조절 */
            padding-top: 20px;
        }
    
    </style>
     <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
     </head>
     <body>
        <div class="container-1200">
<form action="write" method="post" enctype="multipart/form-data">
            <div class="row">
                <p class="p1"> 1. 인증할 챌린지를 선택해주세요.</p>
                <select class="dropdown dropdown-check confirm-check"  name="chalTitle">
                    <option id="select" selected="selected" value="1"  value="" >전체</option>
                    <c:forEach var="list" items="${chalList}">
                        <option value="${list.chalNo}" data-chalTitle="${list.chalTitle}" data-howConfirm="${list.howConfirm}">${list.chalTitle}</option>
                      </c:forEach>
                </select>
                <input type="hidden" name="chalNo">
            </div>
            
            <div class="row">
              <!--   <span class="sp-1 calendar how-confirm"  >
                    <i class="c-end">
                        <span class="blind">캘린더</span>
                    </i> -->
                    <input class=" sp-1 calendar how-confirm" disabled>
                    <!-- 자동으로 맞춰서 늘어나세요 ~  -->
                  <!--   ✅ 인증 방법
                    선택된 챌린지의 인증방법을 자동으로 불러오는 영역이고 인증 방법은 최대 300자까지 설정할수 있으므로 여역만큼 칸이 늘어남  -->
                    <!-- textarea rows="5" readonly></textarea> -->
               <!--  </span> -->
            </div>

            <div class="row">
                <p class="p1">2. 인증글 제목을 입력해주세요.</p>
                <p class="p2"> 타인에게 불쾌감을 주는 단어를 사용할 경우 계정이 영구정지 될 수 있습니다.</p>
                <input name="confirmTitle" class="short-text-underlinebox uderline-hover  helper-text1" type="text" placeholder="예) 아침 6시에 일어나기 " id="text-underlinebox1" required autocomplete="off">
                <span  class="helper-text-40 helper-css">0</span> /40
            </div>

            <div class="row">
                <p class="p1">3. 실천한 내용을 입력해 주세요.</p>
                <p class="p2"> 실천 여부를 알 수 있도록 구체적으로 적어주세요.</p>
                <textarea  name="confirmContent" class="helper-text2  short-hover" placeholder="예) 매일 깃 커밋하기0 오늘 날짜와 커밋 내역이 보이도록 깃 허브 히스토리를 캡쳐해서 인증샷으로 첨부하기" required autocomplete="off"></textarea>
                <span  class="helper-text-40 helper-css">0</span> /300
            </div>

            <div class="row">
                <p class="p1">4. 챌린지 인증샷을 등록하세요.(선택)</p>
                <p class="p2">jpg, png 파일만 업로드할 수 있어요.</p>
                <div class="row">
                    <input id="input-file" type="file" class="thumbnail"  name="attachment" accept="jpg, png" class="thumbnail">
                    <img class="preview" src="/images/bg_default.png" width="250" height="200">
                    <div class="row img-btns">
                        <label class="input-file-upload img-lab" for="input-file">사진변경</label>        
                        <button class="delete-file-upload img-btn" name="thumbnail-delete">삭제</button>
                    </div>
                </div>
            </div>

            <div class="row-7 center">
                <button class="smallbtn cancel-btn" type="button" id="smallbutton3">취소</button>
                <button class="smallbtn create-btn" type="submit" id="smallbutton1">인증글 저장하기</button>
            </div>
            </form>
        </div>
     </body>