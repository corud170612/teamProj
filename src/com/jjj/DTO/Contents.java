package com.jjj.DTO;
// �Խù� ��� 

public class Contents {

    // �Խù� ��ȣ 
    private Integer contentsid;

    // �ۼ��� ����ȣ 
    private Integer mymemberid;

    // �Խù� ���� 
    private String content;

    // ��Ͻð� 
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

    // Contents �� ����
    public void CopyData(Contents param)
    {
        this.contentsid = param.getContentsid();
        this.mymemberid = param.getMymemberid();
        this.content = param.getContent();
        this.regtime = param.getRegtime();
    }
}