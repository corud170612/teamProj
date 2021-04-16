<!-- myservice/index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
   String currentPage = request.getParameter("currentPage");
    String pageName = "/index.jsp";
    if(currentPage==null)
      pageName = "/membership/memberForm.jsp";
   else if("me".contentEquals(currentPage))
       pageName = "/me/me.jsp";
   else if("all".contentEquals(currentPage))
       pageName = "/all/all.jsp";
   else if("mbti".contentEquals(currentPage))
       pageName = "/mbti/mbti.jsp";
   else if("memberForm".contentEquals(currentPage))
      pageName = "/membership/memberForm.jsp";
   else if("commentProc".contentEquals(currentPage))
   		pageName = "/all/all.jsp";
    else if("likesProc".contentEquals(currentPage))
        pageName = "/all/all.jsp";
%>

<!DOCTYPE html>
<html>

<header>
   <%@ include file="/common/top.jsp" %>
</header>
<body>
<!-- container -->
   <jsp:include page="<%=pageName %>"/>
<footer>
   <%@ include file="/common/footer.jspf" %>
</footer>
</body>
</html>