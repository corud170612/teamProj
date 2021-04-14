<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.jjj.comment.Comments"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.comment.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
System.out.print(sf.format(nowTime));
//년월일 까지 출력되니까 시간이랑 분까지 출력하도록 하고 
// String nowdate = sf.format(nowTime); 이런식으로 변수에 대입하시고
//comments regtime여따가 다시 대입해주셔야해요
//하는방법은 Comments comments = commentsDao.getComments(request, nowdate);
//nowdate까지 같이넘겨주시고 해당 메소드가셔서 



//마지막으로 인덱스 생성하시면 포워딩 작업 해주시고 Form이랑 Proc나눠서 하셔야돼용 

	request.setCharacterEncoding("UTF-8");
	out.print(request.getParameter("commentcontents"));
	
	CommentsDAO commentsDao = new CommentsDAO();
	Connection conn = commentsDao.getConn();
/*  	int commentsID = commentsDao.getAI(conn, "comments"); */
 	Comments comments = commentsDao.getComments(request);
	commentsDao.Insert(conn, comments);
	int comNum = 1;
	List<Comments> lst = commentsDao.getCommentsList(conn, comNum);
	session.setAttribute("commentsLst", lst);
	
	
	// 해야될거
%>
<%-- <jsp:forward page="/index.jsp">
<jsp:param value="all" name="currentPage"/>
</jsp:forward> --%>