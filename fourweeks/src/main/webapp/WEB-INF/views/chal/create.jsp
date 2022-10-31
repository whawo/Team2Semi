<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="챌린지 개설" name="title"/>
</jsp:include>

<link rel="stylesheet" type="text/css" href="/css/basic.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">

<style>
        /* 
        
        	10.27
        	추가 수정한 것 : 
        	- 마지막 취소 버튼 홈으로 이동 넣음
        	- 헬퍼 텍스트 박스 밑으로 옮김 
        	- 챌린지 예상 종료일 label 크기 높이가 안먹ㅇ므 씨바 
        	
        	10.26
        	디자인 수정해야할 것: 
        	- 6번 챌린지 대표 이미지 삭제 사진변경 안에 글자 위치 맞춰야함 -> 여러번 했었는데 안되면 그냥 border높이를 올리는 걸로 ... 
        	- input박스 안에 달력 넣어야 함.   
        	- 챌린지 예상 종료일 + 28일 해셔  나와야함 ㅇ   
        	- 챌린지 필 수 값 입력 안할시 에러 떠야함 
        	- 챌린지 예상 종료일과 날짜가 맞아야함  ㅇ 
        
        	10.25
        	DB 수정해야할 것: 해결 완료  
        	- form 위치 확인  
        	- submit 버튼은 한개여야 함 
        	- name 확인 
        	
       		10.24
       		DB 수정해야할 것: 
       		-  2번 hover 재설정하기 ㅇ 
       		- lightpick 4번 날짜 뜨기 완료 ㅇ  
       		- moment +day = 날짜 + 28일 찾아보세요.
       		- 사진 삭제 누르면 갑자기 라이트픽 날짜 선택하라고 가버림..??
       
        		10.22
        		디자인 수정해야할 것: 
        		- hover 반응이 없음 or 늦음
        		- 챌린지 2번 border 박스가 input에 넣지 않는 이상 .. 만들어지지 않음.
        		- 헬퍼 텍스트 구현하기 ㅇ 
        		- 체크박스 크기 재조정 ㅇ 
        		- 종료일 나오는 곳 글자 가운데로  ㅇ --> 나중에 디비 나오면 다시 조정하기 
        		
        		
            10.21 
            디자인 수정해야할 것:
            - 각 hover 재설정 하기 
            - radio 버튼 맛감 ㅇ
            - 이미지 이제까지 만든 거 적용 시키기 ㅇ 
            - text제한 수 두기 
            - 경고문 빨간거 뜨기 
            - 챌린지 시작인 인풋 박스에 그림 넣기   

            DB 수정해야할 것: 
            - 미리보기 사진의 경우에는 이미지 지우는 src를 삭제하자. 
            - src를 삭제하자 
            - 39번 //시나리오 부분 참고하세요 
            - 필수값이 입력안되었을때 날라가지 말 것. 



        */
        div{
            border: 1px dotted gray;
            display: block;
        }
        body {margin: 10px; font-size: 13px}

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

        /* 
            라디오 버튼 관련 1번 
            라디오와 라벨 간격 띄우려면 basic.css 가시오 
        */ 
       /*   label{
            margin: 17px 0 10px;
            padding-left: 30px;
        }  */
        .lab-1{
        margin: 17px 0 10px;
        padding-left:30px;
        }
        .lab-2{
         margin: 17px 0 10px;
        padding-left:30px;
        }
       .p0{
           font-size: 30px;
            color: #3f3f3f;
            font-weight: bold;
            /* margin-bottom: 10px; */
            margin-top:60px;
            padding-bottom: 10px;
       }
        .p1{
            font-size: 20px;
            color: #3f3f3f;
            font-weight: bold;
            margin-bottom: 16px;
            padding-top:80px; /* 큰 제목간의 사이 간격 */
        }
         .p1-1{
            font-size: 20px;
            color: #3f3f3f;
            font-weight: bold;
            margin-bottom: 10px;
            padding-top:48px; /* 큰 제목간의 사이 간격 */
        }
        .p2{
            font-size: 12px;
            color: #3f3f3f;
            margin-bottom:50px;
        }
         .p2-1{
            font-size: 12px;
            color: #3f3f3f;
            margin-bottom:10px;
        }
        .p3{
         	font-size: 12px;
            color: #3f3f3f;
            margin-bottom: 30px;   /* [참가인원]과 확인했어요 사이 간격 */
        }
        .rad{
            vertical-align: -11px;
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
        
        /* 챌린지 예상 종료일 수정 삭제 x 굳이 없어도 될듯   */
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
        /* 캘린더  */
       .date-box{
       background-color: #e5e6f9;
        border: 1px solid #e5e6f9;
        border-radius: 0.5em;
         font-size: 14px;
          color: #6c7aef;
          font-weight: 700;
        }
        date-bx{
          width:600px;
        height:58px;
        }
        .date-calendar,
        #result-1{
        	display: inline;
        }
        /* 체크박스 */
        .chk-1{
            margin-bottom: -3px;
        }
        .chk-2{
           color: #6c7aef;
           padding: 0 0 0 5px;
           font-size:14px;
        }
        .chk-line{
            margin: 0 0 0 -12px;
        }
        /* btn */
        .cancel-btn{
            width: 150px;
            margin-right: 20px;
            margin-top: 100px; /* 취소,개설하기 버튼과 위에 7번 사이 간격*/
        }
        .create-btn{
            width: 320px;
        }

        /* 이미지 보기  */
        .thumbnail{
             display: none; 
        }
        img{
            float: left;
        }

           /* 업로드 버튼 */
        .input-file-upload{
            padding: 5px 20px; 
            padding-bottom: 12px;/* 버튼 아래로 위치 조정 */
            background-color: #e5e6f9;
            border: 1px solid #e5e6f9;
            border-radius: 0.25em;
            color: #6c7aef;
            cursor: pointer;
        }
        .input-file-blind{
            display: none;
        }
        .preview{
            border-radius: 0.25em;
        }
        /* 이미지 업로드 버튼들 */
        	.img-lab{
        		margin-left:30px;
        	}
		.img-btn{ /* 삭제 버튼 */
			margin-left:6px;
			border: 2px solid #AAAAAA;
			border-radius: 0.5em;
			background-color: transparent;
			padding: 4px 30px; /* 삭제 버튼 크기 조절  위, 옆 */ 
			padding-bottom: 12px; /* 버튼 아래로 위치 조정 */
			text-align: center;
			color: #AAAAAA;
		}
		.img-btns{
			padding-top: 161px; /* 미리보기와 사진변경/삭제 간의 높이 맞춤 */
		}
        .row-7{ /* 이미지 미리보기와 7번이 겹치기 때문에 조절 */
            padding-top: 80px;
        }
  
  		/* 에러 */
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
  
  
    /* 헬퍼 텍스트 위치  */
    .helper-text-40{
    	padding-left:570px;
    }
     .helper-text-300{
    	padding-left:564px;
    }
     .helper-text-500{
    	padding-left:564px;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.js"></script>
<script type="text/javascript">
     $(function(){
         var picker1 = new Lightpick({
             //field는 datepicker은 적용 대상을 설정하는 공간 
             field:document.querySelector(".single-date-picker"),
             
             minDate:moment(), // 오늘자 선택 가능
             minDate:moment().add(4,'day'), // 오늘 + 5일
			 format:"YYYY-MM-DD",
             firstDay:0, // 시작일 일요일부터 
             singleDate:true, // 날짜 한개만 선택

             // (+옵션) 표시되는 달의 개수를 지정 
             numberOfMonths:1, //1개의 달씩 보여줘라 
        
             // 날짜 출력하기 
             onSelect: function(date){
             	/* document.getElementById("result-1").innerHTML = date.format("YYYY-MM-DD"); */
             	document.getElementById("result-1").innerHTML = date.add(28, 'days').format("YYYY-MM-DD");
             	//console.log(date.add(5, 'days').format('YYYY-MM-DD'));
             }
		});
        // 오늘 날짜 기본값으로 자동 선택
        picker1.setDate(moment());
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
    
    //help-text
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
         $(".helper-text3").on("input", function(){
             var text = $(this).val();
             $(this).next().text(text.length);
             if(text.length > 500){
                 $(this).next();
             }
             else {
                 $(this).next().css("color", "#3f3f3f");
             }
         });
     });

     $(function () {
         $(".create-form").submit(function(){
         	$("input[name=chalTitle]").blur();
         	$("textarea[name=howConfirm]").blur();
         	$("input[name=startDate]").blur();
         	$("input[type=checkbox]").blur();
         	if($(".input.fail".length > 0)) {
                 return false;
             }
         });
         
         $("input[name=chalTitle]").on("blur", function(){
         	var chalTitle = $(this).val();
         	$(this).removeClass("fail");
         	if(!chalTitle) {
         		$(this).addClass("fail").focus();
         	}
         });
         
         $("textarea[name=howConfirm]").on("blur", function(){
          	var howConfirm = $(this).val();
          	$(this).removeClass("fail");
          	if(!howConfirm) {
          		$(this).addClass("fail");
          	}
          });
         
          $("input[name=startDate]").on("blur", function(){
          	var startDate = $(this).val();
          	$(this).removeClass("fail");
          	if(!startDate) {
          		$(this).addClass("fail");
          	}
          }); 
         
         $("input[type=checkbox]").on("blur", function(){
          	var checkbox = $(this).val();
          	$(this).removeClass("fail");
          	if(checkbox:checked) {
          		$(this).addClass("fail");
          	}
          });
     });
</script>
<body>
	<div class="container-1200">
        <form action="create" method="post" enctype="multipart/form-data" class="create-form"  autocomplete="off">
        
	           <div class="row">
	                <p class="p1"> 1. 어떤 주제와 관련이 있나요?</p>
	
	                <div class="row checks small">
	                <input class="lab"  id="ex_rd1" name="chalTopic" type="radio" value="운동" checked><label for="ex_rd1" class="lab-1">운동</label><br>
	                <input class="lab"  id="ex_rd2" name="chalTopic" type="radio" value="생활"><label for="ex_rd2" class="lab-1">생활</label><br>
	                <input class="lab"  id="ex_rd3" name="chalTopic" type="radio" value="정서"><label for="ex_rd3" class="lab-1">정서</label><br>
	                <input class="lab"  id="ex_rd4" name="chalTopic" type="radio" value="취미"><label for="ex_rd4" class="lab-1">취미</label><br>
	                <input class="lab"  id="ex_rd5" name="chalTopic" type="radio" value="학습"><label for="ex_rd5" class="lab-1">학습</label><br>
	                <input class="lab"  id="ex_rd6" name="chalTopic" type="radio" value="환경"><label for="ex_rd6" class="lab-1">환경</label><br>
	                <input class="lab"  id="ex_rd7" name="chalTopic" type="radio" value="그 외"><label for="ex_rd7" class="lab-1">그 외</label><br>
	                </div>
	             
	            </div>
	
	            <div class="row">
	                <p class="p1">2. 챌린지 제목을 입력해주세요.</p>
	                <p class="p2"> 타인에게 불쾌감을 주는 단어를 사용할 경우 계정이 영구정지 될 수 있습니다.</p>
	                <div class="row">
	                <input name="chalTitle"  class="short-text-underlinebox uderline-hover underline-focus  helper-text1" type="text" placeholder="예) 아침 6시에 일어나기 " id="text-underlinebox1" autocomplete="off">
	                <span  class="helper-text-40 helper-css">0</span> /40
	                 <span class="fail-message">필수 항목 입니다. </span>
	                </div>
	            </div>
	
	            <div class="row">
	                <p class="p1">3. 인증 방법을 입력해 주세요.</p>
	                <textarea class="helper-text2 short-hover" name="howConfirm" placeholder="예) 매일 깃 커밋하기0 오늘 날짜와 커밋 내역이 보이도록 깃 허브 히스토리를 캡쳐해서 인증샷으로 첨부하기"maxlength="300" ></textarea><br>
	                <span  class="helper-text-300 helper-css">0</span> /300
	                <span class="fail-message">필수 항목 입니다. </span>
	            </div>
	
	        <div class="row">
	                <p class="p1">4. 챌린지 시작일을 선택해주세요.</p>
	                <p class="p2">개설일로부터 5일 이내에 시작해야 해요.</p>
	
	                <div class="row">
	                    <i class="fa-solid fa-calendar-days"></i>
	                    <input type="text" class="single-date-picker" id="short-text-box"  name="startDate" autocomplete="off">
	                    <span class="fail-message">필수 항목 입니다. </span>
	                </div>
	
	                <div class="row date-calendar">
	                	<label class="date-box date-bx">챌린지 예상 종료일 <span id="result-1"></span></label> 
	                </div>
	
	            </div>
	
	            <!--  라벨이라 체크를 어떻게 해야할지 ..   -->
	            <div class="row">
	                <p class="p1">5. 모집 방식을 확인해주세요.</p>
	                <p class="p2-1">[모집 방식] 선착순 자동 마감</p>
	                <p class="p3">[참가 인원] 최대 10명까지 참가할 수 있어요. 챌린지 시작 전에 10명이 다 모이면 자동으로 모집이 마갑됩니다. </p>
	                <div class="row chk-line">
	                <label class="line lab-2" >
	                    <input type="checkbox" >
	                    <span class="chk-1"></span>
	                    <span class="chk-2">확인했어요!</span>
	                    <span class="fail-message">필수 항목 입니다. </span>
	                </label>    
	            </div>
	            </div>
	
	            <div class="row">
	                <p class="p1">6. 챌린지 대표 이미지를 등록하세요.(선택)</p>
	                <p class="p2">노출 위치에 따라 섬네일이 축소/확대되어 적용합니다. 등록하지 않는 경우, 랜점으로 기본 이미지가 적용됩니다.</p>
	                <div class="row">
	                    <input id="input-file" type="file" name="attachment" class="thumbnail">
	                    <img class="preview" src="/images/bg_default.png" width="250" height="200">
	                    <div class="row img-btns">
	                        <label class="input-file-upload img-lab" for="input-file">사진변경</label>        
	                        <a class="delete-file-upload img-btn" name="thumbnail-delete">삭제</a>
	                    </div>
	                </div>
	            </div>
	
	            <div class="row row-7 row-padding">
	                <p class="p1-1" >7. 챌린지를 소개해주세요.(선택)</p>
	                <p class="p2">다른 사람들이 챌린지 참가를 결정할 때 참고할 수 있어요.</p>
	                <textarea class="helper-text3 short-hover" name="chalContent" placeholder="예)어려워서 하기 싫은 알고리즘 문제풀이 매일매일 같이 인증해요~!" maxlength="500"></textarea><br>
	                <span  class="helper-text-500 helper-css">0</span> /500
	            </div>
	            
	            <div class="row center"> 
	                <a href="/" class="smallbtn cancel-btn" id="smallbutton3">취소</a>
	                <button class="smallbtn create-btn" type="submit" id="smallbutton1" >개설하고 참가하기</button>
	            </div>
		</form>    
	</div>    
</body>     
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
