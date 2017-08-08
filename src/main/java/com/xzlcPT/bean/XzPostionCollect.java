package com.xzlcPT.bean;

import java.util.Date;

public class XzPostionCollect {
    private Long collectId;

    private Long postionId;

    private Long memberId;

    private Date collectTime;

    private XzPostion postion;

    public XzPostion getPostion() {
        return postion;
    }

    public void setPostion(XzPostion postion) {
        this.postion = postion;
    }

    public Long getCollectId() {
        return collectId;
    }

    public void setCollectId(Long collectId) {
        this.collectId = collectId;
    }

    public Long getPostionId() {
        return postionId;
    }

    public void setPostionId(Long postionId) {
        this.postionId = postionId;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }
}