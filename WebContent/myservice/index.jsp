<!-- myservice/index.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- �α��� �� -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/header.css" />
<meta name="viewport" content="width=device-width" charset="UTF-8">
<title>My First Web Service</title>
</head>
<body>
<div id="viwType">
	<a href="/myservice/me.jsp" id="meLink">me</a>
	<a href="/myservice/all.jsp" id="allLink">all</a>
</div>
<header>
	<div id="myService"> My First Web Service</div>
	<!-- �α��� �� -->
	<div id="myName">
		<p>�ȳ��ϼ��� ��ä���</p>
		<div id="logoutBox">
			<input type="button" id="logoutBtn" value="�α׾ƿ�"/>
		</div>
	</div>
	<!-- �α��� �� -->
	<div id="loginForm">
		<form name="loginForm" method="post" action="./login.jsp">
			<div id="loginEmailArea">
				<label for="loginEmail">E-Mail</label>
				<div class="loginInputBox">
					<input type="email" id="loginEmail" name="email" placeholder="�̸���"/>
				</div>
			</div>
			<div id="loginPwArea">
				<label for="loginPw">Password</label>
				<div class="loginInputBox">
					<input type="password" name="userPw" id="loginPw" placeholder="��й�ȣ 8�� �̻� �Է�"/>
				</div>
			</div>
			<div class="loginSubmitBox">
				<input type="submit" id="loginSumnit" value="�α���"/> 
			</div>
		</form>
	</div>
</header>
<!-- container -->
<div id="container">
<link rel="stylesheet" href="./css/index.css" />
	<section id="introSite">
		<div id="siteComment">
			�������<br/>
			MBTI Ŀ��Ƽ�Ͽ� ���Ű�<br/>
			ȯ���մϴ�.
		</div>
		<div id="signUpBtn">
			<p>�����ϱ�</p>
		</div>
	</section>
	<section id="signup">
		<div id="signupCenter">
			<form id="signUpForm" method="post" action="./database/myMember.jsp">
				<div class="row">
					<div class="inputBox">
						<input type="text" name="userName" id="userName" placeholder="�̸�" />
					</div>
				</div>
				<div class="row">
					<div class="inputBox">
						<input type="email" name="userEmail" id="userEmail" placeholder="�̸���" />
					</div>
				</div>
				<div class="row">
					<div class="inputBox">
						<input type="password" name="userPw" id="userPw" placeholder="��й�ȣ" />
					</div>
				</div>
				<div class="row">
					<label>����</label>
					<div class="selectBox">
						<select name="birthYear" id="birthYear">
							<option value="">����</option>
							<option value="2016">2016</option>
							<option value="2015">2015</option>
							<option value="2014">2014</option>
							<option value="2013">2013</option>
						</select>
					</div>
					
					<div class="selectBox selectBoxMargin">
						<select name="birthMonth" id="birthMonth">
							<option value="">��</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
					<div class="selectBox">
						<select name="birthDay" id="birthDay">
							<option value="">��</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
				</div>
				<div class="row genderRow">
					<div id="genderLabel">
						<label for="gW" id="gMW">����</label>
						<label for="gM" id="gMM">����</label>
					</div>
					<input type="radio" name="gender" class="gender" id="gW" value="w" />
					<input type="radio" name="gender" class="gender" id="gM" value="m" />
				</div>
				<div class="row">
					<p id="valueError"></p>
				</div>
				<div class="row">
					<div class="submitBox">
						<input type="submit" id="signSubmit" value="�����ϱ�" />
					</div>
				</div>
				<input type="hidden" name="mode" value="save" />
			</form>
			<div id="goToLoginBtn">
				<p>�α����ϱ�</p>
			</div>
		</div>
	</section>
</div>
<footer>
<link rel="stylesheet" href="./css/footer.css" />
	<p>My First Web Service</p>
</footer>
</body>
</html>