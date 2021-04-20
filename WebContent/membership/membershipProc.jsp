<!-- memberProc.jsp -->
<%@page import="com.jjj.membership.Mymember"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.membership.MembershipDAO"%>
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
	
	String pagePath = "memberForm";

%>
<jsp:forward page="/index.jsp">
<jsp:param value="memberForm" name="currentPage"/>
</jsp:forward>