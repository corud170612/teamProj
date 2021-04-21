<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.jjj.comment.Comments"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.comment.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int myMemberId=5;
	if(session.getAttribute("myMemberId")!=null) {
		myMemberId=(Integer)session.getAttribute("myMemberId");
	 }
	
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
	String nowdate = sf.format(nowTime);
	
	CommentsDAO commentsDao = new CommentsDAO();
	Connection conn = commentsDao.getConn();
	
	String reply="";
	for(int i=1; i<=(Integer)session.getAttribute("contentsLstSize"); i++){
			if(request.getParameter("commentcontents"+i)!=null) {
				reply = request.getParameter("commentcontents"+i);
				int contentsid = Integer.parseInt(request.getParameter("contentsid"+i));
				Comments comments = commentsDao.getComments(request, nowdate, reply, contentsid, myMemberId);
				commentsDao.Insert(conn, comments);
			}
		}
	

	session.getAttribute("contentsLstSize");
	System.out.println(session.getAttribute("contentsLstSize"));
	
/* 	 */
	/*  */

%>
<jsp:forward page="../index.jsp">
<jsp:param value="commentProc" name="currentPage"/>
</jsp:forward>