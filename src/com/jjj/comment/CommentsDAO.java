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
      // 뙎湲 踰덊샇  옄 룞利앷   깮 꽦 硫붿냼 뱶
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
      // 뙎湲   옉 꽦 떆 db   옣  븯 뒗 硫붿냼 뱶
      String sql = "INSERT INTO comments (commentsID, contentsID, myMemberID, reply, regTime) " +
      "VALUES (?, ?, ?, ?, ?)";

      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, comments.getCommentsid()); 
         pstmt.setInt(2, comments.getContentsid()); 
         pstmt.setInt(3,   comments.getMymemberid()); 
         pstmt.setString(4, comments.getReply());
         pstmt.setString(5, comments.getRegtime());
         
         pstmt.executeUpdate();
         pstmt.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return 0;
   }

   public Comments getComments(HttpServletRequest request, String nowdate, String reply, int contentsid, int myMemberID) {
      System.out.println("용용");
   Comments comments =   new Comments();
   comments.setCommentsid(getAI(getConn(), "Comments"));
   comments.setContentsid(contentsid);
      System.out.println(contentsid);
   comments.setMymemberid(myMemberID);
      System.out.println(myMemberID);
   comments.setReply(reply);
   System.out.println(reply);
   comments.setRegtime(nowdate);
   System.out.println(nowdate);
     
   return comments; 
   }
   
      public List<Comments> getCommentsList(Connection conn, int contentsNo){
         //  뙎湲 紐⑸줉 異쒕젰 븯 뒗 硫붿냼 뱶 (List濡  諛섑솚 떆 궡)
         //String sql  ="select m.commentsid,m.mymemberid,m.reply,m.regtime,m.contentsid "
         //      + "from contents n, comments m ";
         
         
         String sql="select m.commentsid,m.mymemberid,m.reply,m.regtime,m.contentsid "
               + "from contents n, comments m "
               + "where n.contentsid=m.contentsid "
               + "and n.contentsid=?";
         List<Comments> lst = new ArrayList<Comments>();

         try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, contentsNo);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
               Comments comments = new Comments();
               comments.setCommentsid(rs.getInt(1));
               comments.setMymemberid(rs.getInt(2));
               comments.setReply(rs.getString(3));
               comments.setRegtime(rs.getString(4));
               comments.setContentsid(rs.getInt(5));
               lst.add(comments);
               
            }

            rs.close();
            pstmt.close();
         } catch (SQLException e) {         e.printStackTrace();      }
         
         return lst;
      }
      
      
}
