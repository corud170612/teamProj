<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI 커뮤니티</title>
<link rel="stylesheet" href="./css/cssReset.css" />
<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/mbti.css" />
<script type="text/javascript" src="./js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src=./js/all.js></script>
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
      <form name="loginForm" method="post" action="./login.php">
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

<div id="categoryBox">
<section class="asideContent">
	<ul class="categories">
		<li><a href="">취업</a></li>
		<li><a href="">진로</a></li>
		<li><a href="">취미</a></li>
		<li>Advertisement</li>
	</ul>
</section>
</div>

<div id="timeLine">
<div class="orderbyArea">
	<div class="orderbyHistory" style="background:#fff">최신순</div>
	<div class="orderbyClicked" id="orderbyClicked">인기순</div>
	<div class="allPostBtn">글쓰기</div>
</div>

	<div class="reading">
		<div class="writerArea">
			<img src="./images/me/happyCat.png" />
			<div class="writingInfo">
				<p>김태영</p>
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
				<img src="./images/me/happyCat.png" />
				<p class="commentRegTime">2030년 12월 25일</p>
				<p class="commentPoster">김태영</p>
				<p class="writtenComment">반갑습니다.</p> 
			</div>
		</div>
		<div class="inputBox">
			<img src="./images/me/happyCat.png" />
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

<aside id="advertiseBox">
	Advertisement
</aside>
<!-- 나중에 footer 넣을 자리 -->
<footer>
<link rel="stylesheet" href="./css/footer.css" />
   <p>MBTI 커뮤니티</p>
</footer>
</body>
</html>