<%@ page contentType="text/html; charset=UTF-8"%>
<%
   String name = (String)session.getAttribute("userName");
   String YN = (String)session.getAttribute("YN");
 
   String contextPath =request.getContextPath();
   System.out.println(contextPath);   
   String Currentpath = contextPath +  "/index.jsp?currentPage=";
   System.out.println("현재 접속중인 id :" + name);  

%>
<script  src='<%=request.getContextPath()%>/js/loginForm.js' type="text/javascript"></script>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cssReset.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css" />

<meta name="viewport" content="width=device-width" charset="UTF-8">
<title>MBTI 커뮤니티</title>
</head>

<div id="viwType" align="center">
   <a href="<%=Currentpath %>me" id="meLink">ME</a>
   <a href="<%=Currentpath %>all" id="allLink">ALL</a>
   <a href="<%=Currentpath %>mbti" id="mbtiLink">MBTI</a>
</div>

<header>
<div id="myService"> MBTI 커뮤니티</div>
   <%
   if(YN == null || YN.equals("N")){
   %>
   <!-- 로그인 전 -->
   <div id="loginForm">
      <form name="loginForm" action="<%=request.getContextPath() %>/login/loginProc.jsp" method="post" >
         <div id="loginEmailArea">
            <label for="loginEmail">E-Mail</label>
            <div class="loginInputBox">
               <input type="email" id="email" name="email" placeholder="이메일"/>
            </div>
         </div>
         <div id="loginPwArea">
            <label for="loginPw">Password</label>
            <div class="loginInputBox">
               <input type="password" name="pw" id="pw" placeholder="비밀번호 8자 이상 입력"/>
            </div>
         </div>
         <div class="loginSubmitBox">
            <input type="submit" id="loginSubmit" value="로그인"/> 
         </div>
      </form>
   </div>
   <%
   } else {
   %>
   <!-- 로그인 후 -->
   <div id="myName">
      <p>안녕하세요 <%=name %>님</p>
      <div id="logoutBox">
      <a type="button" href="<%=request.getContextPath() %>/login/logout.jsp">로그아웃</a>
      <!-- <input type="button" id="logoutBtn" onclick="./login/logout.jsp" value="로그아웃"/> -->
      </div>
   </div>
   <%
   }
   %>
</header>