package com.jjj.Contents;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.jjj.DTO.AttachFile;
import com.jjj.DTO.Contents;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileuploadDAO {

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
	   
	   public void getMultiReq(HttpServletRequest request) { // 파일 용량, 서버저장폴더 위치 지정메소드 
		      String uploadFilePath = request.getServletContext().getRealPath("myMemberProfilePhoto");
		      System.out.println(uploadFilePath);
		      int maxSize = 1024*1024*10;
		      try {
		      multiReq = new MultipartRequest(request, uploadFilePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		      } catch (IOException e) {   e.printStackTrace();   }
		      
		     }
	   
	   public AttachFile getAttachFile(HttpServletRequest request, AttachFile attachFile) {
		      AttachFile af = new AttachFile();
		      //서버에 저장된 파일 DTO에대입하는 메소드 
		      af.setMymemberid(123); //나중에 회원번호 사용게되면 af.getMymmemberid 넣어주심되영 
		      af.setAttachedfile1(multiReq.getOriginalFileName("myProfilePhoto"));
		      af.setFilepath1(multiReq.getFilesystemName("myProfilePhoto"));
		      af.setAttachedfile2(multiReq.getOriginalFileName("myCoverPhoto"));
		      af.setFilepath2(multiReq.getFilesystemName("myCoverPhoto"));
		      
		  
		      return af;
	      
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
		      System.out.println(attachFile.getAttachedfile1());
		      System.out.println(attachFile.getAttachedfile2());
		      System.out.println(attachFile.getFilepath1());
		      System.out.println(attachFile.getFilepath2());
		      
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
