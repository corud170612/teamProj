d<%@page import="com.jjj.likes.LikesDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.jjj.Contents.ContentsWriteDAO"%>
<%@page import="com.jjj.DTO.Contents"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int mymemberId = 0;
	if(session.getAttribute("mymemberId")!=null) {
		mymemberId=(Integer)session.getAttribute("mymemberId");
	 }
	System.out.println(mymemberId+"회원번호임.");
	
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");
	String today = sf.format(now);

	String content = request.getParameter("contents");
	System.out.println(content+"&&&&&&&&&&&&");
	
	ContentsWriteDAO contentsDao = new ContentsWriteDAO();
	Connection conn = contentsDao.getConn();
	Contents contents = contentsDao.getContents(request, today, content, mymemberId);
	contentsDao.Insert(conn, contents);
	
	
	
	LikesDAO likesDao = new LikesDAO();
	Connection conn2 = likesDao.getConn();
    likesDao.Insert(conn2, contents);
%>
<jsp:forward page="../index.jsp">
<jsp:param value="ESTP" name="currentPage"/>
</jsp:forward>