<!-- memberProc.jsp -->
<%@page import="com.jjj.DTO.AttachFile"%>
<%@page import="com.jjj.Contents.FileuploadDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.jjj.membership.Mymember"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.membership.MembershipDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Mymember mymember = new Mymember();
	mymember.setUsername(request.getParameter("userName"));
	System.out.print(request.getParameter("userName"));
	mymember.setEmail(request.getParameter("userEmail"));
	mymember.setPw(request.getParameter("userPw"));
	mymember.setGender(request.getParameter("gender"));
	mymember.setMbti(request.getParameter("userMbti"));	
	mymember.setProfilePhoto(request.getParameter("profilePhoto"));	
	mymember.setCoverPhoto(request.getParameter("coverPhoto"));	
	
	MembershipDAO membership = new MembershipDAO();
	Connection conn = membership.getConn();
	
	membership.Insert(conn, mymember);
	
	String pagePath = "memberForm";
	
	session.setAttribute("profilePhoto", request.getParameter("profilePhoto"));
	session.setAttribute("coverPhoto", request.getParameter("coverPhoto"));

	AttachFile attachFile = new AttachFile();
   FileuploadDAO FileuploadDao = new FileuploadDAO();
   Connection conn2 = FileuploadDao.getConn();
   int getAI = membership.getAI(conn, "MyMember");
   int mymemberId = getAI;
   FileuploadDao.Insert(conn2, attachFile, mymemberId);
%>
<jsp:forward page="/index.jsp">
<jsp:param value="memberForm" name="currentPage"/>
</jsp:forward>