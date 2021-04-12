<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI 而ㅻ�ㅻ땲�떚</title>
<link rel="stylesheet" href="./css/cssReset.css" />
<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/all.css" />
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
   <div id="myService"> MBTI 而ㅻ�ㅻ땲�떚</div>
   <!-- 濡쒓렇�씤 �썑 -->
   <div id="myName">
      <p>�븞�뀞�븯�꽭�슂 �쟾梨꾧꼍�떂</p>
      <div id="logoutBox">
         <input type="button" id="logoutBtn" value="濡쒓렇�븘�썐"/>
      </div>
   </div>
   <!-- 濡쒓렇�씤 �쟾 -->
   <div id="loginForm">
      <form name="loginForm" method="post" action="./login.php">
         <div id="loginEmailArea">
            <label for="loginEmail">E-Mail</label>
            <div class="loginInputBox">
               <input type="email" id="loginEmail" name="email" placeholder="�씠硫붿씪"/>
            </div>
         </div>
         <div id="loginPwArea">
            <label for="loginPw">Password</label>
            <div class="loginInputBox">
               <input type="password" name="userPw" id="loginPw" placeholder="鍮꾨�踰덊샇 8�옄 �씠�긽 �엯�젰"/>
            </div>
         </div>
         <div class="loginSubmitBox">
            <input type="submit" id="loginSubmit" value="濡쒓렇�씤"/> 
         </div>
      </form>
   </div>
</header>

<div id="timeLine">

<div class="orderbyArea">
	<div class="orderbyHistory" style="background:#fff">理쒖떊�닚</div>
	<div class="orderbyClicked" id="orderbyClicked">�씤湲곗닚</div>
	<div class="allPostBtn">湲��벐湲�</div>
</div>

	<div class="reading">
		<div class="writerArea">
			<img src="./images/me/happyCat.png" />
			<div class="writingInfo">
				<p>源��깭�쁺</p>
			</div>
		</div>
		
		<span class="content">諛섍컩�뒿�땲�떎.</span>
		
		<div class="likeArea">
			<div class="likeNum likes861225" style="background:#fff">怨듦컧�닔 : 250</div>
			<div class="likeBtn" id="likes861225">怨듦컧�븯湲�</div>
			<div class="contentsID">肄섑뀗痢� 踰덊샇: 861225</div>
		</div>
		
		<div class="myCommentArea myCommentAtra861225">
			<div class="commentBox">
				<img src="./images/me/happyCat.png" />
				<p class="commentRegTime">2030�뀈 12�썡 25�씪</p>
				<p class="commentPoster">源��깭�쁺</p>
				<p class="writtenComment">諛섍컩�뒿�땲�떎.</p> 
			</div>
		</div>
		<div class="inputBox">
			<img src="./images/me/happyCat.png" />
			<input type="text" class="inputComment comments861225" placeholder="肄붾찘�듃 �엯�젰" />
			<div class="regCommentBox">
				<input type="button" class="regCommentBtn" id="comments861225" value="寃뚯떆" />
			</div>
		</div>
 	</div>
</div>
<div id="noContents">
	�뜑 �씠�긽 肄섑뀗痢좉� �뾾�뒿�땲�떎.
</div>
	<input type="hidden" name="page" id="page" value="1" />
</div>
<aside id="advertiseBox">
	Advertisement
</aside>
<!-- �굹以묒뿉 footer �꽔�쓣 �옄由� -->
<footer>
<link rel="stylesheet" href="./css/footer.css" />
   <p>MBTI 而ㅻ�ㅻ땲�떚</p>
</footer>
</body>
</html>