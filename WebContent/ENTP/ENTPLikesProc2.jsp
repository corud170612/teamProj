<%@page import="java.util.HashMap"%>
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

	System.out.println((Integer)session.getAttribute("contentsLstSize")+"********");
	//반복분
	for(int i=1; i<=(Integer)session.getAttribute("contentsLstSize"); i++){
		System.out.println(request.getParameter("likeBtn"+i)+"##########번째");
		if(request.getParameter("likeBtn"+i)!=null) {
		    //int contentsid = Integer.parseInt(request.getParameter("contentsid"+i));
		    //System.out.println(Integer.parseInt(request.getParameter("contentsid"+i))+"&&&&&&&&&");
		    likesDao.setLikesNum(conn, Integer.parseInt(request.getParameter("likeBtn"+i)));
		    session.setAttribute("likesNum", likesDao.setLikesSum(conn,Integer.parseInt(request.getParameter("likeBtn"+i))));

		}
	}

%>
<jsp:forward page="../index.jsp">
<jsp:param value="ENTPOrderbyLikesSum" name="currentPage"/>
</jsp:forward>