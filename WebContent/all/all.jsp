<%@page import="com.jjj.Contents.ContentsWriteDAO"%>
<%@page import="com.jjj.DTO.Contents"%>
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
	ContentsWriteDAO contentsDao = new ContentsWriteDAO();
	Connection conn = contentsDao.getConn();
 	List<Contents> lst = contentsDao.getAllList(conn);
	session.setAttribute("contentsLst", lst);
	List<Contents> contentsLst = (List<Contents>)session.getAttribute("contentsLst");

	CommentsDAO commentsDao = new CommentsDAO();
	Connection conn2 = commentsDao.getConn();

	int count = 1;
	int count2 = 1;
	int count3 = 1;
	int count4 = 1;
	session.setAttribute("contentsLstSize", contentsLst.size());
	System.out.println(session.getAttribute("likesNum")+";;;;;;;;;;");
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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/all.js"></script>
</head>
<body>
<form id="frm" action="<%=request.getContextPath() %>/all/commentProc.jsp" method="post">
<div id="timeLine">

<div class="orderbyArea">
	<div class="orderbyHistory" style="background:#fff"><a href="<%=request.getContextPath() %>/index.jsp?currentPage=all">최신순</a></div>
	<div class="orderbyClicked" id="orderbyClicked"><a href="<%=request.getContextPath() %>/index.jsp?currentPage=allOrderbyLikesSum">공감순</a></div>
	<div class="allPostBtn"><a href="<%=request.getContextPath() %>/all/ContentsForm2.jsp">글쓰기</a></div>
</div>
<%
	for(Contents t : contentsLst) {
%>
	<div class="reading">
		<div class="writerArea">
			<img src="<%=request.getContextPath() %>/images/me/happyCat.png" />
			<div class="writingInfo">
				<p><%=t.getUserName() %></p>
			</div>
		</div>
		
		<span class="content"><%=t.getContent() %></span>
		
		<div class="likeArea">
			<div class="contentsID"> 콘텐츠 번호: <%=t.getContentsid() %></div>
			<input type="hidden" name="contentsid<%=count++ %>" value="<%=t.getContentsid() %>" />
			<div class="likeBtn" >
				<a href="<%=request.getContextPath() %>/all/likesProc.jsp?likeBtn<%=count4++ %>=<%=t.getContentsid() %>">공감하기</a>
			</div>		
			<div class="likeNum" style="background:#fff">공감수 : <%=t.getLikesSum() %></div>
		</div>
		</div>
		<div class="myCommentArea">
<%
	List<Comments> lst2 = commentsDao.getCommentsList(conn2, t.getContentsid());
	session.setAttribute("commentsLst", lst2);
	List<Comments> commentsLst = (List<Comments>)session.getAttribute("commentsLst");
	
	//System.out.println(lst2.size()+" : lst2사이즈");

		for(Comments c : commentsLst) {
				//System.out.println(t.getContentsid()+"글번호");
				//System.out.println(c.getContentsid()+"댓글번호");
%>		
		
			<div class="commentBox">
				<input type="hidden" name="commentsid<%=count3++ %>" value="<%=c.getCommentsid() %>" />
				<img src="<%=request.getContextPath() %>/images/me/niniz.PNG" />
				<p class="commentPoster"><%=c.getUserName() %></p> 
				<p class="commentRegTime"><%=c.getRegtime() %></p>
				<p class="writtenComment"><%=c.getReply() %></p> 
			</div>
		
<%
		}
%>
		</div>
		<div class="inputBox">
			<img src="<%=request.getContextPath() %>/images/me/pro.PNG" />
			<input type="text" class="inputComment" name="commentcontents<%=count2++ %>" placeholder="코멘트 입력" />
			<div class="regCommentBox">
				<input type="submit" class="regCommentBtn" value="게시" />
			</div>
		</div>
<%
	}
%>
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