package com.jjj.membership;
//멤버쉽 
public class Mymember {

 // 회원번호 
 private Integer mymemberid;

 // 이름 
 private String username;

 // 이메일 
 private String email;

 // 비밀번호 
 private String pw;

 // 성별 
 private String gender;

 // MBTI 
 private String mbti;
 
 // 프로필사진 
 private String profilePhoto;

 // 커버사진 
 private String coverPhoto;

 public String getProfilePhoto() {
	return profilePhoto;
}

public void setProfilePhoto(String profilePhoto) {
	this.profilePhoto = profilePhoto;
}

public String getCoverPhoto() {
	return coverPhoto;
}

public void setCoverPhoto(String coverPhoto) {
	this.coverPhoto = coverPhoto;
}

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

 public String getGender() {
     return gender;
 }

 public void setGender(String gender) {
     this.gender = gender;
 }

 public String getMbti() {
     return mbti;
 }

 public void setMbti(String mbti) {
     this.mbti = mbti;
 }

 // Mymember 모델 복사
 public void CopyData(Mymember param)
 {
     this.mymemberid = param.getMymemberid();
     this.username = param.getUsername();
     this.email = param.getEmail();
     this.pw = param.getPw();
     this.gender = param.getGender();
     this.mbti = param.getMbti();
 }
}