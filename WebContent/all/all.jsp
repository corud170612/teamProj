<%@page import="com.jjj.likes.Likes"%>
<%@page import="com.jjj.likes.LikesDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.comment.CommentsDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.jjj.comment.Comments"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int myMemberID=123;
	if(session.getAttribute("myMemberID")!=null) {
		myMemberID=(Integer)session.getAttribute("myMemberID");
	}
	String userName="jjj";
	if(session.getAttribute("userName")!=null) {
		userName=(String)session.getAttribute("userName");
	}
	
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
	String nowdate = sf.format(nowTime);
	
	int contentsid = 70; /* Integer.parseInt(request.getParameter("contentsid")); */
	
	LikesDAO likesDao = new LikesDAO();
	Connection conn = likesDao.getConn();
	Likes likes = likesDao.getLikes(request, nowdate, contentsid, myMemberID);
	likesDao.Insert(conn, likes);
	int likesNum = likesDao.getLikesNum(conn, contentsid);
	session.setAttribute("likesNum", likesNum);
	int likesNum2 = (Integer)session.getAttribute("likesNum");
	
	CommentsDAO commentsDao = new CommentsDAO();
	Connection conn2 = commentsDao.getConn();
	String commentcontents = request.getParameter("commentcontents");
	Comments comments = commentsDao.getComments(request, nowdate, commentcontents, contentsid, myMemberID);
	commentsDao.Insert(conn2, comments);
	List<Comments> lst = commentsDao.getCommentsList(conn2, contentsid);
	session.setAttribute("commentsLst", lst);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI 커뮤니티</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cssReset.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/all.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src=<%=request.getContextPath() %>/js/all.js></script>
</head>
<body>
<form id="frm" action="<%=request.getContextPath() %>/all/commentProc.jsp" method="post">
<div id="timeLine">

<div class="orderbyArea">
	<div class="orderbyHistory" style="background:#fff">최신순</div>
	<div class="orderbyClicked" id="orderbyClicked">인기순</div>
	<div class="allPostBtn" style="border-right: 1px solid #ccc">글쓰기</div>
</div>

	<div class="reading">
		<div class="writerArea">
			<img src="<%=request.getContextPath() %>/images/me/happyCat.png" />
			<div class="writingInfo">
				<p>조은지</p>
			</div>
		</div>
		
		<span class="content">반갑습니다.</span>
		
		<div class="likeArea">
			<div class="likeNum" style="background:#fff">공감수 : <%=likesNum2 %></div>
			<div class="likeBtn" ><input type="button" onclick="formSubmit('frm','/all/likesProc.jsp')" name="likeBtn" value="공감하기"/></div>
			<div class="contentsID"> 콘텐츠 번호: <%=contentsid %> <%=request.getParameter("contentsid") %></div>
</div>
		<div class="myCommentArea myCommentAtra861225">
<%
	
  	List<Comments> commentsLst = (List<Comments>)session.getAttribute("commentsLst"); 

	for(Comments c : commentsLst) {
%>		
		
			<div class="commentBox">
			<input type="hidden" value="<%=c.getContentsid() %>" />
			<input type="hidden" value="<%=c.getCommentsid() %>" />
				<img src="<%=request.getContextPath() %>/images/me/happyCat.png" />
<%-- 				<p class="CommentMemberid"><%=c.getMymemberid() %></p> 
				<p class="commentRegTime"><%=c.getRegtime() %></p> --%>
				<p class="commentPoster"><%=userName %></p>
				<p class="writtenComment"><%=c.getReply() %></p> 
			</div>
		
<%
}
%>
</div>
		<div class="inputBox">
			<img src="<%=request.getContextPath() %>/images/me/happyCat.png" />
			<input type="text" class="inputComment comments861225" name="commentcontents" value="" placeholder="코멘트 입력" />
			<div class="regCommentBox">
				<input type="submit" class="regCommentBtn" id="comments861225" value="게시" />
			</div>
		
		
		</div>
 	</div>
</div>
</form>
<div id="noContents">
	더 이상 콘텐츠가 없습니다.
</div>
	<input type="hidden" name="page" id="page" value="1" />
</div>
<aside id="advertiseBox">
	Advertisement
</aside>
</body>
</html>