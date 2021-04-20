d<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.jjj.Contents.ContentsWriteDAO"%>
<%@page import="com.jjj.DTO.Contents"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int myMemberId=2;
	if(session.getAttribute("myMemberId")!=null) {
		myMemberId=(Integer)session.getAttribute("myMemberId");
	 }
	
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");
	String today = sf.format(now);

	String content = request.getParameter("contents");
	System.out.println(content+"&&&&&&&&&&&&");
	
	ContentsWriteDAO contentsDao = new ContentsWriteDAO();
	Connection conn = contentsDao.getConn();
	Contents contents = contentsDao.getContents(request, today, content, myMemberId);
	contentsDao.Insert(conn, contents);

%>
<jsp:forward page="../index.jsp">
<jsp:param value="all" name="currentPage"/>
</jsp:forward>