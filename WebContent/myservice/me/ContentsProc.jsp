ContentsProc.jsp


<%@page import="com.jjj.Contents.ContentsWriteDAO"%>
<%@page import="com.jjj.DTO.Contents"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	out.print(request.getParameter("inputcontents"));

	ContentsWriteDAO contentsDao = new ContentsWriteDAO();
	Connection conn = contentsDao.getConn();
	//contentsDao.Insert(conn, contents);

	/* 	파일 첨부
	AttachFile attachFile = boardDao.getAttachFile(request, board.getNo());
	boardDao.Insert(conn, attachFile); */
%>
<%-- <jsp:forward page="..me/meProc.jsp">
<jsp:param value="1" name="pageNumber"/>
</jsp:forward> --%>