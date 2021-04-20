package com.jjj.likes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

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
		//醫뗭븘�슂踰덊샇 �옄�룞利앷� �깮�꽦 硫붿냼�뱶
		String sql = "select nvl(max(likesID), 0)+1 from " + tn;
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
	
	public int Insert(Connection conn, Likes likes) {
		//醫뗭븘�슂 �겢由��떆 db���옣 �븯�뒗 硫붿냼�뱶
		String sql = "INSERT INTO likes (likesID, contentsID, myMemberID, regTime) "
				+ "VALUES (?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, likes.getLikesid()); 
			pstmt.setInt(2, likes.getContentsid()); 
			pstmt.setInt(3,	likes.getMymemberid()); 
			pstmt.setString(4, likes.getRegtime());
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	public Likes getLikes(HttpServletRequest request, String nowdate, int contentsid, int myMemberID) {
		 //likes (DTO) 蹂��닔�븷 set硫붿냼�뱶 �궗�슜�빐�꽌 媛� 吏��젙�빐二쇰뒗 硫붿냼�뱶
	Likes likes = new Likes();
	likes.setLikesid(getAI(getConn(), "Likes"));
	likes.setContentsid(contentsid);
	likes.setMymemberid(myMemberID);
	likes.setRegtime(nowdate);
	  
	return likes; 
	}
	
	public int getLikesNum(Connection conn, int contentsid) {
		//醫뗭븘�슂踰덊샇 �옄�룞利앷� �깮�꽦 硫붿냼�뱶
		String sql = "select count(*) "
				+ "from likes l , contents c "
				+ "where c.contentsid=l.contentsid "
				+ "and c.contentsid = ?";
		
		int likesNum = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contentsid);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				likesNum = rs.getInt(1);
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return likesNum;
	}
}
