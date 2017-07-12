package com.xzlcPT.bean;

import java.util.Date;
import java.util.List;

public class XzJobExp {
    private Long jobexpId;

    private Long resumeId;

    private String jobexpCompanyName;

    private String jobexpField;

    private String jobexpPostion;

    private String jobexpWorkspace;

    private Integer jobexpSubordinate;

    private Date jobexpBeginTime;

    private Date jobexpEndTime;

    private String jobexpDuty;

    private String jobexpDept;

    private String jobexpCompanyScale;

    private String jobexpCompanyType;

    private Integer jobexpMm;

    private Integer jobexpYm;

    private Date createTime;

    private Date deleteTime;

    private String filed1;

    private String filed2;

    private String filed3;

    private List<XzField> fields;

    public List<XzField> getFields() {
        return fields;
    }

    public void setFields(List<XzField> fields) {
        this.fields = fields;
    }

    public Long getJobexpId() {
        return jobexpId;
    }

    public void setJobexpId(Long jobexpId) {
        this.jobexpId = jobexpId;
    }

    public Long getResumeId() {
        return resumeId;
    }

    public void setResumeId(Long resumeId) {
        this.resumeId = resumeId;
    }

    public String getJobexpCompanyName() {
        return jobexpCompanyName;
    }

    public void setJobexpCompanyName(String jobexpCompanyName) {
        this.jobexpCompanyName = jobexpCompanyName == null ? null : jobexpCompanyName.trim();
    }

    public String getJobexpField() {
        return jobexpField;
    }

    public void setJobexpField(String jobexpField) {
        this.jobexpField = jobexpField == null ? null : jobexpField.trim();
    }

    public String getJobexpPostion() {
        return jobexpPostion;
    }

    public void setJobexpPostion(String jobexpPostion) {
        this.jobexpPostion = jobexpPostion == null ? null : jobexpPostion.trim();
    }

    public String getJobexpWorkspace() {
        return jobexpWorkspace;
    }

    public void setJobexpWorkspace(String jobexpWorkspace) {
        this.jobexpWorkspace = jobexpWorkspace == null ? null : jobexpWorkspace.trim();
    }

    public Integer getJobexpSubordinate() {
        return jobexpSubordinate;
    }

    public void setJobexpSubordinate(Integer jobexpSubordinate) {
        this.jobexpSubordinate = jobexpSubordinate;
    }

    public Date getJobexpBeginTime() {
        return jobexpBeginTime;
    }

    public void setJobexpBeginTime(Date jobexpBeginTime) {
        this.jobexpBeginTime = jobexpBeginTime;
    }

    public Date getJobexpEndTime() {
        return jobexpEndTime;
    }

    public void setJobexpEndTime(Date jobexpEndTime) {
        this.jobexpEndTime = jobexpEndTime;
    }

    public String getJobexpDuty() {
        return jobexpDuty;
    }

    public void setJobexpDuty(String jobexpDuty) {
        this.jobexpDuty = jobexpDuty == null ? null : jobexpDuty.trim();
    }

    public String getJobexpDept() {
        return jobexpDept;
    }

    public void setJobexpDept(String jobexpDept) {
        this.jobexpDept = jobexpDept == null ? null : jobexpDept.trim();
    }

    public String getJobexpCompanyScale() {
        return jobexpCompanyScale;
    }

    public void setJobexpCompanyScale(String jobexpCompanyScale) {
        this.jobexpCompanyScale = jobexpCompanyScale == null ? null : jobexpCompanyScale.trim();
    }

    public String getJobexpCompanyType() {
        return jobexpCompanyType;
    }

    public void setJobexpCompanyType(String jobexpCompanyType) {
        this.jobexpCompanyType = jobexpCompanyType == null ? null : jobexpCompanyType.trim();
    }

    public Integer getJobexpMm() {
        return jobexpMm;
    }

    public void setJobexpMm(Integer jobexpMm) {
        this.jobexpMm = jobexpMm;
    }

    public Integer getJobexpYm() {
        return jobexpYm;
    }

    public void setJobexpYm(Integer jobexpYm) {
        this.jobexpYm = jobexpYm;
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

    public String getFiled1() {
        return filed1;
    }

    public void setFiled1(String filed1) {
        this.filed1 = filed1 == null ? null : filed1.trim();
    }

    public String getFiled2() {
        return filed2;
    }

    public void setFiled2(String filed2) {
        this.filed2 = filed2 == null ? null : filed2.trim();
    }

    public String getFiled3() {
        return filed3;
    }

    public void setFiled3(String filed3) {
        this.filed3 = filed3 == null ? null : filed3.trim();
    }

    @Override
    public String toString() {
        return "XzJobExp{" +
                "jobexpId=" + jobexpId +
                ", resumeId=" + resumeId +
                ", jobexpCompanyName='" + jobexpCompanyName + '\'' +
                ", jobexpField='" + jobexpField + '\'' +
                ", jobexpPostion='" + jobexpPostion + '\'' +
                ", jobexpWorkspace='" + jobexpWorkspace + '\'' +
                ", jobexpSubordinate=" + jobexpSubordinate +
                ", jobexpBeginTime=" + jobexpBeginTime +
                ", jobexpEndTime=" + jobexpEndTime +
                ", jobexpDuty='" + jobexpDuty + '\'' +
                ", jobexpDept='" + jobexpDept + '\'' +
                ", jobexpCompanyScale='" + jobexpCompanyScale + '\'' +
                ", jobexpCompanyType='" + jobexpCompanyType + '\'' +
                ", jobexpMm=" + jobexpMm +
                ", jobexpYm=" + jobexpYm +
                ", createTime=" + createTime +
                ", deleteTime=" + deleteTime +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", fields=" + fields +
                '}';
    }
}