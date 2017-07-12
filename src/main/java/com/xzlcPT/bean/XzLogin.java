package com.xzlcPT.bean;


import com.valid.ValidById;
import com.xzlcPT.service.RegisterService;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * bean层 XzLogin
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public class XzLogin {

    private Long loginId;//会员登录表ID
    @ValidById(serviceClazz = RegisterService.class,message = "用户名已存在",methodName = "selectByCount",groups = {F1.class})
    private String loginCount;//账号
    @NotNull(message="密码: 不能为空",groups = {F2.class})
    private String loginPassword;//密码
    private int loginType;//会员类型 1:个人 2:公司
    @ValidById(serviceClazz = RegisterService.class,message = "该邮箱已被注册",methodName = "selectEmail",groups = {F3.class})
    private String loginEmail;//用户邮箱
    private int loginActive;//激活状态
    private String confirmPassword;//重复输入密码


    private XzMember member;//个人用户
    private XzCompany company;//企业用户

    private Date deleteLoginDate;//删除日期
    private int deleteFalt;//删除类型 0:删除 1:未删除
    private String filed1;//备用列1
    private String filed2;//备用列1
    private String filed3;//备用列1


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

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

    public int getLoginType() {
        return loginType;
    }

    public void setLoginType(int loginType) {
        this.loginType = loginType;
    }

    public String getLoginEmail() {
        return loginEmail;
    }

    public void setLoginEmail(String loginEmail) {
        this.loginEmail = loginEmail;
    }

    public int getLoginActive() {
        return loginActive;
    }

    public void setLoginActive(int loginActive) {
        this.loginActive = loginActive;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public XzMember getMember() {
        return member;
    }

    public void setMember(XzMember member) {
        this.member = member;
    }

    public XzCompany getCompany() {
        return company;
    }

    public void setCompany(XzCompany company) {
        this.company = company;
    }

    public Date getDeleteLoginDate() {
        return deleteLoginDate;
    }

    public void setDeleteLoginDate(Date deleteLoginDate) {
        this.deleteLoginDate = deleteLoginDate;
    }

    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(int deleteFalt) {
        this.deleteFalt = deleteFalt;
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

    //验证分组1
    public interface F1{

    }
    //验证分组2
    public interface F2{

    }
    //验证分组3
    public interface F3{

    }
    //验证分组4
    public interface F4{

    }

    //组序列
    @GroupSequence( { XzLogin.F1.class, XzLogin.F2.class,XzLogin.F4.class, XzLogin.F3.class})
    public interface Group {

    }

    @Override
    public String toString() {
        return "XzLogin{" +
                "loginId=" + loginId +
                ", loginCount='" + loginCount + '\'' +
                ", loginPassword='" + loginPassword + '\'' +
                ", loginType=" + loginType +
                ", loginEmail='" + loginEmail + '\'' +
                ", loginActive=" + loginActive +
                ", confirmPassword='" + confirmPassword + '\'' +
                ", member=" + member +
                ", company=" + company +
                ", deleteLoginDate=" + deleteLoginDate +
                ", deleteFalt=" + deleteFalt +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                '}';
    }
}