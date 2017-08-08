package com.xzlcPT.bean;

import java.util.Date;

public class XzCompanyDomain {
    private Long domainId;

    private Long companyId;

    private Long fieldId;

    private Date createTime;

    private XzField field;

    public XzField getField() {
        return field;
    }

    public void setField(XzField field) {
        this.field = field;
    }

    public Long getDomainId() {
        return domainId;
    }

    public void setDomainId(Long domainId) {
        this.domainId = domainId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getFieldId() {
        return fieldId;
    }

    public void setFieldId(Long fieldId) {
        this.fieldId = fieldId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "XzCompanyDomain{" +
                "domainId=" + domainId +
                ", companyId=" + companyId +
                ", fieldId=" + fieldId +
                ", createTime=" + createTime +
                ", field=" + field +
                '}';
    }
}