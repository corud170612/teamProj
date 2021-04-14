<!-- myservice/index.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
         <form id="signUpForm" method="post" action="membershipProc.jsp">
            <div class="row">
               <div class="inputBox">
                  <input type="text" name="userName" id="userName" placeholder="이름" />
               </div>
            </div>
            <div class="row">
               <div class="inputBox">
                  <input type="email" name="userEmail" id="userEmail" placeholder="이메일" />
               </div>
            </div>
            <div class="row">
               <div class="inputBox">
                  <input type="password" name="userPw" id="userPw" placeholder="비밀번호" />
               </div>
            </div>
            <div class="row">
               <label>생일</label>
               <div class="selectBox">
                  <select name="birthYear" id="birthYear">
                     <option value="">연도</option>
                     <option value="2016">2016</option>
                     <option value="2015">2015</option>
                     <option value="2014">2014</option>
                     <option value="2013">2013</option>
                  </select>
               </div>
               
               <div class="selectBox selectBoxMargin">
                  <select name="birthMonth" id="birthMonth">
                     <option value="">월</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                  </select>
               </div>
               <div class="selectBox">
                  <select name="birthDay" id="birthDay">
                     <option value="">일</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                  </select>
               </div>
            </div>
            <div class="row genderRow">
               <div id="genderLabel">
                  <label for="gW" id="gMW">여성</label>
                  <label for="gM" id="gMM">남성</label>
               </div>
               <input type="radio" name="gender" class="gender" id="gW" value="1" />
               <input type="radio" name="gender" class="gender" id="gM" value="2" />
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
                  <input type="text" name="userMbti" id="userMbti" placeholder="MBTI를 적어주세요" />
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