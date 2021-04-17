<%@ page contentType="text/html; charset=UTF-8"%>
<%
	out.print("logout");
	session.invalidate();
%>
<jsp:forward page="../index.jsp">
	<jsp:param value="logout" name="currentPage"/>
</jsp:forward>