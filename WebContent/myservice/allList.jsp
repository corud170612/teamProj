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
<link rel="stylesheet" href="./css/allList.css" />
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
   <div id="myService"> MBTI 커뮤니케이션</div>
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
				<input type="submit" id="loginSumnit" value="로그인"/> 
			</div>
		</form>
	</div>
</header>

<form id="frm"  method="post">
<table id="listTable" >
	<thead>
	<tr>
		<th id="thead1">글번호</th>
		<th id="thead2">제 목</th>
		<th id="thead3">작성자</th>
		<th id="thead4">유 형</th>
		<th id="thead5">작성일</th>
		<th id="thead6">조회수</th>
	</tr>
	</thead>
	<tr>
		<td colspan=6 ><hr/></td>
	</tr>
	<tr>
		<td id="td1">글번호입니다.</td>
		<td id="td2">제목입니다.</td>
		<td id="td3">아이디입니다.</td>
		<td id="td4">유형입니다.</td>
		<td id="td5">작성일입니다.</td>
		<td id="td6">조회수입니다.</td>
	</tr>
	<tr><td colspan=6><hr/></td></tr>
	<tr>
		<td colspan=3><input type="text" name="search" style="width:100%" /></td>
		<td colspan=3 align="right">
			<input type="button" value='검색' style="width:25%"/>
			<input type="submit" name='submitBtn' value='글쓰기' style="width:25%"/>
		</td>
	</tr>
	<tr><td colspan=6><hr/></td></tr>
</table>
</form>

<div id="noContents">
	더 이상 콘텐츠가 없습니다.
</div>
	<input type="hidden" name="page" id="page" value="1" />
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