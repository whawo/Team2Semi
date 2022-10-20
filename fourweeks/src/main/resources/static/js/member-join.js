$(function(){
	//멀티페이징 처리
    $(".page").hide();
    $(".page").first().show();

    var step = 100 / $(".page").length;
    var percent = step;
    $(".progressbar > .inner").css("width", percent+"%");

    $(".btn-next").click(function(){
        var target = $(this).parents(".page").next();

        //모든 페이지 숨기고 target만 표시
        $(".page").hide();
        target.show();

        //% 증가
        percent += step;
        $(".progressbar > .inner").css("width", percent+"%");
    });
    $(".btn-prev").click(function(){
        var target = $(this).parents(".page").prev();
        $(".page").hide();
        target.show();

        //% 감소
        percent -= step;
        $(".progressbar > .inner").css("width", percent+"%");
    });
    
    //입력형식 검사
    $("input[name=memberId]").blur(function(){
	    var text = $(this).val();
	    var regex = /^[a-z][a-z0-9]{7,19}$/;
	    var judge = regex.test(text);
	
	    $(this).removeClass("success fail");
	    if(judge){
	        $(this).addClass("success");
	    }
	    else {
	        $(this).addClass("fail");
	    }
	});
	
	$("input[name=memberPw]").blur(function(){
	    var text = $(this).val();
	    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;
	    var judge = regex.test(text);
	
	    $(this).removeClass("success fail");
	    if(judge){
	        $(this).addClass("success");
	    }
	    else {
	        $(this).addClass("fail");
	    }
	});
	
	$("#password-check").blur(function(){
	    var origin = $("input[name=memberPw]").val();
	    var repeat = $(this).val();
	    var judge = origin == repeat;
	
	    $(this).removeClass("success fail");
	    if(judge){
	        $(this).addClass("success");
	    }
	    else {
	        $(this).addClass("fail");
	    }
	});
	
	$("input[name=memberNick]").blur(function(){
		var text = $(this).val();
	    var regex = /^[가-힣0-9]{2,10}$/;
	    var judge = regex.test(text);
	
	    $(this).removeClass("success fail");
	    if(judge){
	        $(this).addClass("success");
	    }
	    else {
	        $(this).addClass("fail");
	    }
	});
	
	$("input[name=memberBirth]").blur(function(){
		var text = $(this).val();
		var regex = /^(19|20)[0-9]{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/;
		var judge = regex.test(text);
		$(this).removeClass("success fail");
		if(judge) {
			$(this).addClass("success");
		}
		else {
			$(this).addClass("fail");
		}
	});
	
	//form check
	$(".join-form").submit(function(){
		var inputTags = $(this).find(".input");
		inputTags.blur();
		
		if($("input[name=memberId]").hasClass("fail")) {
			$(".page").hide();
			$("input[name=memberId]").parents(".page").show();
			return false;
		}
		
		if($("input[name=memberPw]").hasClass("fail")) {
			$(".page").hide();
			$("input[name=memberPw]").parents(".page").show();
			return false;
		}
		
		if($("#password-check").hasClass("fail")) {
			$(".page").hide();
			$("#password-check").parents(".page").show();
			return false;
		}
		
		if($("input[name=memberNick]").hasClass("fail")) {
			$(".page").hide();
			$("input[name=memberNick]").parents(".page").show();
			return false;
		}
		
		if($("input[name=memberBirth]").hasClass("fail")) {
			$(".page").hide();
			$("input[name=memberBirth]").parents(".page").show();
			return false;
		}
		
		return true;
	});
});





