package com.util.bean;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/19.
 */
public class MessageInfo {
    //"发件人地址"
    private String  from;

    //"收件人地址"
    private List<String> to;

    //"发送时间"
    private Date sendDate;

    //"邮件主题")
    private String subject;

    //"消息正文")
    private String msg;


    public MessageInfo(){

    }

    public MessageInfo(String type){
        this.from = "xianzhi_lc@sina.com";
        this.sendDate = new Date();
        //注册
        if("register".equals(type)){
            this.setSubject("欢迎加入先知平台");
        }
        //找回
        if("findBack".equals(type)){
            this.setSubject("先知平台密码找回");
        }
    }


    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public List<String> getTo() {
        return to;
    }

    public void setTo(List<String> to) {
        this.to = to;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
