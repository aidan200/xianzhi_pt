package com.xzlcPT.bean;/**
 * Created by Administrator on 2017/7/17.
 */

import java.util.Date;

/**
 * @author 甘汝雷
 * @create 2017-07-17 19:50
 **/
public class XzCompanyMien {
    private Long mienId;

    private Long companyId;

    private String mienIntro;

    private String mienUrl;

    private Date createTime;

    private Date deleteTime;

    private Integer deleteFalt;

    private String filed1;

    private String filed2;

    private String filed3;

    public void setMienId(Long mienId) {
        this.mienId = mienId;
    }

    public Long getMienId() {
        return mienId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setMienIntro(String mienIntro) {
        this.mienIntro = mienIntro;
    }

    public String getMienIntro() {
        return mienIntro;
    }

    public void setMienUrl(String mienUrl) {
        this.mienUrl = mienUrl;
    }

    public String getMienUrl() {
        return mienUrl;
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


}
