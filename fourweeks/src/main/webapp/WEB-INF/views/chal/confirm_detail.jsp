<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="챌린지 인증글" name="title"/>
</jsp:include> 


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons1.css">
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>


<style>
div, 
td {
   border : 1px dotted  transparent;
}
.container-margin {
   margin-top : 80px;      
}
.div-align {
   display: inline-block;
}
.confirm-img {
   position: relative;
   width : 400px;
   border-radius: 10px;
}
.confirm-content {
   font-size: 22px;
   line-height: 1.5em;
   margin : 0;
}
.confirm-border {
   border-bottom: 1px solid #E7E7E7;
   padding : 10px 0;
}
      /* 버튼 */
.navbtn{
   border: none;
   font-size: 18px;
   padding: 0.75em;/*글자 크기의 0.75배*/
   cursor: pointer;
   text-decoration: none;
   border-radius: 0.5em;
   font-weight: bold;
   /* 글자 가운데 정렬 */
   display: flex;
   align-items:center; 
   justify-content: center;
   margin: 0 auto auto;
}
.navbutton1{
   background-color: #6c7aef;
   color: white;
}
#reply-button {
   width : 50px;
}
/* 댓글 입력창 */
.search-box{
   border:2px solid #6c7aef;
   border-radius: 0.5em;
   width: 640px;
   height: 50px;
   font-size: 16px;
   padding: 4px;
}
       /* focus시 테두리 색변경 방지 */
