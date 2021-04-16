<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.login.LoginDAO"%>
<%@page import="com.jjj.login.Login"%>
<%@page import="com.jjj.membership.Mymember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Login login = new Login();
	login.setEmail(request.getParameter("email"));
	login.setPw(request.getParameter("pw"));
	
	LoginDAO loginDao = new LoginDAO();
	Connection conn = loginDao.getConn();
	
	Mymember mymember = new Mymember();
	mymember = loginDao.LoginProc(conn, login);
	String filePath = "../top.jsp";
	if(mymember == null) {
		session.setAttribute("YN","N");
	} else {
		session.setAttribute("YN","Y");
		session.setAttribute("userName", mymember.getUsername());
		session.setAttribute("mymemberId", mymember.getMymemberid());
		session.setAttribute("userMbti", mymember.getMbti());
	}

	
%>
<jsp:forward page="../index.jsp">
<jsp:param value="<%=filePath %>" name="currentPage"/>
</jsp:forward>

    