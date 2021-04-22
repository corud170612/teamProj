package com.jjj.Contents;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jjj.DTO.AttachFile;
import com.jjj.DTO.Contents;
import com.jjj.comment.Comments;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileuploadDAO { ////

   private MultipartRequest multiReq;
      public Connection getConn() {
        String url="jdbc:oracle:thin:@localhost:1521:xe";
         String usr = "c##jjj";
         String pass= "jjj123";
         Connection conn = null;
         try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn= DriverManager.getConnection(url, usr, pass);
         } catch (Exception e) {   e.printStackTrace();   }
         
         return conn;
      }
      
      public void getMultiReq(HttpServletRequest request) { 
            String uploadFilePath = request.getServletContext().getRealPath("myMemberProfilePhoto");
            
            System.out.println("===uploadFilePath==" + uploadFilePath + "=====");
            int maxSize = 1024*1024*10;
            try {
            multiReq = new MultipartRequest(request, uploadFilePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
            
            } catch (IOException e) {   e.printStackTrace();   }
            
           }
      
      public AttachFile getAttachFile(HttpServletRequest request, AttachFile attachFile, int mymemberId) {
            AttachFile af = new AttachFile();
            //getConn();
//            System.out.println("오리지널 파일네임 1 : " + multiReq.getOriginalFileName("myProfilePhoto"));
            //System.out.println("files : " + multiReq.getFileNames() + "===="); 
              //System.out.println(multiReq.getFileNames() + "getNultiReq"); 
            //System.out.println(multiReq.getFilesystemName("uploadFile")); ////
            //System.out.println(multiReq.getOriginalFileName("myProfilePhoto")+ "==전==");
            getMultiReq(request); 
            //System.out.println("11111111111111111111111111111111111111111111111111111111111111111111");
            //System.out.println(multiReq.getFilesystemName("uploadFile")); // null 값 출력
            //System.out.println("22222222222222222222222222222222222222222222222222222222222222222222");
            //System.out.println(multiReq.getOriginalFileName("myProfilePhoto")+ "==후=="); // 선택한 사진 이름 출력
            //System.out.println("33333333333333333333333333333333333333333333333333333333333333333333");

//            System.out.println(multiReq.toString()); // 출력 
           // System.out.println("=======================================================================");
            //String uploadFilePath = request.getServletContext().getRealPath("myMemberProfilePhoto");
            //System.out.println(request.getContextPath()+"/myMemberProfilePhoto/" + uploadFilePath);
            af.setMymemberid(mymemberId); //af.getMymmemberid 

            af.setAttachedfile1(multiReq.getOriginalFileName("myProfilePhoto"));
            //System.out.println("1111111111"+multiReq.getOriginalFileName("myProfilePhoto")+"1111111111");
            
           af.setFilepath1(multiReq.getFilesystemName("myProfilePhoto")); 
            //af.setFilepath1(request.getServletContext().getRealPath("myProfilePhoto"));
            //System.out.println("1111111111"+multiReq.getFilesystemName("myProfilePhoto")+"1111111111");

            
            af.setAttachedfile2(multiReq.getOriginalFileName("myCoverPhoto"));
            //System.out.println("1111111111"+multiReq.getOriginalFileName("myCoverPhoto")+"1111111111");

            
            af.setFilepath2(request.getServletContext().getRealPath("myMemberProfilePhoto"));
            //System.out.println("1111111111"+request.getServletContext().getRealPath("myMemberProfilePhoto")+"1111111111");

            
            HttpSession session = request.getSession();
            session.setAttribute("af", af);
            return af;
         }
      
	   public int Insert(Connection conn2, AttachFile attachFile, int mymemberId) {
		      String sql = "INSERT INTO upload (mymemberid, attachedfile1, filepath1, attachedfile2, filepath2) "
		      		+ "VALUES (?,null,null,null,null)";
		      
		      try {
		         PreparedStatement pstmt = conn2.prepareStatement(sql);
		         
		         pstmt.setInt(1, mymemberId); 
		         
		         pstmt.executeUpdate();
		         pstmt.close();
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      
		      return 0;
		   }
      
      public String takePic(Connection conn, int result) {
         String insertSql = "INSERT INTO upload (mymemberid, attachedFile1, filepath1, attachedFile2,  filepath2) "
                  + "VALUES(?, ?,  ?,  ?, ?)";
         String updateSql = "UPDATE upload SET "
                  + "    mymemberid = ?, "
                  + "    attachedFile1 = ?, "
                  + "    filepath1 = ?, "
                  + "    attachedFile2 = ?, "
                  + "    filepath2 = ? "
                  + "WHERE myMemberID ="+result;
         String sql="";
         if(result == 0) {
         sql = insertSql;
         }
         else if (result !=0) {
         sql = updateSql;
         }
         return sql;
      }   
      
      public String getProfilephoto(Connection conn, int memberId) {
          String memaql = "SELECT profilephoto FROM mymember " +
                         "where mymemberid=  ?";
         String result="";
          try {
          PreparedStatement pstmt = conn.prepareStatement(memaql);
          pstmt.setInt(1, memberId);
          ResultSet rs = pstmt.executeQuery();

          if(rs.next()) {
             result =rs.getString(1);
          }
          
          rs.close();
          pstmt.close();
          } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }
       return result;
    
       }
      
      public String getCoverphoto(Connection conn, int memberId) {
          String memaql = "SELECT coverphoto FROM mymember " +
                         "where mymemberid=  ?";
         String result="";
          try {
          PreparedStatement pstmt = conn.prepareStatement(memaql);
          pstmt.setInt(1, memberId);
          ResultSet rs = pstmt.executeQuery();

          if(rs.next()) {
             result =rs.getString(1);
          }
          
          rs.close();
          pstmt.close();
          } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }
       return result;
    
       }
      
      public int mem (Connection conn, int memberId) {
         String memaql = "SELECT mymemberId FROM upload " +
                        "where mymemberid=  ?";
         int result=0;
         try {
         PreparedStatement pstmt = conn.prepareStatement(memaql);
         pstmt.setInt(1, memberId);
         ResultSet rs = pstmt.executeQuery();

         if(rs.next()) {
            result =rs.getInt(1);
         }
         
         rs.close();
         pstmt.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      return result;
   
      }
      
      public int Insert(Connection conn, AttachFile attachFile, String modifySql) {
            //System.out.println(attachFile.getAttachedfile1());
            //System.out.println(attachFile.getAttachedfile2());
            //System.out.println(attachFile.getFilepath1());
            //System.out.println(attachFile.getFilepath2());
            
            String sql = modifySql;

            try {
               PreparedStatement pstmt = conn.prepareStatement(sql);

               pstmt.setInt(1, attachFile.getMymemberid());
               pstmt.setString(2, attachFile.getAttachedfile1());
               pstmt.setString(3, attachFile.getFilepath1());
               pstmt.setString(4, attachFile.getAttachedfile2());
               pstmt.setString(5, attachFile.getFilepath2());
                
               pstmt.executeUpdate();
               pstmt.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }

            return 0;
         }
}