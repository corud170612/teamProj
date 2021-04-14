<%@page import="java.util.List"%>
<%@page import="com.jjj.comment.Comments"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.comment.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	out.print(request.getParameter("commentcontents"));
	
	CommentsDAO commentsDao = new CommentsDAO();
	Connection conn = commentsDao.getConn();
/*  	int commentsID = commentsDao.getAI(conn, "comments"); */
 	Comments comments = commentsDao.getComments(request);
	commentsDao.Insert(conn, comments);
	List<Comments> lst = commentsDao.getCommentsList(conn);
	session.setAttribute("commentsLst", lst);
%>
<jsp:forward page="<%=request.getContextPath() %>/all/all.jsp">
<jsp:param value="signatureFormSnd" name="currentPage"/>
</jsp:forward>