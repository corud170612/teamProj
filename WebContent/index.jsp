<!-- myservice/index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String mbti = (String)session.getAttribute("userMbti");
	String currentPage = request.getParameter("currentPage");
    String pageName = "/index.jsp";
    if(currentPage==null)
      pageName = "/membership/memberForm.jsp";
    else if("me".contentEquals(currentPage))
       pageName = "/me/me.jsp";
    else if("all".contentEquals(currentPage))
       pageName = "/all/all.jsp";
    else if("mbti".contentEquals(currentPage))
       pageName = "/mbti/"+mbti+"/"+mbti+".jsp";
    else if("memberForm".contentEquals(currentPage))
      pageName = "/membership/memberForm.jsp";
    else if("commentProc".contentEquals(currentPage))
   		pageName = "/all/all.jsp";
    else if("likesProc".contentEquals(currentPage))
        pageName = "/all/all.jsp";
    else if("loginProc".contentEquals(currentPage))
    	if(session.getAttribute("YN")=="Y")
    		pageName = "/me/me.jsp";
    	else
    		pageName = "/membership/memberForm.jsp";
    else if("logout".contentEquals(currentPage))
        pageName = "/membership/memberForm.jsp";
    else if("allOrderbyLikesSum".contentEquals(currentPage))
        pageName = "/all/allOrderbyLikesSum.jsp";
    else if("likesProc2".contentEquals(currentPage))
        pageName = "/all/allOrderbyLikesSum.jsp";
    else if("commentProc2".contentEquals(currentPage))
        pageName = "/all/allOrderbyLikesSum.jsp";
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