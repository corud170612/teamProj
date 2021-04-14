me/ContentsForm.jsp


<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta name = "viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI 커뮤니케이션</title>
<link rel="stylesheet" href="../css/cssReset.css" />
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/footer.css" />

<style>
#myWallPhoto{background:url('../images/me/back.PNG');background-size:cover;
background-repeat:no-repeat;background-position:50% 50%;border-bottom:1px solid #ccc}
</style>
</head>
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
<center>
<form action="writeProc.jsp" method="post" enctype="multipart/form-data">
<table style="width: 650px; ">

	<tr>
<!-- 		<td  style="width: 50px; height:100px;" align="right">제 목</td>
		<td style="width: 1000px; height:100px;">
			<input type=text name='title' style="width: 750px; height:30px; "/> 
		<input type="radio" name="radioBtn" value="open" /> 전채공개
			<input type="radio" name="radioBtn" value="close"/>비공개
		</td> -->
	</tr>
	<tr>
		<td colspan=2 align="right"><br/><br/><textarea name="contents" style="width: 1000px; height: 500px"></textarea></td>
	</tr>
	<tr>
		<td align='right' height=40 colspan=2>
			<input type=file name="uploadFile" style="width: 300px; "/> 
		</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan=2>
			<input type=submit  value='글쓰기' style="width: 200;  height:50px"/>
			<input type=reset value='취소' style="width: 200px; height:50px"/>	 
		</td>
	</tr>
</table>
</form>
</center>
<footer>
   <link rel="stylesheet" href="../css/footer.css" />
   <p>MBTI 커뮤니티</p>
</footer>