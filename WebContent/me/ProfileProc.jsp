<%@page import="com.jjj.DTO.AttachFile"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.Contents.FileuploadDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   AttachFile attachFile = new AttachFile(); // 
   FileuploadDAO fileuploadDAO = new FileuploadDAO();
    Connection conn = fileuploadDAO.getConn();
   //fileuploadDAO.getMultiReq(request); 
   //System.out.println("여기는 몇번째?");
   attachFile = fileuploadDAO.getAttachFile(request, attachFile);

   int result = fileuploadDAO.mem(conn, 123);
   String sql = fileuploadDAO.takePic(conn, result);
   fileuploadDAO.Insert(conn, attachFile, sql);
   //System.out.print("파일 경로 : " + attachFile + "<br/>"); 

   //String uploadFilePath = request.getServletContext().getRealPath("myMemberProfilePhoto");

   
/*       System.out.print("파일 경로 : " + uploadFilePath + "<br/>"); 
      System.out.print("파일1 : " +attachFile.getAttachedfile1()); 
      System.out.print("파일2 : " +attachFile.getAttachedfile2()); 
      System.out.print("파일1 : " +attachFile.getFilepath1());
      System.out.print("파일2 : " +attachFile.getFilepath2()); */

%>
<jsp:forward page="../index.jsp">
<jsp:param value="me" name="currentPage"/>
</jsp:forward>