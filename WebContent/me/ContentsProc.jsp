<%@page import="com.jjj.likes.LikesDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.jjj.Contents.ContentsWriteDAO"%>
<%@page import="com.jjj.DTO.Contents"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   int myMemberId=123;
   if(session.getAttribute("myMemberId")!=null) {
      myMemberId=(Integer)session.getAttribute("myMemberId");
    }
   
   Date now = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");
   String today = sf.format(now);
   
   request.setCharacterEncoding("UTF-8");
   //System.out.print(request.getParameter("contents")+"^^^^^^^^^^^^^^^^^^^^^");
   String content = request.getParameter("contents");
   
   ContentsWriteDAO contentsDao = new ContentsWriteDAO();
   Connection conn = contentsDao.getConn();
   Contents contents = contentsDao.getContents(request, today, content, myMemberId);
   //contentsDao.Insert(conn, contents);
   
   List<Contents> lst = contentsDao.getBoardList(conn, myMemberId);
   session.setAttribute("contentsLst", lst);

   LikesDAO likesDao = new LikesDAO();
   Connection conn2 = likesDao.getConn();
   likesDao.Insert(conn2, contents);
%>
<jsp:forward page="../index.jsp">
<jsp:param value="me" name="currentPage"/>
</jsp:forward>