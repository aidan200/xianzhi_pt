package com.xzlcPT.bean;

import java.util.Date;

public class XzPostionMsg {
    private Long pmsgId;

    private Long postionId;

    private String pmsgName;

    private String pmsgValue;

    private Date createTime;

    private Date deleteTime;

    private Integer deleteFalt;

    private String filed1;

    private String filed2;

    private String filed3;

    public Long getPmsgId() {
        return pmsgId;
    }

    public void setPmsgId(Long pmsgId) {
        this.pmsgId = pmsgId;
    }

    public Long getPostionId() {
        return postionId;
    }

    public void setPostionId(Long postionId) {
        this.postionId = postionId;
    }

    public String getPmsgName() {
        return pmsgName;
    }

    public void setPmsgName(String pmsgName) {
        this.pmsgName = pmsgName == null ? null : pmsgName.trim();
    }

    public String getPmsgValue() {
        return pmsgValue;
    }

    public void setPmsgValue(String pmsgValue) {
        this.pmsgValue = pmsgValue == null ? null : pmsgValue.trim();
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