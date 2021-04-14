<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.comment.CommentsDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.jjj.comment.Comments"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId="jjj";
	if(session.getAttribute("userId")!=null) {
		userId=(String)session.getAttribute("userId");
	}
	
	CommentsDAO commentsDao = new CommentsDAO();
	Connection conn = commentsDao.getConn();
/*  	int commentsID = commentsDao.getAI(conn, "comments"); */
 	Comments comments = commentsDao.getComments(request);
	commentsDao.Insert(conn, comments);
  	int comNum =1; /* Integer.parseInt(request.getParameter("contentsid")); */
	List<Comments> lst = commentsDao.getCommentsList(conn, comNum);


%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI 커뮤니티</title>
<link rel="stylesheet" href="../css/cssReset.css" />
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/all.css" />
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src=../js/all.js></script>
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
            <input type="submit" id="loginSubmit" value="로그인"/> 
         </div>
      </form>
   </div>
</header>

<div id="timeLine">

<div class="orderbyArea">
	<div class="orderbyHistory" style="background:#fff">최신순</div>
	<div class="orderbyClicked" id="orderbyClicked">인기순</div>
	<div class="allPostBtn">글쓰기</div>
</div>

	<div class="reading">
		<div class="writerArea">
			<img src="../images/me/happyCat.png" />
			<div class="writingInfo">
				<p>조은지</p>
			</div>
		</div>
		
		<span class="content">반갑습니다.</span>
		
		<div class="likeArea">
			<div class="likeNum likes861225" style="background:#fff">공감수 : 250</div>
			<div class="likeBtn" id="likes861225">공감하기</div>
			<div class="contentsID"><input type="hidden" name="contentsid" <%-- value="<%=contentsid %>" --%> /> 콘텐츠 번호:<%--  <%=contentsid %> --%></div>
		</div>
<%
for(Comments comment : lst){
%>		
		<div class="myCommentArea myCommentAtra861225">
			<div class="commentBox">
				<img src="../images/me/happyCat.png" />
				<p class="commentRegTime"><%=comment.getRegtime() %></p>
				<p class="commentPoster"><%=userId %></p>
				<p class="writtenComment"><%=comment.getReply() %></p> 
			</div>
		</div>
		
<%
}
%>
		<form action="commentProc.jsp" method="post">
		<div class="inputBox">
			<img src="../images/me/happyCat.png" />
			<input type="text" class="inputComment comments861225" name="commentcontents" value="" placeholder="코멘트 입력" />
			<div class="regCommentBox">
				<input type="submit" class="regCommentBtn" id="comments861225" value="게시" />
			</div>
		
		
		</div>
		</form>
 	</div>
</div>
<div id="noContents">
	더 이상 콘텐츠가 없습니다.
</div>
	<input type="hidden" name="page" id="page" value="1" />
</div>
<aside id="advertiseBox">
	Advertisement
</aside>
<!-- 나중에 footer 넣을 자리 -->
<footer>
<link rel="stylesheet" href="../css/footer.css" />
   <p>MBTI 커뮤니티</p>
</footer>
</body>
</html>