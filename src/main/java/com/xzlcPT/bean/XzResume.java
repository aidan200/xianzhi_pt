package com.xzlcPT.bean;

import java.util.Date;

public class XzResume {
    private Long resumeId;

    private Long memberId;

    private String resumeName;

    private String resumeField;

    private String resumeWorkspace;

    private Integer resumeMm;

    private Integer resumeYm;

    private String resumePosition;

    private String resumeWorkinglife;

    private String resumeNationality;

    private String resumeState;

    private String resumeMarriage;

    private Date resumeFlash;

    private String resumeIntentWorkspace;

    private String resumeIntentField;

    private Integer resumeIntentMm;

    private Integer resumeIntentYm;

    private String resumeIntentPosition;

    private Integer resumeCompletion;

    private Date createTime;

    private Date deleteTime;

    private Integer deleteFalt;

    private String filed1;

    private String filed2;

    private String filed3;

    public Long getResumeId() {
        return resumeId;
    }

    public void setResumeId(Long resumeId) {
        this.resumeId = resumeId;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public String getResumeName() {
        return resumeName;
    }

    public void setResumeName(String resumeName) {
        this.resumeName = resumeName == null ? null : resumeName.trim();
    }

    public String getResumeField() {
        return resumeField;
    }

    public void setResumeField(String resumeField) {
        this.resumeField = resumeField == null ? null : resumeField.trim();
    }

    public String getResumeWorkspace() {
        return resumeWorkspace;
    }

    public void setResumeWorkspace(String resumeWorkspace) {
        this.resumeWorkspace = resumeWorkspace == null ? null : resumeWorkspace.trim();
    }

    public Integer getResumeMm() {
        return resumeMm;
    }

    public void setResumeMm(Integer resumeMm) {
        this.resumeMm = resumeMm;
    }

    public Integer getResumeYm() {
        return resumeYm;
    }

    public void setResumeYm(Integer resumeYm) {
        this.resumeYm = resumeYm;
    }

    public String getResumePosition() {
        return resumePosition;
    }

    public void setResumePosition(String resumePosition) {
        this.resumePosition = resumePosition == null ? null : resumePosition.trim();
    }

    public String getResumeWorkinglife() {
        return resumeWorkinglife;
    }

    public void setResumeWorkinglife(String resumeWorkinglife) {
        this.resumeWorkinglife = resumeWorkinglife == null ? null : resumeWorkinglife.trim();
    }

    public String getResumeNationality() {
        return resumeNationality;
    }

    public void setResumeNationality(String resumeNationality) {
        this.resumeNationality = resumeNationality == null ? null : resumeNationality.trim();
    }

    public String getResumeState() {
        return resumeState;
    }

    public void setResumeState(String resumeState) {
        this.resumeState = resumeState == null ? null : resumeState.trim();
    }

    public String getResumeMarriage() {
        return resumeMarriage;
    }

    public void setResumeMarriage(String resumeMarriage) {
        this.resumeMarriage = resumeMarriage == null ? null : resumeMarriage.trim();
    }

    public Date getResumeFlash() {
        return resumeFlash;
    }

    public void setResumeFlash(Date resumeFlash) {
        this.resumeFlash = resumeFlash;
    }

    public String getResumeIntentWorkspace() {
        return resumeIntentWorkspace;
    }

    public void setResumeIntentWorkspace(String resumeIntentWorkspace) {
        this.resumeIntentWorkspace = resumeIntentWorkspace == null ? null : resumeIntentWorkspace.trim();
    }

    public String getResumeIntentField() {
        return resumeIntentField;
    }

    public void setResumeIntentField(String resumeIntentField) {
        this.resumeIntentField = resumeIntentField == null ? null : resumeIntentField.trim();
    }

    public Integer getResumeIntentMm() {
        return resumeIntentMm;
    }

    public void setResumeIntentMm(Integer resumeIntentMm) {
        this.resumeIntentMm = resumeIntentMm;
    }

    public Integer getResumeIntentYm() {
        return resumeIntentYm;
    }

    public void setResumeIntentYm(Integer resumeIntentYm) {
        this.resumeIntentYm = resumeIntentYm;
    }

    public String getResumeIntentPosition() {
        return resumeIntentPosition;
    }

    public void setResumeIntentPosition(String resumeIntentPosition) {
        this.resumeIntentPosition = resumeIntentPosition == null ? null : resumeIntentPosition.trim();
    }

    public Integer getResumeCompletion() {
        return resumeCompletion;
    }

    public void setResumeCompletion(Integer resumeCompletion) {
        this.resumeCompletion = resumeCompletion;
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

    public Integer getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(Integer deleteFalt) {
        this.deleteFalt = deleteFalt;
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
        return "XzResume{" +
                "resumeId=" + resumeId +
                ", memberId=" + memberId +
                ", resumeName='" + resumeName + '\'' +
                ", resumeField='" + resumeField + '\'' +
                ", resumeWorkspace='" + resumeWorkspace + '\'' +
                ", resumeMm=" + resumeMm +
                ", resumeYm=" + resumeYm +
                ", resumePosition='" + resumePosition + '\'' +
                ", resumeWorkinglife='" + resumeWorkinglife + '\'' +
                ", resumeNationality='" + resumeNationality + '\'' +
                ", resumeState='" + resumeState + '\'' +
                ", resumeMarriage='" + resumeMarriage + '\'' +
                ", resumeFlash=" + resumeFlash +
                ", resumeIntentWorkspace='" + resumeIntentWorkspace + '\'' +
                ", resumeIntentField='" + resumeIntentField + '\'' +
                ", resumeIntentMm=" + resumeIntentMm +
                ", resumeIntentYm=" + resumeIntentYm +
                ", resumeIntentPosition='" + resumeIntentPosition + '\'' +
                ", resumeCompletion=" + resumeCompletion +
                ", createTime=" + createTime +
                ", deleteTime=" + deleteTime +
                ", deleteFalt=" + deleteFalt +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                '}';
    }
}