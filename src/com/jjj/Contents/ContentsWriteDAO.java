package com.jjj.Contents;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jjj.DTO.Contents;

public class ContentsWriteDAO {
	//private MultipartRequest multiReq; // ���Ͼ��ε�
	public Connection getConn() {
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
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
		      
		      String sql = "INSERT INTO contents (contentsid, mymemberid, content, regtime) " +
		      "VALUES (?, ?, ?, ?)";

		      try {
		         PreparedStatement pstmt = conn.prepareStatement(sql);
  
		         pstmt.setInt(1, contents.getContentsid());
		         pstmt.setInt(2, contents.getMymemberid()); 
		         pstmt.setString(3, contents.getContent());
		         pstmt.setString(4, contents.getRegtime());
		          
		         pstmt.executeUpdate();
		         pstmt.close();
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }

		      return 0;
		   }
	

	public Contents getContents(HttpServletRequest request, String today, String content, int myMemberID) {
		Contents contents = new Contents();
		contents.setContentsid(getAI(getConn(), "contents"));
		contents.setMymemberid(myMemberID);
		contents.setContent(content);
		contents.setRegtime(today);
		return contents;
	}
	
	  //�۹�ȣ
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
	

	public List<Contents> getBoardList(Connection conn, int myMemberid){
		String sql  ="select contentsid,mymemberid,content,regtime from contents "
				+ "where mymemberid = ? ";
		List<Contents> lst = new ArrayList<Contents>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, myMemberid);
			//System.out.print("*********"+myMemberid);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				Contents contents = new Contents();
				
				contents.setContentsid(rs.getInt(1));
				contents.setMymemberid(rs.getInt(2));
				contents.setContent(rs.getString(3));
				contents.setRegtime(rs.getString(4));

				lst.add(contents);
				System.out.println("======="+lst.size());
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		//System.out.println("00000"+lst.size());
		return lst;
	}
	
	/*
	  private void getMultiReq(HttpServletRequest request) { String uploadFilePath
	  = request.getServletContext().getRealPath("uploadFile"); int maxSize =
	  1024*1024*10; try { multiReq = new MultipartRequest(request, uploadFilePath,
	  maxSize, "UTF-8", new DefaultFileRenamePolicy()); } catch (IOException e) {
	  e.printStackTrace(); } }
	*/
	 
	
	/*	> ÷������
	 * public AttachFile getAttachFile(HttpServletRequest request, int fno) {
	 * AttachFile attachFile = new AttachFile(); int no = getAI(getConn(),
	 * "AttachFile"); System.out.println(no); attachFile.setNo(no); //AttachFile
	 * table�� ���� attachFile.setSystemfile(multiReq.getFilesystemName("uploadFile"));
	 * //���� ���� ���� �̸�
	 * attachFile.setOriginfile(multiReq.getOriginalFileName("uploadFile")); //���� ����
	 * �̸� attachFile.setFno(fno); //�Խñ� ��ȣ return attachFile; } public int
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

	/* ���
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
