<%@ page contentType="text/html; charset=UTF-8"%>
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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/memberForm.css" />
<form id="signUpForm" method="post" action="membershipProc.jsp">
<input type="hidden" value="memberForm" name="currentPage" />
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

