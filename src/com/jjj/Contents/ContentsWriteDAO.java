package com.jjj.Contents;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jjj.DTO.Contents;

public class ContentsWriteDAO {
	//private MultipartRequest multiReq; // 파일업로드
	public Connection getConn() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##jjj";
		String pass="jjj123";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
		
		return conn;
	}
	   public int Insert(Connection conn, Contents contents) {
		      int getAI = getAI(getConn(), "contents");
		      
		      String sql = "INSERT INTO contents (contentsid, mymemberid, content, regtime) " +
		      "VALUES ("+getAI+", ?, ?, sysdate)";

		      try {
		         PreparedStatement pstmt = conn.prepareStatement(sql);

		         pstmt.setInt(1, 123); 
		         pstmt.setString(2, "345");   
		      
//		         pstmt.setInt(1,   contents.getMymemberid()); 
//		         pstmt.setString(2, contents.getContent());
		          
		         pstmt.executeUpdate();
		         pstmt.close();
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      
		      return 0;
		   }
	
	/*
	public Contents getContents(HttpServletRequest request) {
		Contents contents = new Contents();
		getMultiReq(request);
		board.setId( multiReq.getParameter("writer") );
		board.setTitle( multiReq.getParameter("title") );
		board.setContents( multiReq.getParameter("contents") );
		board.setNo(getAI(getConn(), "Board"));
		return board;
	}
	*/
	
	  //글번호
	public int getAI(Connection conn, String tableName) {
		String sql="select nvl(max(contentsID), 0)+1 from "+tableName;
		int maxNum=0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, tableName);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				maxNum =rs.getInt(1);
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return maxNum;
	}
	 
	
	/*
	  private void getMultiReq(HttpServletRequest request) { String uploadFilePath
	  = request.getServletContext().getRealPath("uploadFile"); int maxSize =
	  1024*1024*10; try { multiReq = new MultipartRequest(request, uploadFilePath,
	  maxSize, "UTF-8", new DefaultFileRenamePolicy()); } catch (IOException e) {
	  e.printStackTrace(); } }
	*/
	 
	
	/*	> 첨부파일
	 * public AttachFile getAttachFile(HttpServletRequest request, int fno) {
	 * AttachFile attachFile = new AttachFile(); int no = getAI(getConn(),
	 * "AttachFile"); System.out.println(no); attachFile.setNo(no); //AttachFile
	 * table의 순번 attachFile.setSystemfile(multiReq.getFilesystemName("uploadFile"));
	 * //서버 저장 파일 이름
	 * attachFile.setOriginfile(multiReq.getOriginalFileName("uploadFile")); //원본 파일
	 * 이름 attachFile.setFno(fno); //게시글 번호 return attachFile; } public int
	 * Insert(Connection conn, AttachFile attachFile) { String
	 * sql="INSERT INTO AttachFile (no, systemFile, originFile, fno) " +
	 * "VALUES (?, ?, ?, ?)";
	 * 
	 * try { PreparedStatement pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, attachFile.getNo()); pstmt.setString(2,
	 * attachFile.getSystemfile()); pstmt.setString(3, attachFile.getOriginfile());
	 * pstmt.setInt(4, attachFile.getFno());
	 * 
	 * pstmt.executeUpdate(); pstmt.close(); } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return 0; }
	 */

	/* 답글
	  public int Insert(Connection conn, int no, String pno) { String selectSql =
	  "select depth+1 from reply where no=?"; String
	  insertSql="insert into reply(no, pno, depth) values(?, ?, ?)";
	  
	  try { PreparedStatement pstmt = conn.prepareStatement(selectSql);
	  pstmt.setString(1, pno); ResultSet rs = pstmt.executeQuery(); int depth=1;
	  if(rs.next()) depth=rs.getInt(1); pstmt.close();
	  
	  pstmt = conn.prepareStatement(insertSql); pstmt.setInt(1, no);
	  pstmt.setString(2, pno); pstmt.setInt(3, depth); pstmt.executeUpdate();
	  pstmt.close(); } catch (SQLException e) { // TODO Auto-generated catch block
	  e.printStackTrace(); } return 0; }
	 */
	
	/*
	 * public String getPno(HttpServletRequest request) { return
	 * multiReq.getParameter("pno"); }
	 */
}
