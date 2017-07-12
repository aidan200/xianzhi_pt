package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * bean层 XzMember
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public class XzMember {
    private long memberId;//用户ID
    private long loginId;//登录表ID
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String memberName;//姓名
    private int memberSex; //性别 0:男 1:女
    private int memberAge;//年龄
    private Date memberBirth;//生日
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String memberEducation;
    private String memberIDcard;//身份证号
    private String memberPicture;//头像
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String memberPhone;//电话
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String memberEmail;//用户邮箱
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String memberAddress;//居住地址
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date deleteMemberDate;//删除日期
    private int deleteFalt;//删除类型
    private String filed1;//备用列1
    private String filed2;//备用列2
    private String filed3;//备用列3

    //验证分组1
    public interface F1{

    }

    //组序列
    @GroupSequence( { XzMember.F1.class })
    public interface Group {

    }

    public Date getMemberBirth() {
        return memberBirth;
    }

    public void setMemberBirth(Date memberBirth) {
        this.memberBirth = memberBirth;
    }

    public String getMemberEducation() {
        return memberEducation;
    }

    public void setMemberEducation(String memberEducation) {
        this.memberEducation = memberEducation;
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
    }

    public String getMemberAddress() {
        return memberAddress;
    }

    public void setMemberAddress(String memberAddress) {
        this.memberAddress = memberAddress;
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

    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(int deleteFalt) {
        this.deleteFalt = deleteFalt;
    }


    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public void setMemberSex(int memberSex) {
        this.memberSex = memberSex;
    }

    public void setMemberAge(int memberAge) {
        this.memberAge = memberAge;
    }

    public void setMemberIDcard(String memberIDcard) {
        this.memberIDcard = memberIDcard;
    }

    public void setMemberPicture(String memberPicture) {
        this.memberPicture = memberPicture;
    }

    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }

    public void setDeleteMemberDate(Date deleteMemberDate) {
        this.deleteMemberDate = deleteMemberDate;
    }

    public long getMemberId() {
        return memberId;
    }

    public void setMemberId(long memberId) {
        this.memberId = memberId;
    }

    public long getLoginId() {
        return loginId;
    }

    public void setLoginId(long loginId) {
        this.loginId = loginId;
    }

    public String getMemberName() {
        return memberName;
    }

    public int getMemberSex() {
        return memberSex;
    }

    public int getMemberAge() {
        return memberAge;
    }

    public String getMemberIDcard() {
        return memberIDcard;
    }

    public String getMemberPicture() {
        return memberPicture;
    }

    public String getMemberPhone() {
        return memberPhone;
    }

    public Date getDeleteMemberDate() {
        return deleteMemberDate;
    }

    @Override
    public String toString() {
        return "XzMember{" +
                "memberId=" + memberId +
                ", loginId=" + loginId +
                ", memberName='" + memberName + '\'' +
                ", memberSex=" + memberSex +
                ", memberAge=" + memberAge +
                ", memberBirth=" + memberBirth +
                ", memberEducation='" + memberEducation + '\'' +
                ", memberIDcard='" + memberIDcard + '\'' +
                ", memberPicture='" + memberPicture + '\'' +
                ", memberPhone='" + memberPhone + '\'' +
                ", memberEmail='" + memberEmail + '\'' +
                ", memberAddress='" + memberAddress + '\'' +
                ", deleteMemberDate=" + deleteMemberDate +
                ", deleteFalt=" + deleteFalt +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                '}';
    }
}
