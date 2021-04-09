<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name = "viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI 커뮤니케이션</title>
<link rel="stylesheet" href="./css/cssReset.css" />
<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/footer.css" />
<script type="text/javascript" src="/.js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="./js/me.js"></script>

<link rel="stylesheet" href="./css/me.css"/>
<style>
#myWallPhoto{background:url('./images/me/back.PNG');background-size:cover;
background-repeat:no-repeat;background-position:50% 50%;border-bottom:1px solid #ccc}
</style>
</head>
<body>
<div id="viwType">
	<a href="/myservice/me.jsp" id="meLink">me</a>
	<a href="/myservice/all.jsp" id="allLink">all</a>
</div>
<header>
   <div id="myService"> My First Web Service</div>
   <!-- 로그인 전 -->
   <div id="loginForm">
      <form name="loginForm" method="post" action="./login.jsp">
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
            <input type="submit" id="loginSumnit" value="로그인"/> 
         </div>
      </form>
   </div>
</header>

<div id="container">
	<div id="center">
		<div id="myWallPhoto"></div>
		<div id="myProfilePhoto">
			<img src="./images/me/pro.PNG" />
		</div>
		<p id="name">라이언</p>
		<div class="myButtonBox">
			<form name="phto" method="post" action="/myservice/database/myMember.jsp" 
				enctype="multipart/form-data">
				<div class="photoBox">
					<input type="file" name="myProfilePhto" class="photoSelectorBtn" />
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
				<div class="photoBox">
					<input type="submit" id="myCoverPhotoUploadBtn" value="커버 사진 변경" />
				</div>
			</form>
		</div>
		<div id="myContent">
			<div id="writing">
				<div class="me">
					<img src="./images/me/pro.PNG" />
						<p>라이언</p>
				</div>
				<textarea maxlength="500" id="meContent"></textarea>
				<div id="inputBox">
					<input type="button" id="mePostBtn" value="게시" />
				</div>
			</div>
			
			<div class="reading">
		<div class="writerArea">
			<img src="./images/me/pro.PNG" />
			<div class="writingInfo">
				<p>라이언  </p>
				<div class="writingDate">2030년 12월 25일</div>
			</div>
		</div>
		
		
		<span class="content">반갑습니다.</span>
		
		<div class="likeArea">
			<div class="likeNum likes861225" style="background:#fff">공감수 : 250</div>
			<div class="likeBtn" id="likes861225">공감하기</div>
			<div class="contentsID">콘텐츠 번호: 861225</div>
		</div>
		
		<div class="myCommentArea myCommentAtra861225">
			<div class="commentBox">
				<img src="./images/me/pro.PNG" />
				<p class="commentRegTime">2030년 12월 25일</p>
				<p class="commentPoster">라이언</p>
				<p class="writtenComment">반갑습니다.</p> 
			</div>
		</div>
		<div class="inputBox">
			<img src="./images/me/pro.PNG" />
			<input type="text" class="inputComment comments861225" placeholder="코멘트 입력" />
			<div class="regCommentBox">
				<input type="button" class="regCommentBtn" id="comments861225" value="게시" />
			</div>
		</div>
 	</div>
</div>
<div id="noContents">
	더 이상 콘텐츠가 없습니다.
</div>
	<input type="hidden" name="page" id="page" value="1" />
</div>
<footer>
	<link rel="stylesheet" href="./css/footer.css" />
   <p>My First Web Service</p>
</footer>
</div>
</body>
</html>