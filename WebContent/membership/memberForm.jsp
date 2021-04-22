<%@page import="com.jjj.membership.Mymember"%>
<%@page import="com.jjj.membership.MembershipDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

String name = request.getParameter("userName");
String email = request.getParameter("userEmail");
String pw = request.getParameter("userPw");
String gender = request.getParameter("gender");
String mbti = request.getParameter("userMbti");
String pro = request.getParameter("profilePhoto");
String cover = request.getParameter("coverPhoto");

//String Photo = (String)session.getAttribute("userName");
   
   
if (name == null)
   name = "";
if (email == null)
   email = "";
if (pw == null)
   pw = "";
if (gender == null)
   gender = "w";
if (mbti == null)
   mbti = "";

String mChk = "checked";
String wChk = "";

if ("w".contentEquals(gender)) {
   mChk = "";
   wChk = "checked";
} else if ("m".contentEquals(gender)) {
   mChk = "checked";
   wChk = "";
   
}



%>

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/memberForm.css" />
   <link rel="stylesheet" href="<%=request.getContextPath() %>/css/cssReset.css" />
<script type="text/javascript" src='<%=request.getContextPath()%>/js/membership.js'></script>

<form id="frm" name="frm" method="post"
   action="<%=request.getContextPath()%>/membership/membershipProc.jsp">
   <input type="hidden" value="memberForm" name="currentPage" />
   <input type="hidden" value="/images/me/pro.PNG" name="profilePhoto"/>
   <input type="hidden" value="/images/me/back.PNG" name="coverPhoto"/>
   <div id="container">
      <section id="introSite">
         <div id="siteComment">
            어서오세요<br /> MBTI 커뮤티니에 오신걸<br /> 환영합니다.
         </div>
         <div id="signUpBtn">
            <p>가입하기</p>
         </div>
      </section>
      <section id="signup">
         <div id="signupCenter">
            <div class="row">
               <div class="inputBox">
                  <input type="text" name="userName" id="userName" value="<%=name%>"
                     placeholder="이름" />
               </div>
            </div>
            <div class="row">
               <div class="inputBox">
                  <input type="email" name="userEmail" id="userEmail"
                     value="<%=email%>" placeholder="이메일" />
               </div>
            </div>
            <div class="row">
               <div class="inputBox">
                  <input type="password" name="userPw" id="userPw" value="<%=pw%>"
                     placeholder="비밀번호" />
               </div>
            </div>
            <div class="row genderRow">
               <div id="genderLabel">
                  <label for="gW" id="gMW">여성</label>
                  <input type="radio" name="gender" class="gender" id="gW" value='w' <%=wChk%> />
                  <label for="gM" id="gMM">남성</label> <input type="radio" name="gender"
                     class="gender" id="gM" value='m' <%=mChk%> />
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
                  <a href="https://www.16personalities.com/ko" target="_blank"
                     id="mbtiGo">MBTI검사하러가기</a>
               </div>
               <div class="row">
                  <%-- <div class="inputBox">
                     <input type="text" name="userMbti" id="userMbti"
                        value="<%=mbti%>" placeholder="MBTI를 적어주세요" />
                  </div> --%>
                  <select name="userMbti" id="userMbti" style="width: 80px; height: 40px; font-size: 20px;" >
                      <option value="">MBTI</option>
                      <option value="ISTP">ISTP</option>
                      <option value="ISFP">ISFP</option>
                      <option value="ESTP">ESTP</option>
                      <option value="ESFP">ESFP</option>
                      <option value="INTP">INTP</option>
                      <option value="INTJ">INTJ</option>
                      <option value="ENTP">ENTP</option>
                      <option value="ENTJ">ENTJ</option>
                      <option value="INFP">INFP</option>
                      <option value="INFJ">INFJ</option>
                      <option value="ENFP">ENFP</option>
                      <option value="ENFJ">ENFJ</option>
                      <option value="ISTJ">ISTJ</option>
                      <option value="ISFJ">ISFJ</option>
                      <option value="ESTJ">ESTJ</option>
                      <option value="ESFJ">ESFJ</option>
                  </select>
               </div>
            </div>

            <div class="row">
               <div class="submitBox">
                  <input type="button" id="signUpSubmit" value="가입하기" onclick="inputCheck('userName', 'userEmail', 'userPw', 'userMbti', 'frm', '<%=request.getContextPath() %>/membership/membershipProc.jsp');">
                  <!-- <input type="submit" id="signUpSubmit" value="가입하기" /> -->
               </div>
            </div>
            <input type="hidden" name="mode" value="save" />
         </div>
      </section>
   </div>
</form>