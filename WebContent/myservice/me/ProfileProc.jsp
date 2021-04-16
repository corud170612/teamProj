<%@page import="com.jjj.DTO.AttachFile"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.Contents.FileuploadDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	AttachFile attachFile = new AttachFile();
	FileuploadDAO fileuploadDAO = new FileuploadDAO();
Connection conn = fileuploadDAO.getConn();
	fileuploadDAO.getMultiReq(request); 
 attachFile = fileuploadDAO.getAttachFile(request, attachFile);
	int result = fileuploadDAO.mem(conn, 123);
	String sql = fileuploadDAO.takePic(conn, result);
	fileuploadDAO.Insert(conn, attachFile, sql);
	
%>
db저장 했쑴 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 코드좀 보고올게아
아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