package com.jjj.likes;

//좋아요 
public class Likes {

 // 좋아요 번호 
 private Integer likesid;
 // 게시물 번호 
 private Integer contentsid;
 // 회원번호 
 private Integer mymemberid;
 // 공감 등록 시간 
 private String regtime;

 public Integer getLikesid() {
     return likesid;
 }

 public void setLikesid(Integer likesid) {
     this.likesid = likesid;
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

 public String getRegtime() {
     return regtime;
 }

 public void setRegtime(String regtime) {
     this.regtime = regtime;
 }

 // Likes 모델 복사
 public void CopyData(Likes param)
 {
     this.likesid = param.getLikesid();
     this.contentsid = param.getContentsid();
     this.mymemberid = param.getMymemberid();
     this.regtime = param.getRegtime();
 }
}