package com.util.bean;

/**
 * Created by Administrator on 2017/7/19.
 */
public class EmailConf {
    // 邮箱用户
    private String username;

    // 邮箱密码
    private String password;

    // 邮箱服务器
    private String place;

    public EmailConf(String type){
        if("sina".equals(type)){
            this.username = "xianzhi_lc@sina.com";
            this.password = "tt6403947";
            this.place = "smtp.sina.com";
        }
    }

    public  EmailConf(){

    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }
}
