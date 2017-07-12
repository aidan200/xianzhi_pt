package com.xzlcPT.bean;


import java.util.Date;

/**
 * 公司会员bean
 *
 * @author 王诗钰
 * @create 2017-05-16 11:26
 **/
public class CompanyVip {
    private Long loginId;//登录id
    private Long companyId;//用户id
    private Long vipId;//会员id
    private String loginCount;//登录名
    private String companyName;//公司名
    private String companyPicture;//公司图片
    private String vipLevel;//会员等级
    private Date vipTime;//入会时间
    private Date lastTime;//上次充值时间
    private Date expireTime;//上次充值时间
    private Long vipScore;//积分数
    private Double vipRest;//余额
    private Integer loginType;//用户类型(1个人 2公司)
    private String filed1;//备用字段1
    private String filed2;//备用字段2
    private String filed3;//备用字段3
    private Integer deleteFlag;//删除标记(0未删除 1删除)

    public Long getLoginId() {
        return loginId;
    }

    public void setLoginId(Long loginId) {
        this.loginId = loginId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getVipId() {
        return vipId;
    }

    public void setVipId(Long vipId) {
        this.vipId = vipId;
    }

    public String getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(String loginCount) {
        this.loginCount = loginCount;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyPicture() {
        return companyPicture;
    }

    public void setCompanyPicture(String companyPicture) {
        this.companyPicture = companyPicture;
    }

    public String getVipLevel() {
        return vipLevel;
    }

    public void setVipLevel(String vipLevel) {
        this.vipLevel = vipLevel;
    }

    public Date getVipTime() {
        return vipTime;
    }

    public void setVipTime(Date vipTime) {
        this.vipTime = vipTime;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    public Long getVipScore() {
        return vipScore;
    }

    public void setVipScore(Long vipScore) {
        this.vipScore = vipScore;
    }

    public Double getVipRest() {
        return vipRest;
    }

    public void setVipRest(Double vipRest) {
        this.vipRest = vipRest;
    }

    public Integer getLoginType() {
        return loginType;
    }

    public void setLoginType(Integer loginType) {
        this.loginType = loginType;
    }

    public String getFiled1() {
        return filed1;
    }

    public void setFiled1(String filed1) {
        this.filed1 = filed1;
    }

    public String getFiled2() {
        return filed2;
    }

    public void setFiled2(String filed2) {
        this.filed2 = filed2;
    }

    public String getFiled3() {
        return filed3;
    }

    public void setFiled3(String filed3) {
        this.filed3 = filed3;
    }

    public Integer getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Integer deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    @Override
    public String toString() {
        return "CompanyVip{" +
                "loginId=" + loginId +
                ", companyId=" + companyId +
                ", vipId=" + vipId +
                ", loginCount='" + loginCount + '\'' +
                ", companyName='" + companyName + '\'' +
                ", companyPicture='" + companyPicture + '\'' +
                ", vipLevel='" + vipLevel + '\'' +
                ", vipTime=" + vipTime +
                ", lastTime=" + lastTime +
                ", expireTime=" + expireTime +
                ", vipScore=" + vipScore +
                ", vipRest=" + vipRest +
                ", loginType=" + loginType +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", deleteFlag=" + deleteFlag +
                '}';
    }
}
