package com.xzlcPT.bean;

import java.util.Date;

public class XzCompanyFollow {
    private Long followId;

    private Long companyId;

    private Long memberId;

    private Date followTime;

    private XzCompany company;

    public XzCompany getCompany() {
        return company;
    }

    public void setCompany(XzCompany company) {
        this.company = company;
    }

    public Long getFollowId() {
        return followId;
    }

    public void setFollowId(Long followId) {
        this.followId = followId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public Date getFollowTime() {
        return followTime;
    }

    public void setFollowTime(Date followTime) {
        this.followTime = followTime;
    }
}