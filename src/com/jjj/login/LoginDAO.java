package com.jjj.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jjj.membership.Mymember;

public class LoginDAO {
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
	
	public Mymember LoginProc(Connection conn, Login login) {
		Mymember mymember = new Mymember();
		String sql="select count(*) from mymember "
				+ "where email = ? "
				+ "and pw = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, login.getEmail());
			pstmt.setString(2, login.getPw());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1) > 0) {
					mymember = getLoginMember(conn, login);
				}
			}
			
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mymember;
	}
	
	public Mymember getLoginMember(Connection conn, Login login) {
		Mymember mymember = new Mymember();
		
		String sql="select * from mymember "
				+ "where email = ? "
				+ "and pw = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, login.getEmail());
			pstmt.setString(2, login.getPw());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				mymember.setMymemberid(rs.getInt(1));
				mymember.setUsername(rs.getString(2));
				mymember.setEmail(rs.getString(3));
				mymember.setPw(rs.getString(4));
				mymember.setGender(rs.getString(5));
				mymember.setMbti(rs.getString(6));
			}
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mymember;
	}
	
	
}
