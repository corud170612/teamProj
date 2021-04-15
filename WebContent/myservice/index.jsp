<!-- myservice/index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String currentPage = request.getParameter("currentPage");
	String pageName = "./membership/memberForm.jsp";
	if(currentPage==null)
		pageName = "./membership/memberForm.jsp";
	else if("home".contentEquals(currentPage))
		pageName = "./membership/memberForm.jsp";
   	else if("commentProc".contentEquals(currentPage))
	    pageName = "./all/all.jsp";
    else if("ContentsForm".contentEquals(currentPage))
        pageName = "/me/me.jsp";
%>

<!DOCTYPE html>
<html>
<body>
<head>
	<%@ include file="./common/header.jspf" %>
<header>
	<%@ include file="./common/top.jsp" %>
</header>
<!-- container -->
	<jsp:include page="<%=pageName%>"/>
<footer>
	<%@ include file="./common/footer.jspf" %>
</footer>
</body>
</html>