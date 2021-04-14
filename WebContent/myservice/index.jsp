<!-- myservice/index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("userName");
	String email = request.getParameter("userEmail");
	String pw = request.getParameter("userPw");
	String gender = request.getParameter("gender");
	String mbti = request.getParameter("userMbti");
	
	if(name==null)name="";
	if(email==null)email="";
	if(pw==null)pw="";
	if(gender==null)gender="w";
	if(mbti==null)mbti="";
	
	String mChk="checked";
	String wChk="";

	if("w".contentEquals(gender)){
		mChk="";
		wChk="checked";
	}else if("m".contentEquals(gender)){
		mChk="checked";
		wChk="";
	}
%>
<!-- 로그인 후 -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/cssReset.css" />
<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/index.css" />

<meta name="viewport" content="width=device-width" charset="UTF-8">
<title>MBTI 커뮤니티</title>
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
		<form name="loginForm" method="post" action="./loginProc.jsp">
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
<!-- container -->
<div id="container">
	<section id="introSite">
		<div id="siteComment">
			어서오세요<br/>
			MBTI 커뮤티니에 오신걸<br/>
			환영합니다.
		</div>
		<div id="signUpBtn">
			<p>가입하기</p>
		</div>
	</section>
	<section id="signup">
		<div id="signupCenter">
		<script  src='../js/memberForm.js' type="text/javascript"></script>
			<form id="signUpForm" method="post" action="membership/membershipProc.jsp">
				<div class="row">
					<div class="inputBox">
						<input type="text" name="userName" id="userName" value="<%=name %>" placeholder="이름" />
					</div>
				</div>
				<div class="row">
					<div class="inputBox">
						<input type="email" name="userEmail" id="userEmail" value="<%=email %>" placeholder="이메일" />
					</div>
				</div>
				<div class="row">
					<div class="inputBox">
						<input type="password" name="userPw" id="userPw" value="<%=pw %>" placeholder="비밀번호" />
					</div>
				</div>
				<div class="row genderRow">
					<div id="genderLabel">
						<label for="gW" id="gMW">여성</label>
						<input type="radio" name="gender" class="gender" id="gW" value='w' <%=wChk %> />
						<label for="gM" id="gMM">남성</label>
						<input type="radio" name="gender" class="gender" id="gM" value='m' <%=mChk %> />
					</div>
				</div>
				<div class="row">
					<p id="valueError"></p>
				</div>
				<div class="row2">
					<label>나의 MBTI는?</label>
				</div>
				<div class="mbti">
					<div id="mbtiPage">
						<a href="https://www.16personalities.com/ko"target="_blank" id="mbtiGo">MBTI검사하러가기</a>
					</div>
					<div class="row">
					
					<div class="inputBox">
						<input type="text" name="userMbti" id="userMbti" value="<%=mbti %>" placeholder="MBTI를 적어주세요" />
					</div>
				</div>
				</div>
				
				<div class="row">
					<div class="submitBox">
						<input type="submit" id="signUpSubmit" value="가입하기" />
					</div>
				</div>
				<input type="hidden" name="mode" value="save" />
			</form>
			<div id="goToLoginBtn">
				<p>로그인하기</p>
			</div>
		</div>
	</section>
</div>
<footer>
<link rel="stylesheet" href="./css/footer.css" />
	<p>MBTI 커뮤니티</p>
</footer>
</body>
</html>