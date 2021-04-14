package com.jjj.comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class CommentsDAO {
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
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
		String sql = "select nvl(max(commentsid), 0)+1 from " + tn;
		int maxNum = 0;
		try {
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

	public int Insert(Connection conn, Comments comments) {
		int getAI = getAI(getConn(), "Comments");
		
		String sql = "INSERT INTO comments (commentsID, contentsID, myMemberID, reply, regTime) " +
		"VALUES ("+getAI+", ?, ?, ?, sysdate)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, comments.getContentsid()); 
			pstmt.setInt(2,	comments.getMymemberid()); 
			pstmt.setString(3, comments.getReply());
			 
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	  public Comments getComments(HttpServletRequest request) {
	Comments comments =	  new Comments();
	  
	  comments.setContentsid(1122);
	  comments.setMymemberid(2233);
	  comments.setReply("3334");
	  
	  return comments; 
	  }
	  
	public List<Comments> getCommentsList(Connection conn){
		String sql  ="select commentsid, contentsid,mymemberid,regtime,reply from comments";
		List<Comments> lst = new ArrayList<Comments>();
		System.out.print("11");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Comments comments = new Comments();
				comments.setCommentsid(rs.getInt(1));
				comments.setContentsid(rs.getInt(2));
				comments.setMymemberid(rs.getInt(3));
				comments.setReply(rs.getString(4));
				comments.setRegtime(rs.getString(5));
				lst.add(comments);
				
			}
			System.out.print(lst);
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
}
