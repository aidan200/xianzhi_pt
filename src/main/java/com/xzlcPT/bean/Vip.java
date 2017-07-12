package com.xzlcPT.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 会员信息
 *
 * @author 王诗钰
 * @create 2017-04-24 11:36
 **/
public class Vip {
    private Long vipId;//会员编号(主键)
    private Long loginID;//登录表ID
    private String vipLevel;//会员等级
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date vipTime;//入会时间
    private Date lastTime;//上次充值时间
    private Date expireTime;//会员到期时间
    private Long vipScore;//会员积分数
    private Double vipRest;//账户余额
    private String filed1;//备用字段1
    private String filed2;//备用字段2
    private String filed3;//备用字段3
    private Integer deleteFlag;//删除标记(0未删除 1删除)

    public Long getVipId() {
        return vipId;
    }

    public void setVipId(Long vipId) {
        this.vipId = vipId;
    }

    public Long getLoginID() {
        return loginID;
    }

    public void setLoginID(Long loginID) {
        this.loginID = loginID;
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
        return "Vip{" +
                "vipId=" + vipId +
                ", loginID=" + loginID +
                ", vipLevel='" + vipLevel + '\'' +
                ", vipTime=" + vipTime +
                ", lastTime=" + lastTime +
                ", expireTime=" + expireTime +
                ", vipScore=" + vipScore +
                ", vipRest=" + vipRest +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", deleteFlag=" + deleteFlag +
                '}';
    }
}
