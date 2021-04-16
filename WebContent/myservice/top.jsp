<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/header.css" />
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