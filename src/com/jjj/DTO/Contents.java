package com.jjj.DTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Contents implements Serializable{

    private Integer contentsid;

    private Integer mymemberid;

    private String content;

    private String regtime;
    
    private Integer likesSum;

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

	public Integer getLikesSum() {
		return likesSum;
	}

	public void setLikesSum(Integer likesSum) {
		this.likesSum = likesSum;
	}
}