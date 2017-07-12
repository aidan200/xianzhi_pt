package com.xzlcPT.bean;

import java.util.Date;

/**
 * 用户会员全部信息
 *
 * @author 王诗钰
 * @create 2017-05-13 13:55
 **/
public class Leaguer {
    private Long loginId;//登录id
    private Long memberId;//用户id
    private Long vipId;//会员id
    private String loginCount;//登录名
    private Integer memberSex;//用户性别
    private String memberName;//用户名
    private String memberPicture;//用户头像
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

    public String getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(String loginCount) {
        this.loginCount = loginCount;
    }

    public Integer getMemberSex() {
        return memberSex;
    }

    public void setMemberSex(Integer memberSex) {
        this.memberSex = memberSex;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberPicture() {
        return memberPicture;
    }

    public void setMemberPicture(String memberPicture) {
        this.memberPicture = memberPicture;
    }

    public Long getVipId() {
        return vipId;
    }

    public void setVipId(Long vipId) {
        this.vipId = vipId;
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
        return "Leaguer{" +
                "loginId=" + loginId +
                ", memberId=" + memberId +
                ", vipId=" + vipId +
                ", loginCount='" + loginCount + '\'' +
                ", memberSex=" + memberSex +
                ", memberName='" + memberName + '\'' +
                ", memberPicture='" + memberPicture + '\'' +
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
