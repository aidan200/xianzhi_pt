package com.xzlcPT.bean;

import java.util.Date;
//公司风采
public class XzCompanyProduct {
    private Long productId;

    private Long companyId;

    private String productIntro;

    private String productUrl;

    private Date createTime;

    private Date deleteTime;

    private Integer deleteFalt;

    private String filed1;

    private String filed2;

    private String filed3;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getProductIntro() {
        return productIntro;
    }

    public void setProductIntro(String productIntro) {
        this.productIntro = productIntro == null ? null : productIntro.trim();
    }

    public String getProductUrl() {
        return productUrl;
    }

    public void setProductUrl(String productUrl) {
        this.productUrl = productUrl == null ? null : productUrl.trim();
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
        return "XzCompanyProduct{" +
                "productId=" + productId +
                ", companyId=" + companyId +
                ", productIntro='" + productIntro + '\'' +
                ", productUrl='" + productUrl + '\'' +
                ", createTime=" + createTime +
                ", deleteTime=" + deleteTime +
                ", deleteFalt=" + deleteFalt +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                '}';
    }
}