package com.xzlcPT.bean;

import java.util.Date;
//简历投递
public class XzPostionSend {
    private Long sendId;

    private Long resumeId;

    private Long companyId;

    private Long postionId;

    private Date sendTime;

    private Integer sendState;

    private String sendMsg;

    private Date createTime;

    private Date deleteTime;

    private String field1;

    private String field2;

    private String field3;

    private Date deleteFalt;

    public Long getSendId() {
        return sendId;
    }

    public void setSendId(Long sendId) {
        this.sendId = sendId;
    }

    public Long getResumeId() {
        return resumeId;
    }

    public void setResumeId(Long resumeId) {
        this.resumeId = resumeId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getPostionId() {
        return postionId;
    }

    public void setPostionId(Long postionId) {
        this.postionId = postionId;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Integer getSendState() {
        return sendState;
    }

    public void setSendState(Integer sendState) {
        this.sendState = sendState;
    }

    public String getSendMsg() {
        return sendMsg;
    }

    public void setSendMsg(String sendMsg) {
        this.sendMsg = sendMsg == null ? null : sendMsg.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    public String getField1() {
        return field1;
    }

    public void setField1(String field1) {
        this.field1 = field1 == null ? null : field1.trim();
    }

    public String getField2() {
        return field2;
    }

    public void setField2(String field2) {
        this.field2 = field2 == null ? null : field2.trim();
    }

    public String getField3() {
        return field3;
    }

    public void setField3(String field3) {
        this.field3 = field3 == null ? null : field3.trim();
    }

    public Date getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(Date deleteFalt) {
        this.deleteFalt = deleteFalt;
    }
}