package com.xzlcPT.bean;

import java.util.Date;

public class XzProjectExp {
    private Long proexpId;

    private Long resumeId;

    private String proexpName;

    private String proexpDuty;

    private Date proexpBeginTime;

    private Date proexpEndTime;

    private String proexpDescribe;

    private String proexpPostion;

    private Date createTime;

    private Date deleteTime;

    private String filed1;

    private String filed2;

    private String filed3;

    public Long getProexpId() {
        return proexpId;
    }

    public void setProexpId(Long proexpId) {
        this.proexpId = proexpId;
    }

    public Long getResumeId() {
        return resumeId;
    }

    public void setResumeId(Long resumeId) {
        this.resumeId = resumeId;
    }

    public String getProexpName() {
        return proexpName;
    }

    public void setProexpName(String proexpName) {
        this.proexpName = proexpName == null ? null : proexpName.trim();
    }

    public String getProexpDuty() {
        return proexpDuty;
    }

    public void setProexpDuty(String proexpDuty) {
        this.proexpDuty = proexpDuty == null ? null : proexpDuty.trim();
    }

    public Date getProexpBeginTime() {
        return proexpBeginTime;
    }

    public void setProexpBeginTime(Date proexpBeginTime) {
        this.proexpBeginTime = proexpBeginTime;
    }

    public Date getProexpEndTime() {
        return proexpEndTime;
    }

    public void setProexpEndTime(Date proexpEndTime) {
        this.proexpEndTime = proexpEndTime;
    }

    public String getProexpDescribe() {
        return proexpDescribe;
    }

    public void setProexpDescribe(String proexpDescribe) {
        this.proexpDescribe = proexpDescribe == null ? null : proexpDescribe.trim();
    }

    public String getProexpPostion() {
        return proexpPostion;
    }

    public void setProexpPostion(String proexpPostion) {
        this.proexpPostion = proexpPostion == null ? null : proexpPostion.trim();
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
}