input:focus { 
   outline: none; 
}
.div-align {
   display: inline-block;
}
.confirm-content-css {
   border-bottom: 1px solid #E7E7E7;
   line-height: 1.7em;
   margin: 15px 0;
   vertical-align: middle;
}
.icon-size {
    border-bottom : 1px solid #E7E7E7;
}
.user-img {
   width:50px;
   height:50px;
}
.reply-user-img {
    transform: translate(15%, 35%);
}
td {
   font-size : 14px;
}
.pre1{
   word-wrap: break-word;
}
.edit-btn{
   border: 2px solid #6c7aef;
   border-radius: 0.7em;
   background-color:#6c7aef;
   color: #fff;
}
.delete-btn{
   border: 2px solid #6c7aef;
   border-radius: 0.7em;
   background-color:#6c7aef;
   color: #fff;
}
.title-p{
   margin-top: 20px;
   font-size: 24px;
   font-weight:700;
}
.content-p{
   font-size: 16px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
<<<<<<< HEAD
   $(function(){
      //프로필 이미지가 없으면 기본 아이콘으로 대체
      $(".user-img").on("error", function(){
         $(this).replaceWith("<i class='fa-solid fa-circle-user'></i>");
      });
   });
   
   $(function(){
      //댓글 수정 화면 노출여부 설정
      //1. 댓글 수정 버튼 클릭 시, 댓글 내용 숨기고 수정 화면 노출
      $(".btn-reply-edit").click(function(){
         $(this).parents(".view").hide();
         $(this).parents(".view").next(".editor").show();
      });
      //2. 수정 취소 버튼 클릭 시, 수정 화면 숨기고 다시 댓글 내용 노출
      $(".btn-cancel").click(function(){
         $(this).parents(".editor").hide();
         $(this).parents(".editor").prev(".view").show();
      });
      //3. 처음에는 댓글 내용만 노출
      $(".editor").hide();
   });
=======
	$(function(){
		//프로필 이미지가 없으면 기본 아이콘으로 대체
		$(".user-img").on("error", function(){
			$(this).attr("src", "${pageContext.request.contextPath}/images/avatar.png");
		});
	});
	
	$(function(){
		//댓글 수정 화면 노출여부 설정
		//1. 댓글 수정 버튼 클릭 시, 댓글 내용 숨기고 수정 화면 노출
		$(".btn-reply-edit").click(function(){
			$(this).parents(".view").hide();
			$(this).parents(".view").next(".editor").show();
		});
		//2. 수정 취소 버튼 클릭 시, 수정 화면 숨기고 다시 댓글 내용 노출
		$(".btn-cancel").click(function(){
			$(this).parents(".editor").hide();
			$(this).parents(".editor").prev(".view").show();
		});
		//3. 처음에는 댓글 내용만 노출
		$(".editor").hide();
	});
>>>>>>> refs/heads/jeeweon
</script>
<div class="container-794 container-margin">
   <div class="row">
   
   <%--인증 제목 --%>
      <p class="title-p">${confirmVO.confirmTitle}</p>

   <!--프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요-->
   <div>
         <div class="div-align" >
            <img src = "${pageContext.request.contextPath}/user/profile/download?userId=${confirmVO.userId}" class="user-img">
         </div>
         <div class="div-align">
            <ul style="list-style:none; font-size:15px;">
              <li> ${confirmVO.userNick}</li>
              <li> ${confirmVO.confirmDate}</li>
         </ul>
      </div>
     </div>
     
   <!-- 인증샷 : 있을 때만 노출-->
       <div class="confirm-img-box">
          <c:if test="${attachDto != null}">
         <img src = "detail/download?confirmNo=${confirmVO.confirmNo}" class="confirm-img">             
      </c:if>
       </div>
       
       <div class="confirm-content">
         <p class="content-p">${confirmVO.confirmContent}</p>
             
       </div>
             
          <div class="confirm-border" style="font-size:20px;">
             <i class="fa-regular fa-eye"></i> ${confirmVO.confirmRead} &nbsp; &nbsp;
             <!-- 좋아요 -->
         <c:if test="${isLike == null}">
            <a class="heart"><i class="fa-regular fa-heart"></i></a>  
         </c:if>
         <c:if test="${isLike == true}">
            <a href="like?confirmNo=${confirmVO.confirmNo}"><i class="fa-solid fa-heart"></i></a> 
         </c:if>
         <c:if test="${isLike == false}">
            <a href="like?confirmNo=${confirmVO.confirmNo}"><i class="fa-regular fa-heart"></i></a>  
         </c:if>
            ${confirmVO.confirmLike} &nbsp; &nbsp;
            <i class="fa-regular fa-comment"></i> ${replyList.size()}
       </div>
       
        <div class="row ">
           <c:if test="${loginId == confirmVO.userId}"> 
                   <button onclick="location.href='edit?confirmNo=${confirmVO.confirmNo}';"class="navbtn navbutton1" type="submit">수정하기</button>
           </c:if>
        </div>
        
   <!-- 기본 이벤트 차단 -->
   <!-- 로그인한 유저의 프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요   -->
   
   <!-- 댓글 CRUD 비동기 처리 예정 -->
   <!-- 댓글 입력 -->
      <div class="div-align" >
          <img src = "${pageContext.request.contextPath}/images/avatar.png" width="50" height="50" class="user-img  reply-user-img">
       </div>
       
       <form action="reply/write" method="post" class="reply-insert-form">
       <div class="div-align">
            <input type="hidden" name="confirmNo" value="${confirmVO.confirmNo}">
            <input class="search-box"  type="text" name="replyContent" placeholder="댓글을 남겨보세요." required>
       </div>
       
       <div class="div-align">
           <button class="navbtn navbutton1" type="submit"  style="height:50px; width:70px;">댓글</button>
         </div>
      </form>   
   
   
   <!-- 등록된 댓글 리스트 (jQuery에서 비동기로 목록 업데이트)-->
   <h2>댓글 <span style="color:#6c7aef">${replyList.size()}</span></h2>
               
   <table class="table-reply-list" style="width:100%">
      <tbody>
         <c:forEach var="replyDto" items="${replyList}">
            <tr class="view">
               <td>
                  <!-- 댓글 작성 유저의 프로필 이미지 다운로드해서 화면에 출력 : 경로 변경 필요-->
                  <img src = "${pageContext.request.contextPath}/user/profile/download?userId=${replyDto.userId}" width="50" height="50" class="user-img reply-user-img">
                  ${replyDto.userNick}
                  <c:if test="${replyDto.userId == confirmVO.userId}">
                     &nbsp; [작성자]
                  </c:if>
                  <br><br>
            
                  <!-- 블라인드 여부에 따라 댓글 내용 다르게 표시 -->
                  <!-- 수정 버튼 클릭 시 미노출(jQuery) -->
                  <c:choose>
                     <c:when test="${replyDto.replyBlind}">
                        <pre style="text-indent : 1em;">블라인드 처리된 게시물입니다</pre>
                     </c:when>
                     <c:otherwise>
                        <p class="pre1" style="text-indent : 1em;">${replyDto.replyContent}</p>
                     </c:otherwise>
                  </c:choose>
                  <br>
                  
                  <fmt:formatDate value="${replyDto.replyDate}" pattern="yyyy-MM-dd HH:mm"/>
                  
                  <!-- 수정/삭제 버튼: 댓글 작성자 본인에게만 노출 -->
                  <c:if test="${replyDto.userId == loginId}"> 
                     <div class="div-align" style="float:right;">
                     <button type="button" class="btn-reply-edit edit-btn">수정</button>  &nbsp;
                     <button type="button"onclick="location.href='reply/delete?replyNo=${replyDto.replyNo}&confirmNo=${replyDto.confirmNo}';" class="btn-reply-delete delete-btn" data-confirm-no="${replyDto.confirmNo}" data-reply-no="${replyDto.replyNo}">삭제</button>
                     </div>
                  </c:if>
               </td>
            </tr>
            
            <c:if test="${replyDto.userId == loginId}">
            <!-- 수정 화면 : 댓글 작성자 본인에게만 출력 / 수정 버튼 클릭 시에만 노출(jQuery) -->
            <tr class="editor">
               <td>
                  <form action="reply/edit" method="post">
                     <input type="hidden" name="replyNo" value="${replyDto.replyNo}">
                     <input type="hidden" name="confirmNo" value="${replyDto.confirmNo}">
                     <textarea name="replyContent" rows="5" cols="50" required>${replyDto.replyContent}</textarea>
                     <button type="submit">저장</button>
                     <a class="btn-cancel">취소</a>
                  </form>
               </td>
            </tr>
            </c:if>
         </c:forEach>
      </tbody>
      </table>
   </div> <!-- row 끝 -->
</div> <!-- 컨테이너 끝 -->

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>