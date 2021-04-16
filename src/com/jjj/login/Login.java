package com.jjj.login;
//로그인 
public class Login {

 // 회원번호 
 private Integer mymemberid;

 // 이름 
 private String username;

 // 이메일 
 private String email;

 // 비밀번호 
 private String pw;
 
 // MBTI 
 private String mbti;

 public Integer getMymemberid() {
     return mymemberid;
 }

 public void setMymemberid(Integer mymemberid) {
     this.mymemberid = mymemberid;
 }

 public String getUsername() {
     return username;
 }

 public void setUsername(String username) {
     this.username = username;
 }

 public String getEmail() {
     return email;
 }

 public void setEmail(String email) {
     this.email = email;
 }

 public String getPw() {
     return pw;
 }

 public void setPw(String pw) {
     this.pw = pw;
 }

 public String getMbti() {
     return mbti;
 }

 public void setMbti(String mbti) {
     this.mbti = mbti;
 }

}