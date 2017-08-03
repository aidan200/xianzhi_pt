package com.xzlcPT.bean;

import java.util.Date;

public class XzResumeBrowse {
    private Long browseId;

    private Long resumeId;

    private Long companyId;

    private Integer isread;

    private Date browseTime;

    public Long getBrowseId() {
        return browseId;
    }

    public void setBrowseId(Long browseId) {
        this.browseId = browseId;
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

    public Integer getIsread() {
        return isread;
    }

    public void setIsread(Integer isread) {
        this.isread = isread;
    }

    public Date getBrowseTime() {
        return browseTime;
    }

    public void setBrowseTime(Date browseTime) {
        this.browseTime = browseTime;
    }
}