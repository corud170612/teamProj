package com.jjj.comment;

import java.io.Serializable;
import java.sql.Date;

//댓글 
@SuppressWarnings("serial")
public class Comments implements Serializable{

 // 댓글 번호 
 private Integer commentsid;

 // 게시물 번호 
 private Integer contentsid;

 // 회원번호 
 private Integer mymemberid;

 // 댓글 내용 
 private String reply;

 // 댓글 등록 시간 
 private String regtime;
 
 // 댓글 유저 이름
 private String userName;
 
 public Integer getCommentsid() {
     return commentsid;
 }

 public void setCommentsid(Integer commentsid) {
     this.commentsid = commentsid;
 }

 public Integer getContentsid() {
     return contentsid;
 }

 public void setContentsid(Integer contentsid) {
     this.contentsid = contentsid;
 }

 public Integer getMymemberid() {
     return mymemberid;
 }

 public void setMymemberid(Integer mymemberid) {
     this.mymemberid = mymemberid;
 }

 public String getReply() {
     return reply;
 }

 public void setReply(String reply) {
     this.reply = reply;
 }

 public String getRegtime() {
     return regtime;
 }

 public void setRegtime(String regtime) {
     this.regtime = regtime;
 }

 public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

// Comments 모델 복사
 public void CopyData(Comments param)
 {
     this.commentsid = param.getCommentsid();
     this.contentsid = param.getContentsid();
     this.mymemberid = param.getMymemberid();
     this.reply = param.getReply();
     this.regtime = param.getRegtime();
 }
}