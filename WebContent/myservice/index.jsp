<!-- myservice/index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
   String currentPage = request.getParameter("currentPage");
    String path = request.getContextPath()+"/myservice";
    String pageName = "/membership/memberForm.jsp";
    String bodyPage = path+pageName;
    if(currentPage==null)
      pageName = path+"/membership/memberForm.jsp";
   else if("home".contentEquals(currentPage))
      pageName = "./membership/memberForm.jsp";
   else if("memberForm".contentEquals(currentPage))
      pageName = path+"/membership/memberForm.jsp";
    else if("ContentsProc".contentEquals(currentPage))
        pageName = path+"/me/me.jsp";
   else if("commentProc".contentEquals(currentPage))
   		pageName = path+"/all/all.jsp";
    else if("likesProc".contentEquals(currentPage))
        pageName = path+"/all/all.jsp";
%>

<!DOCTYPE html>
<html>

<header>
   <%@ include file="/myservice/top.jsp" %>
</header>
<body>
<!-- container -->
   <jsp:include page="/myservice/membership/memberForm.jsp"/>
<footer>
   <%@ include file="/myservice/footer.jspf" %>
</footer>
</body>
</html>