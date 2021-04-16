package com.jjj.DTO;
// 게시물 등록 

public class Contents {

    // 게시물 번호 
    private Integer contentsid;

    // 작성한 고객번호 
    private Integer mymemberid;

    // 게시물 내용 
    private String content;

    // 등록시간 
    private String regtime;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRegtime() {
        return regtime;
    }

    public void setRegtime(String regtime) {
        this.regtime = regtime;
    }

    // Contents 모델 복사
    public void CopyData(Contents param)
    {
        this.contentsid = param.getContentsid();
        this.mymemberid = param.getMymemberid();
        this.content = param.getContent();
        this.regtime = param.getRegtime();
    }
}