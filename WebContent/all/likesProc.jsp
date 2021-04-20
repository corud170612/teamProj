<%@page import="com.jjj.likes.Likes"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.likes.LikesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LikesDAO likesDao = new LikesDAO();
	Connection conn = likesDao.getConn();
	
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
	String nowdate = sf.format(nowTime);
	
	int contentsid = Integer.parseInt(request.getParameter("contentsid"));
	
	int myMemberId=1;
	if(session.getAttribute("myMemberId")!=null) {
		myMemberId=(Integer)session.getAttribute("myMemberId");
	 }
	
	Likes likes = likesDao.getLikes(request, nowdate, contentsid, myMemberId);
	likesDao.Insert(conn, likes);
	int likesNum = likesDao.getLikesNum(conn,contentsid);
	
	session.setAttribute("likesNum", likesNum);
%>
<jsp:forward page="../index.jsp">
<jsp:param value="likesProc" name="currentPage"/>
</jsp:forward>