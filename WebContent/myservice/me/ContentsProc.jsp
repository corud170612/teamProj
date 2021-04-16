d<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.jjj.Contents.ContentsWriteDAO"%>
<%@page import="com.jjj.DTO.Contents"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int myMemberid=123;
	if(session.getAttribute("myMemberID")!=null) {
		myMemberid=(Integer)session.getAttribute("myMemberID");
	 }
	
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");
	String today = sf.format(now);
	
	request.setCharacterEncoding("UTF-8");
	System.out.print(request.getParameter("contents"));
	String content = request.getParameter("contents");
	
	ContentsWriteDAO contentsDao = new ContentsWriteDAO();
	Connection conn = contentsDao.getConn();
	Contents contents = contentsDao.getContents(request, today, content, myMemberid);
	contentsDao.Insert(conn, contents);
	
	List<Contents> lst = contentsDao.getBoardList(conn, myMemberid);
	
	session.setAttribute("contentsLst", lst);
	/* 	파일 첨부
	AttachFile attachFile = boardDao.getAttachFile(request, board.getNo());
	boardDao.Insert(conn, attachFile); */
%>
<jsp:forward page="../index.jsp">
<jsp:param value="ContentsForm" name="currentPage"/>
</jsp:forward>