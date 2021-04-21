package com.jjj.likes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jjj.DTO.Contents;
import com.jjj.comment.Comments;

public class LikesDAO {
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "c##jjj";
		String pass = "jjj123";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	
	  public int getAI(Connection conn, String tn) { 

	  String sql = "select nvl(max(likesNum), 0)+1 from " + tn; 
	  int maxNum = 0; 
	  try
	  { 
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  ResultSet rs = pstmt.executeQuery(); 
	  if (rs.next()) 
		  maxNum = rs.getInt(1);
	  rs.close(); 
	  pstmt.close(); 
	  } catch (SQLException e) { 
		  e.printStackTrace(); 
	  }
	  return maxNum; 
	  }
	 

	
	  public Likes getLikes(HttpServletRequest request, int contentsid) {

		  Likes likes = new Likes(); 
		  likes.setContentsid(contentsid); 
		  likes.setLikesSum(setLikesNum(getConn(),contentsid));

		  return likes; 
	  }
	 
	  
	   public int Insert(Connection conn, Contents contents) {
		      String sql = "INSERT INTO likes (contentsID, LikesSum) " +
		      "VALUES (?, 0)";

		      try {
		         PreparedStatement pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setInt(1, contents.getContentsid()); 
		         
		         pstmt.executeUpdate();
		         pstmt.close();
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      
		      return 0;
		   }
	  

	  public int setLikesNum(Connection conn, int contentsid) {
	      //醫뗭븘 슂踰덊샇  옄 룞利앷   깮 꽦 硫붿냼 뱶
	      String sql = "UPDATE likes SET likessum =likessum+1 "
	      		+ "WHERE contentsid=?";
	      
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, contentsid);
	         
	         pstmt.executeUpdate();

	         pstmt.close();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return 0;
	   }
	  
      public int setLikesSum(Connection conn, int contentsid){
          String sql="select likessum from likes "
          		+ "where contentsid=?";

          int likesSum = 0;
          try {
             PreparedStatement pstmt = conn.prepareStatement(sql);
             pstmt.setInt(1, contentsid);
             
             ResultSet rs = pstmt.executeQuery();
             if(rs.next()) {

            	 likesSum=rs.getInt(1);
                
             }

             rs.close();
             pstmt.close();
          } catch (SQLException e) {         e.printStackTrace();      }
          
          return likesSum;
       }
	  
      public List<Likes> getLikesList(Connection conn, int contentsid){
          String sql="select * from likes "
          		+ "where contentsid=? ";
          List<Likes> lst = new ArrayList<Likes>();

          try {
             PreparedStatement pstmt = conn.prepareStatement(sql);
             pstmt.setInt(1, contentsid);
             ResultSet rs = pstmt.executeQuery();
             while(rs.next()) {
            	 Likes likes = new Likes();
            	 likes.setContentsid(rs.getInt(1));
            	 likes.setLikesSum(rs.getInt(2));
                lst.add(likes);
                
             }

             rs.close();
             pstmt.close();
          } catch (SQLException e) {         e.printStackTrace();      }
          
          return lst;
       }
	  
		/*
		 * public void Update(Connection conn, int contentsid) { String selectSql
		 * ="SELECT likesNum FROM Likes WHERE contentsid=?"; String deleteSql
		 * ="DELETE FROM Likes WHERE contentsid=?"; String insertSql
		 * ="INSERT INTO Likes VALUES(?, ?)";
		 * 
		 * 
		 * try { PreparedStatement pstmt = conn.prepareStatement(selectSql);
		 * pstmt.setInt(1, contentsid); ResultSet rs = pstmt.executeQuery(); int
		 * likesNum=1; if(rs.next()) likesNum=rs.getInt(1)+1; rs.close(); pstmt.close();
		 * 
		 * pstmt = conn.prepareStatement(deleteSql); pstmt.setInt(1, contentsid);
		 * pstmt.executeUpdate(); pstmt.close();
		 * 
		 * pstmt = conn.prepareStatement(insertSql); pstmt.setInt(1, contentsid);
		 * pstmt.setInt(2, likesNum); pstmt.executeUpdate(); pstmt.close(); } catch
		 * (SQLException e) { e.printStackTrace(); } }
		 */
	
	/*
	 * public int Update(Connection conn, Likes likes, int contentsid) { // 醫뗭븘�슂
	 * �겢由��떆 db���옣 �븯�뒗 硫붿냼�뱶 String sql =
	 * "UPDATE likes SET likesnum = likesnum +1 " + "WHERE contentsid = ?";
	 * 
	 * try { PreparedStatement pstmt = conn.prepareStatement(sql);
	 * pstmt.setInt(1,contentsid);
	 * 
	 * pstmt.setInt(1, likes.getLikesnum()); pstmt.setInt(2, likes.getContentsid());
	 * pstmt.setInt(3, likes.getMymemberid()); pstmt.setString(4,
	 * likes.getRegtime());
	 * 
	 * pstmt.executeUpdate(); pstmt.close(); } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); }
	 * 
	 * return 0; }
	 */

	
	/*
	 * public int Update(Connection conn, int contentsid) { PreparedStatement pstmt
	 * = null; try { String sql = "UPDATE likes SET likesnum = likesnum +1 " +
	 * "WHERE contentsid = ?";
	 * 
	 * pstmt = conn.prepareStatement(sql); pstmt.setInt(1,contentsid); return
	 * pstmt.executeUpdate();
	 * 
	 * } catch(Exception e) { e.printStackTrace();
	 * 
	 * } finally { try { if(pstmt != null) pstmt.close(); if(conn != null)
	 * conn.close(); } catch (Exception e) { e.printStackTrace(); } } return -1; }
	 * 
	 * public int Insert(Connection conn, Likes likes) { String sql =
	 * "INSERT INTO likes (likesNum, contentsID, myMemberID, regTime) " +
	 * "VALUES (?, ?, ?, ?)";
	 * 
	 * try { PreparedStatement pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, likes.getLikesnum()); pstmt.setInt(2, likes.getContentsid());
	 * pstmt.setInt(3, likes.getMymemberid()); pstmt.setString(4,
	 * likes.getRegtime());
	 * 
	 * pstmt.executeUpdate(); pstmt.close(); } catch (SQLException e) {
	 * e.printStackTrace(); }
	 * 
	 * return -1; }
	 */
	  
	 
}
