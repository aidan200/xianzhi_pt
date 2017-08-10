package com.xzlcPT.bean;

import java.util.Date;

public class XzMsg {
    private Long msgId;

    private String msgTital;

    private String msgContent;

    private Long msgSendId;

    private Long msgReceiveId;

    private Date msgTime;

    private Integer msgType;

    private Integer msgIsread;

    private Long outId;

    private Date createTime;

    private Date deleteTime;

    private String filed1;

    private String filed2;

    private String filed3;

    public Long getMsgId() {
        return msgId;
    }

    public void setMsgId(Long msgId) {
        this.msgId = msgId;
    }

    public String getMsgTital() {
        return msgTital;
    }

    public void setMsgTital(String msgTital) {
        this.msgTital = msgTital == null ? null : msgTital.trim();
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent == null ? null : msgContent.trim();
    }

    public Long getMsgSendId() {
        return msgSendId;
    }

    public void setMsgSendId(Long msgSendId) {
        this.msgSendId = msgSendId;
    }

    public Long getMsgReceiveId() {
        return msgReceiveId;
    }

    public void setMsgReceiveId(Long msgReceiveId) {
        this.msgReceiveId = msgReceiveId;
    }

    public Date getMsgTime() {
        return msgTime;
    }

    public void setMsgTime(Date msgTime) {
        this.msgTime = msgTime;
    }

    public Integer getMsgType() {
        return msgType;
    }

    public void setMsgType(Integer msgType) {
        this.msgType = msgType;
    }

    public Integer getMsgIsread() {
        return msgIsread;
    }

    public void setMsgIsread(Integer msgIsread) {
        this.msgIsread = msgIsread;
    }

    public Long getOutId() {
        return outId;
    }

    public void setOutId(Long outId) {
        this.outId = outId;
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