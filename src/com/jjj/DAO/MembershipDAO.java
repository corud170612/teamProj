package com.jjj.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jjj.DTO.Mymember;

public class MembershipDAO {
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
	public void Insert(Connection conn, Mymember mymember) {
		String sql="INSERT INTO MyMember(mymemberid, userName, email, pw, gender, mbti) "
				+ "VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, getAI(getConn(), "MyMember"));
			pstmt.setString(2, mymember.getUsername());
			pstmt.setString(3, mymember.getEmail());
			pstmt.setString(4, mymember.getPw());
			pstmt.setString(5, mymember.getGender());
			pstmt.setString(6, mymember.getMbti());
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public int getAI(Connection conn, String tn) {
	      String sql="select nvl(max(mymemberid), 0)+1 from "+tn;
	      int maxNum=0;
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         
	         ResultSet rs = pstmt.executeQuery();
	         if(rs.next())
	            maxNum =rs.getInt(1);
	         rs.close();
	         pstmt.close();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return maxNum;
	   }
}
