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
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.js"></script>


    <style>
        /* 
        	10.26
        	디자인 수정해야할 것: 
        	- 6번 챌린지 대표 이미지 삭제 사진변경 안에 글자 위치 맞춰야함 -> 여러번 했었는데 안되면 그냥 border높이를 올리는 걸로 ...
        	- input박스 안에 달력 넣어야 함.  
        	- 챌린지 예상 종료일 + 28일 해셔 나와야함 
        	- 챌린지 필 수 값 입력 안할시 에러 떠야함 
        	- 챌린지 예상 종료일과 날짜가 맞아야함 
        
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
        label{
            margin: 17px 0 10px;
            padding-left: 30px;
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

        .lab{ /* 라디오 버튼 사이 간격 */
          
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
        .sp-1{
            display: block;
            /* padding: 13px 0; */
            height:60px;
            margin-top:16px;
        		padding-left: 105px;  /* 예상 종료일 가운데 맞추는 것.. 훗날 수정 */
            background-color: #e5e6f9;
            border: 1px solid #e5e6f9;
            border-radius: 0.5em;
            font-size: 14px;
            color: #6c7aef;
            font-weight: 700;
            text-decoration: none;
			white-space: nowrap;
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
        .end-date{
        font-size:20px;
        padding: 20px 20px;
        }
        #result-1{
        	padding-left:20px;
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
        .error{
        border: 1px solid red;
        }
    </style>
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     <script type="text/javascript">
    
     $(function(){
         var picker1 = new Lightpick({
             //field는 datepicker은 적용 대상을 설정하는 공간 
             field:document.querySelector(".single-date-picker"),
             
             minDate:moment(), // 오늘자 선택 가능
             minDate:moment().add(4,'day'), // 오늘 + 5일

             firstDay:0, // 시작일 일요일부터 
             singleDate:true, // 날짜 한개만 선택

             // (+옵션) 표시되는 달의 개수를 지정 
             numberOfMonths:1, //2개의 달씩 보여줘라 
        
             // 날짜 출력하기 
             onSelect: function(date){
             document.getElementById("result-1").innerHTML = date.format("YYYY.MM.DD");
             }
         });
        /*  // 오늘 날짜 기본값으로 자동 선택
         picker1.setDate(moment()); */
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
// 모르겠다 required 꾸며서 할란다 
  /*    //  회원가입 폼 제어 + 오류 메세지 
     $(function(){
        $(".create-btn").click(function(){
            var chal2 = document.getElementById("chal-2");
            var chal3 = document.getElementById("chal-3");
            var chal4 = document.getElementById("chal-4");
            var chal4 = document.getElementById("chal-5");
            if(chal2){
                // 얘는 정규식이 있는것도 아니고 성공 실패를 어캐 나놤노이ㅏㅁㄴ 
                $(".chal-2").attr("input", "").focus();
                return false;
            }
            else if(chal3){
                $(".chal-3").attr("input", "");
                return false;
            }
            else if(chal4){
                $(".chal-4").attr("input","");
                return false;
            }
            else if(chal-5){
                $("chal-5").attr("input","");
                return false;
            }else{
                return true;
            }
        });
     });
 */
  

     </script>
     </head>
     <body>
     <!-- 확인용 -->
		${loginId}

        <div class="container-1200">
        <!-- 폼 추가 ! -->
        <form action="create" method="post" enctype="multipart/form-data">
		<div class="row" style="margin: 30px 50px 40px 50px;">
            <div class="row">
                <p class="p0">원하는 챌린지를 직접 개설해보세요.</p>
                <p class="p2">내가 개설한 챌린지에 자동으로 참가하게 됩니다.</p>
            </div>

           <div class="row">
                <p class="p1"> 1. 어떤 주제와 관련이 있나요?</p>

                <div class="row checks small">
                <input class="lab"  id="ex_rd1" name="chalTopic" type="radio" value="운동" checked><label for="ex_rd1">운동</label><br>
                <input class="lab"  id="ex_rd2" name="chalTopic" type="radio" value="생활"><label for="ex_rd2">생활</label><br>
                <input class="lab"  id="ex_rd3" name="chalTopic" type="radio" value="정서"><label for="ex_rd3">정서</label><br>
                <input class="lab"  id="ex_rd4" name="chalTopic" type="radio" value="취미"><label for="ex_rd4">취미</label><br>
                <input class="lab"  id="ex_rd5" name="chalTopic" type="radio" value="학습"><label for="ex_rd5">학습</label><br>
                <input class="lab"  id="ex_rd6" name="chalTopic" type="radio" value="환경"><label for="ex_rd6">환경</label><br>
                <input class="lab"  id="ex_rd7" name="chalTopic" type="radio" value="그 외"><label for="ex_rd7">그 외</label><br>
                </div>
             
            </div>

            <div class="row">
                <p class="p1">2. 챌린지 제목을 입력해주세요.</p>
                <p class="p2"> 타인에게 불쾌감을 주는 단어를 사용할 경우 계정이 영구정지 될 수 있습니다.</p>
                <div class="row">
                <input name="chalTitle"  class="short-text-underlinebox uderline-hover underline-focus  helper-text1 chal-2" type="text" placeholder="예) 아침 6시에 일어나기 " id="text-underlinebox1" required="">
               <!-- <input name="chalTitle"  class="short-text-underlinebox underline-hover helper-text1" type="text" placeholder="예) 아침 6시에 일어나기 " id="text-underlinebox1" style="border:none;   border-bottom: 2px solid #cfc9d5; outline: none; color: #3d3d3d;" maxlength="40"> -->
                <span  class="helper-text-40 helper-css">0</span> /40
                </div>
            </div>

            <div class="row">
                <p class="p1">3. 인증 방법을 입력해 주세요.</p>
                <textarea class="helper-text2 short-hover chal-3" name="howConfirm" placeholder="예) 매일 깃 커밋하기0 오늘 날짜와 커밋 내역이 보이도록 깃 허브 히스토리를 캡쳐해서 인증샷으로 첨부하기"maxlength="300" required=""></textarea>
                <span  class="helper-text-300 helper-css">0</span> /300
            </div>

        <div class="row">
                <p class="p1">4. 챌린지 시작일을 선택해주세요.</p>
                <p class="p2">개설일로부터 5일 이내에 시작해야 해요.</p>

                <div class="row">
                    <i class="fa-solid fa-calendar-days"></i>
                    <input type="text" class="single-date-picker short-text-box chal-4" id="chal-4"  name="startDate"  required="">
                </div>

                <div class="row date-calendar">
                   <!--  <h2 class="blind"> 챌린지 예상 종료일</h2> -->
                    <span class="sp-1 calendar">
                  <!--   <i class="c-end">
                        <span class="blind">캘린더</span>
                    </i> -->
                 	<p class="end-date"> 챌린지 예상 종료일</p> 
                </span>
                 	<p id="result-1"></p>
                </div>

            </div>

            <!--  체크해야 넘어간다  -->
            <div class="row">
                <p class="p1">5. 모집 방식을 확인해주세요.</p>
                <p class="p2-1">[모집 방식] 선착순 자동 마감</p>
                <p class="p3">[참가 인원] 최대 10명까지 참가할 수 있어요. 챌린지 시작 전에 10명이 다 모이면 자동으로 모집이 마갑됩니다. </p>
                <div class="row chk-line">
                <label class="line"  required="" >
                    <input type="checkbox" class="chal-5" >
                    <span class="chk-1"></span>
                    <span class="chk-2" required="">확인했어요!</span>
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
                        <a class="delete-file-upload img-btn"  name="thumbnail-delete">삭제</a>
                    </div>
                </div>
            </div>

            <div class="row row-7 row-padding">
                <p class="p1-1" >7. 챌린지를 소개해주세요.(선택)</p>
                <p class="p2">다른 사람들이 챌린지 참가를 결정할 때 참고할 수 있어요.</p>
                <textarea class="helper-text3 short-hover" name="chalContent" placeholder="예)어려워서 하기 싫은 알고리즘 문제풀이 매일매일 같이 인증해요~!" maxlength="500"></textarea>
                <span  class="helper-text-500 helper-css">0</span> /500
            </div>
            <div class="row center"> <!--센터? 아니면 노센터?-->
                <a  class="smallbtn cancel-btn"  id="smallbutton3">취소</a>
                <button class="smallbtn create-btn" type="submit" id="smallbutton1" >개설하고 참가하기</button>
            </div>
        </div>    
        </form>    
        	</div>
        	<!--  
        	sumit 버튼 한개 
        	form 위치 
        	name 맞늕니 확인 
        	-->
     </body>
     
 <jsp:include page="/WEB-INF/views/template/footer.jsp">
	<jsp:param value="챌린지 개설" name="title"/>
</jsp:include>     