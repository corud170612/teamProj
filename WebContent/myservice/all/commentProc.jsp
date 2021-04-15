<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.jjj.comment.Comments"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.comment.CommentsDAO"%>
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
	System.out.print(sf.format(nowTime));
	String nowdate = sf.format(nowTime);
	
	request.setCharacterEncoding("UTF-8");
	String commentcontents = request.getParameter("commentcontents");
	
	int contentsid = Integer.parseInt(request.getParameter("contentsid"));
	
	CommentsDAO commentsDao = new CommentsDAO();
	Connection conn = commentsDao.getConn();
		Comments comments = commentsDao.getComments(request, nowdate, commentcontents, contentsid, myMemberID);
	commentsDao.Insert(conn, comments);
	List<Comments> lst = commentsDao.getCommentsList(conn, contentsid);
	session.setAttribute("commentsLst", lst);
	
%>
<jsp:forward page="../index.jsp">
<jsp:param value="commentProc" name="currentPage"/>
</jsp:forward>