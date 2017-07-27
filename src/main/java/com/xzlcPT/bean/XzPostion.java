package com.xzlcPT.bean;

import java.util.Date;
import java.util.List;

public class XzPostion {
    private Long postionId;

    private Long companyId;

    private String postionName;

    private String postionCompany;

    private Integer postionYm;

    private Integer postionMm;

    private String postionSpace;

    private Date postionTime;

    private String postionEducation;

    private String postionExp;

    private String postionAge;

    private String postionDescription;

    private String postionWelfare;

    private Date createTime;

    private Date deleteTime;

    private Date publishTime;

    private Date overTime;

    private String postionDepartment;

    private Integer peopleNumber;

    private String postionSpecialty;

    private Integer publishMonth;

    private Integer educationEntrance;

    private Integer deleteFlat;

    private String forceAge;

    private String forceSpecialty;

    private String filed1;

    private String filed2;

    private String filed3;

    private XzCompany company;

    private List<XzField> fields;

    private Integer wcl;
    private Integer dd;
    private Integer yxgt;
    private Integer ms;
    private Integer zdxz;
    private Integer alls;

    public Integer getAlls() {
        return alls;
    }

    public void setAlls(Integer alls) {
        this.alls = alls;
    }

    public Integer getWcl() {
        return wcl;
    }

    public void setWcl(Integer wcl) {
        this.wcl = wcl;
    }

    public Integer getDd() {
        return dd;
    }

    public void setDd(Integer dd) {
        this.dd = dd;
    }

    public Integer getYxgt() {
        return yxgt;
    }

    public void setYxgt(Integer yxgt) {
        this.yxgt = yxgt;
    }

    public Integer getMs() {
        return ms;
    }

    public void setMs(Integer ms) {
        this.ms = ms;
    }

    public Integer getZdxz() {
        return zdxz;
    }

    public void setZdxz(Integer zdxz) {
        this.zdxz = zdxz;
    }

    public List<XzField> getFields() {
        return fields;
    }

    public void setFields(List<XzField> fields) {
        this.fields = fields;
    }

    public XzCompany getCompany() {
        return company;
    }

    public void setCompany(XzCompany company) {
        this.company = company;
    }

    public Long getPostionId() {
        return postionId;
    }

    public void setPostionId(Long postionId) {
        this.postionId = postionId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getPostionName() {
        return postionName;
    }

    public void setPostionName(String postionName) {
        this.postionName = postionName == null ? null : postionName.trim();
    }

    public String getPostionCompany() {
        return postionCompany;
    }

    public void setPostionCompany(String postionCompany) {
        this.postionCompany = postionCompany == null ? null : postionCompany.trim();
    }

    public Integer getPostionYm() {
        return postionYm;
    }

    public void setPostionYm(Integer postionYm) {
        this.postionYm = postionYm;
    }

    public Integer getPostionMm() {
        return postionMm;
    }

    public void setPostionMm(Integer postionMm) {
        this.postionMm = postionMm;
    }

    public String getPostionSpace() {
        return postionSpace;
    }

    public void setPostionSpace(String postionSpace) {
        this.postionSpace = postionSpace == null ? null : postionSpace.trim();
    }

    public Date getPostionTime() {
        return postionTime;
    }

    public void setPostionTime(Date postionTime) {
        this.postionTime = postionTime;
    }

    public String getPostionEducation() {
        return postionEducation;
    }

    public void setPostionEducation(String postionEducation) {
        this.postionEducation = postionEducation == null ? null : postionEducation.trim();
    }

    public String getPostionExp() {
        return postionExp;
    }

    public void setPostionExp(String postionExp) {
        this.postionExp = postionExp == null ? null : postionExp.trim();
    }

    public String getPostionAge() {
        return postionAge;
    }

    public void setPostionAge(String postionAge) {
        this.postionAge = postionAge == null ? null : postionAge.trim();
    }

    public String getPostionDescription() {
        return postionDescription;
    }

    public void setPostionDescription(String postionDescription) {
        this.postionDescription = postionDescription == null ? null : postionDescription.trim();
    }

    public String getPostionWelfare() {
        return postionWelfare;
    }

    public void setPostionWelfare(String postionWelfare) {
        this.postionWelfare = postionWelfare == null ? null : postionWelfare.trim();
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

    public Integer getDeleteFlat() {
        return deleteFlat;
    }

    public void setDeleteFlat(Integer deleteFlat) {
        this.deleteFlat = deleteFlat;
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

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setOverTime(Date overTime) {
        this.overTime = overTime;
    }

    public Date getOverTime() {
        return overTime;
    }

    public void setPeopleNumber(Integer peopleNumber) {
        this.peopleNumber = peopleNumber;
    }

    public Integer getPeopleNumber() {
        return peopleNumber;
    }

    public void setPostionDepartment(String postionDepartment) {
        this.postionDepartment = postionDepartment;
    }

    public String getPostionDepartment() {
        return postionDepartment;
    }

    public void setPostionSpecialty(String postionSpecialty) {
        this.postionSpecialty = postionSpecialty;
    }

    public String getPostionSpecialty() {
        return postionSpecialty;
    }

    public void setEducationEntrance(Integer educationEntrance) {
        this.educationEntrance = educationEntrance;
    }

    public Integer getEducationEntrance() {
        return educationEntrance;
    }

    public void setPublishMonth(Integer publishMonth) {
        this.publishMonth = publishMonth;
    }

    public Integer getPublishMonth() {
        return publishMonth;
    }

    public void setForceAge(String forceAge) {
        this.forceAge = forceAge;
    }

    public String getForceAge() {
        return forceAge;
    }

    public void setForceSpecialty(String forceSpecialty) {
        this.forceSpecialty = forceSpecialty;
    }

    public String getForceSpecialty() {
        return forceSpecialty;
    }

    @Override
    public String toString() {
        return "XzPostion{" +
                "postionId=" + postionId +
                ", companyId=" + companyId +
                ", postionName='" + postionName + '\'' +
                ", postionCompany='" + postionCompany + '\'' +
                ", postionYm=" + postionYm +
                ", postionMm=" + postionMm +
                ", postionSpace='" + postionSpace + '\'' +
                ", postionTime=" + postionTime +
                ", postionEducation='" + postionEducation + '\'' +
                ", postionExp='" + postionExp + '\'' +
                ", postionAge='" + postionAge + '\'' +
                ", postionDescription='" + postionDescription + '\'' +
                ", postionWelfare='" + postionWelfare + '\'' +
                ", createTime=" + createTime +
                ", deleteTime=" + deleteTime +
                ", deleteFlat=" + deleteFlat +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", company=" + company +
                ", fields=" + fields +
                '}';
    }
}