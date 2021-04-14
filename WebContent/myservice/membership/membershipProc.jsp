<!-- memberProc.jsp -->
<%@page import="com.jjj.DTO.Mymember"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.DAO.MembershipDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Mymember mymember = new Mymember();
	mymember.setUsername(request.getParameter("userName"));
	mymember.setEmail(request.getParameter("userEmail"));
	mymember.setPw(request.getParameter("userPw"));
	mymember.setGender(request.getParameter("gender"));
	mymember.setMbti(request.getParameter("userMbti"));

	MembershipDAO membership = new MembershipDAO();
	Connection conn = membership.getConn();
	membership.Insert(conn, mymember);
	
	System.out.println("userName");
%>
<jsp:forward page="../me/me.jsp"/>
