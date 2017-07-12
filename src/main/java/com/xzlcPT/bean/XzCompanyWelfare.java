package com.xzlcPT.bean;

public class XzCompanyWelfare {
    private Long welfareId;

    private Long companyId;

    private String welfareName;

    public Long getWelfareId() {
        return welfareId;
    }

    public void setWelfareId(Long welfareId) {
        this.welfareId = welfareId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getWelfareName() {
        return welfareName;
    }

    public void setWelfareName(String welfareName) {
        this.welfareName = welfareName == null ? null : welfareName.trim();
    }

    @Override
    public String toString() {
        return "XzCompanyWelfare{" +
                "welfareId=" + welfareId +
                ", companyId=" + companyId +
                ", welfareName='" + welfareName + '\'' +
                '}';
    }
}