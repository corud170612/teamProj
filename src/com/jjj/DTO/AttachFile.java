package com.jjj.DTO;

//���� 
public class AttachFile {

 // ����ȣ 
 private Integer mymemberid;

 // ÷������1 
 private String attachedfile1;

 // ��������1 
 private String filepath1;

 // ÷������2 
 private String attachedfile2;

 // ��������2 
 private String filepath2;

 public Integer getMymemberid() {
     return mymemberid;
 }

 public void setMymemberid(Integer mymemberid) {
     this.mymemberid = mymemberid;
 }

 public String getAttachedfile1() {
     return attachedfile1;
 }

 public void setAttachedfile1(String attachedfile1) {
     this.attachedfile1 = attachedfile1;
 }

 public String getFilepath1() {
     return filepath1;
 }

 public void setFilepath1(String filepath1) {
     this.filepath1 = filepath1;
 }

 public String getAttachedfile2() {
     return attachedfile2;
 }

 public void setAttachedfile2(String attachedfile2) {
     this.attachedfile2 = attachedfile2;
 }

 public String getFilepath2() {
     return filepath2;
 }

 public void setFilepath2(String filepath2) {
     this.filepath2 = filepath2;
 }

 // Upload �� ����
 public void CopyData(AttachFile  param)
 {
     this.mymemberid = param.getMymemberid();
     this.attachedfile1 = param.getAttachedfile1();
     this.filepath1 = param.getFilepath1();
     this.attachedfile2 = param.getAttachedfile2();
     this.filepath2 = param.getFilepath2();
 }
}