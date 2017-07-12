package com.xzlcPT.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 会员交易记录
 *
 * @author 王诗钰
 * @create 2017-04-24 11:37
 **/
public class Cost {
    private Long costId;//主键
    private Long vipId;//会员编号
    private Double costMoney;//交易金额
    private String costType;//交易类型(支出/收入)
    private String costReason;//交易原因
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date costTime;//交易时间
    private String filed1;//备用字段1
    private String filed2;//备用字段2
    private String filed3;//备用字段3
    private Integer deleteFlag;//删除标记(0未删除 1删除)

    public Long getCostId() {
        return costId;
    }

    public void setCostId(Long costId) {
        this.costId = costId;
    }

    public Long getVipId() {
        return vipId;
    }

    public void setVipId(Long vipId) {
        this.vipId = vipId;
    }

    public Double getCostMoney() {
        return costMoney;
    }

    public void setCostMoney(Double costMoney) {
        this.costMoney = costMoney;
    }

    public String getCostType() {
        return costType;
    }

    public void setCostType(String costType) {
        this.costType = costType;
    }

    public String getCostReason() {
        return costReason;
    }

    public void setCostReason(String costReason) {
        this.costReason = costReason;
    }

    public Date getCostTime() {
        return costTime;
    }

    public void setCostTime(Date costTime) {
        this.costTime = costTime;
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
        return "Cost{" +
                "costId=" + costId +
                ", vipId=" + vipId +
                ", costMoney=" + costMoney +
                ", costType='" + costType + '\'' +
                ", costReason='" + costReason + '\'' +
                ", costTime=" + costTime +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", deleteFlag=" + deleteFlag +
                '}';
    }
}
