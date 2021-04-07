<!-- myservice/index.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 로그인 후 -->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width" charset="UTF-8">
<title>My First Web Service</title>
</head>
<body>
<div id="viwType">
	<a herf="/myservice/me.jsp" id="meLink">me</a>
	<a herf="/myservice/all.jsp" id="allLink">all</a>
</div>
<header>
	<div id="myService"> My First Web Service</div>
	<!-- 로그인 후 -->
	<div id="myName">
		<p>안녕하세요 전채경님</p>
		<div id="logoutBox">
			<input type="button" id="logoutBtn" value="로그아웃"/>
		</div>
	</div>
	<!-- 로그인 전 -->
	<div id="loginForm">
		<form name="loginForm" method="post" action="./login.jsp">
			<div id="loginEmailArea">
				<label for="loginEmail">E-Mail</label>
				<div class="loginInputBox">
					<input type="email" id="loginEmail" name="email" placeholder="이메일"/>
				</div>
			</div>
		</form>
	</div>
</header>
</body>
</html>