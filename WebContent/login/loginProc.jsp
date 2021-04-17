<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.login.LoginDAO"%>
<%@page import="com.jjj.login.Login"%>
<%@page import="com.jjj.membership.Mymember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pw = request.getParameter("pw");
	Login login = new Login();
	login.setEmail(request.getParameter("email"));
	login.setPw(pw);
	
	String type = "login";
	if (pw.equals("0")) {
		type = "kakao";
	}
	
	LoginDAO loginDao = new LoginDAO();
	Connection conn = loginDao.getConn();
	
	Mymember mymember = new Mymember();
	mymember = loginDao.LoginProc(conn, login);
	
	String filePath = request.getContextPath() + "/top.jsp";
	if (mymember.getEmail() == null) {
		session.setAttribute("YN", "N");
	} else {
		if (type.equals("login")) {
			if (mymember.getPw().equals(pw)) {
				session.setAttribute("YN", "Y");
				session.setAttribute("userName", mymember.getUsername());
				session.setAttribute("mymemberId", mymember.getMymemberid());
				session.setAttribute("userMbti", mymember.getMbti());
			}
		} else if (type.equals("kakao")) {
			session.setAttribute("YN", "Y");
			session.setAttribute("userName", mymember.getUsername());
			session.setAttribute("mymemberId", mymember.getMymemberid());
			session.setAttribute("userMbti", mymember.getMbti());
		}
	}
%>
<jsp:forward page="../index.jsp">
	<jsp:param value="loginProc" name="currentPage" />
</jsp:forward>

