<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String name = (String)session.getAttribute("userName");
   String YN = (String)session.getAttribute("YN");

/*    int contentsid = (Integer) */
 
   String contextPath =request.getContextPath();
   System.out.println(contextPath);   
   String Currentpath = contextPath +  "/index.jsp?currentPage=";
   System.out.println("현재 접속중인 id :" + name);  

%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cssReset.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css" />
<script  src='<%=request.getContextPath()%>/js/loginForm.js' type="text/javascript"></script>
<head>

<meta name="viewport" content="width=device-width" charset="UTF-8">
<title>MBTI 커뮤니티</title>
</head>

<div id="viewType" align="center">
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
            <a id="kakao-login-btn"></a>
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

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init('89a0ce8b1b2c426078cbea78228b7cb9');
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(res) {
          var login = JSON.stringify(res);
          var email = res.kakao_account.email;
          
          document.getElementById("email").value = email;
          document.getElementById("pw").value = "0";
          document.getElementById("loginSubmit").click();
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  });
</script>