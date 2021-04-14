<%@page import="com.jjj.DTO.Contents"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Contents contents = (Contents)request.getAttribute("contents");    
%>
<!DOCTYPE html>
<html>
<head>
<meta name = "viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI 커뮤니티</title>
<link rel="stylesheet" href="../css/cssReset.css" />
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/me.css"/>
<script type="text/javascript" src="/.js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="./js/me.js"></script>

<style>
#myWallPhoto{background:url('../images/me/back.PNG');background-size:cover;
background-repeat:no-repeat;background-position:50% 50%;border-bottom:1px solid #ccc}
</style>
</head>
<body>
<div id="viwType" align="center">
   <a href="/myservice/me.jsp" id="meLink">ME</a>
   <a href="/myservice/all.jsp" id="allLink">ALL</a>
   <a href="/myservice/all.jsp" id="mbtiLink">MBTI</a>
</div>
<header>
   <div id="myService"> MBTI 커뮤니티</div>
   <!-- 로그인 후 -->
   <div id="myName">
      <p>안녕하세요 전채경님</p>
      <div id="logoutBox">
         <input type="button" id="logoutBtn" value="로그아웃"/>
      </div>
   </div>
   <!-- 로그인 전 -->
   <div id="loginForm">
      <form name="loginForm" method="post" action="../loginProc.jsp">
         <div id="loginEmailArea">
            <label for="loginEmail">E-Mail</label>
            <div class="loginInputBox">
               <input type="email" id="loginEmail" name="email" placeholder="이메일"/>
            </div>
         </div>
         <div id="loginPwArea">
            <label for="loginPw">Password</label>
            <div class="loginInputBox">
               <input type="password" name="userPw" id="loginPw" placeholder="비밀번호 8자 이상 입력"/>
            </div>
         </div>
         <div class="loginSubmitBox">
            <input type="submit" id="loginSubmit" value="로그인"/> 
         </div>
      </form>
   </div>
</header>

<div id="container">
   <div id="center">
      <div id="myWallPhoto"></div>
      <div id="myProfilePhoto">
         <img src="../images/me/pro.PNG" />
      </div>
      <p id="name">라이언</p>
      <div class="myButtonBox">
         <form name="photo" method="post" action="/myservice/database/myMember.jsp" 
            enctype="multipart/form-data">
            <div class="photoBox">
               <input type="file" name="myProfilePhoto" class="photoSelectorBtn" />
            </div>
            
            <input type="hidden" name="mode" value="photo" />
            
            <div class = "photoBox">
               <input type="submit" id="myProfilePhtoUploadBtn" value="프로필 사진 변경" />
            </div>
         </form>
      </div>
      <div class="myButtonBox">
         <form name="photo" method="post" action="/myservice/database/myMember.jsp"
            enctype="multipart/form-data">
            <div class="photoBox">
               <input type="file" name="myCoverPhoto" class="photoSelectorBtn" />
            </div>
            <input type="hidden" name="mode" value="photo" />
            
            <div class = "photoBox">
               <input type="submit" id="myCoverPhotoUploadBtn" value="커버 사진 변경" />
            </div>
         </form>
      </div>
      
      <div class="myButtonBox">
      <form name="write" method="post" action="writeForm.jsp">
         <div id="writing" align="right">
               <input type="submit" id="mePostBtn" value="글쓰기" />
         </div>
      </form>
      </div>
<!--       <div id="myContent">
         <div id="writing">
            <div class="me">
               <img src="./images/me/pro.PNG" />
                  <p>라이언</p>
            </div>
            <textarea maxlength="500" id="meContent"></textarea>
            <div id="inputBox">
               <input type="button" id="mePostBtn" value="게시" />
            </div>
         </div> -->
         

         
         
      <div class="reading">
         <div class="writerArea">
            <img src="../images/me/pro.PNG" />
            <div class="writingInfo">
            <p>라이언  </p>
            <div class="writingDate"></div> <!-- 작성일 -->
         </div>
      </div>
      
      <span class="content">
      	<input type="text" name="inputcontents"/>
      </span>
      
      
<!--       <div class="likeArea">
         <div class="likeNum likes861225" style="background:#fff">공감수 : 250</div>
         <div class="likeBtn" id="likes861225">공감하기</div>
         <div class="contentsID">콘텐츠 번호: 861225</div>
      </div> -->
      
       <div class="myCommentArea myCommentAtra861225">
         <div class="commentBox">
            <img src="../images/me/pro.PNG" />
            <p class="commentRegTime">2021년 04월 10일</p>
            <p class="commentPoster">댓글 작성자</p>
            <p class="writtenComment">네네네</p> 
         </div>
      </div> 
<!--       <div class="inputBox">
         <img src="./images/me/pro.PNG" />
         <input type="text" class="inputComment comments861225" placeholder="코멘트 입력" />
         <div class="regCommentBox">
            <input type="button" class="regCommentBtn" id="comments861225" value="게시" />
         </div>
      </div> -->
      <div class="regCommentBox">
      </div>
    </div>
</div>
<div id="noContents">
   더 이상 콘텐츠가 없습니다.
</div>
   <input type="hidden" name="page" id="page" value="1" />
</div>
<footer>
   <link rel="stylesheet" href="../css/footer.css" />
   <p>MBTI 커뮤니티</p>
</footer>
</body>
</html>