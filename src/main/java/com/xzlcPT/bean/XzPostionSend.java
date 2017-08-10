package com.xzlcPT.bean;

import java.util.Date;
import java.util.List;

public class XzPostionSend {
    private Long sendId;

    private Long resumeId;

    private Long companyId;

    private Long postionId;

    private Date sendTime;

    private Integer sendState;

    private Integer sendVisual;

    private String sendMsg;

    private Date sendTime1;

    private Date rsTime1;

    private Integer sendType;

    private Date createTime;

    private Date deleteTime;

    private String field1;

    private String field2;

    private String field3;

    private int deleteFalt;

    private Date interviewTime;

    private String pmsgValue;

    private Integer ct;

    private List<XzResume> resumes;

    private List<XzResumeEducation> xzResumeEducations;

    private String postionName;

    public Integer getCt() {
        return ct;
    }

    public void setCt(Integer ct) {
        this.ct = ct;
    }

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

    public Integer getSendVisual() {
        return sendVisual;
    }

    public void setSendVisual(Integer sendVisual) {
        this.sendVisual = sendVisual;
    }

    public String getSendMsg() {
        return sendMsg;
    }

    public void setSendMsg(String sendMsg) {
        this.sendMsg = sendMsg == null ? null : sendMsg.trim();
    }

    public Date getSendTime1() {
        return sendTime1;
    }

    public void setSendTime1(Date sendTime1) {
        this.sendTime1 = sendTime1;
    }

    public Date getRsTime1() {
        return rsTime1;
    }

    public void setRsTime1(Date rsTime1) {
        this.rsTime1 = rsTime1;
    }

    public Integer getSendType() {
        return sendType;
    }

    public void setSendType(Integer sendType) {
        this.sendType = sendType;
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

    public void setDeleteFalt(int deleteFalt) {
        this.deleteFalt = deleteFalt;
    }

    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setPostionName(String postionName) {
        this.postionName = postionName;
    }

    public String getPostionName() {
        return postionName;
    }

    public void setResumes(List<XzResume> resumes) {
        this.resumes = resumes;
    }

    public List<XzResume> getResumes() {
        return resumes;
    }

    public void setXzResumeEducations(List<XzResumeEducation> xzResumeEducations) {
        this.xzResumeEducations = xzResumeEducations;
    }

    public List<XzResumeEducation> getXzResumeEducations() {
        return xzResumeEducations;
    }

    public void setInterviewTime(Date interviewTime) {
        this.interviewTime = interviewTime;
    }

    public Date getInterviewTime() {
        return interviewTime;
    }

    public void setPmsgValue(String pmsgValue) {
        this.pmsgValue = pmsgValue;
    }

    public String getPmsgValue() {
        return pmsgValue;
    }
}