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
    private Long memberId;//用户ID
    private Long loginId;//登录表ID
    private String memberName;//姓名
    private Integer memberSex; //性别 0:男 1:女
    private Integer memberAge;//年龄
    private Date memberBirth;//生日
    private String memberEducation;
    private String memberIdcard;//身份证号
    private String memberPicture;//头像
    private String memberPhone;//电话
    private String memberEmail;//用户邮箱
    private String memberAddress;//居住地址
    private XzResume resume;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date deleteMemberDate;//删除日期
    private Integer deleteFalt;//删除类型
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

    public XzResume getResume() {
        return resume;
    }

    public void setResume(XzResume resume) {
        this.resume = resume;
    }

    public Integer getMemberSex() {
        return memberSex;
    }

    public void setMemberSex(Integer memberSex) {
        this.memberSex = memberSex;
    }

    public Integer getMemberAge() {
        return memberAge;
    }

    public void setMemberAge(Integer memberAge) {
        this.memberAge = memberAge;
    }

    public String getMemberIdcard() {
        return memberIdcard;
    }

    public void setMemberIdcard(String memberIdcard) {
        this.memberIdcard = memberIdcard;
    }

    public Integer getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(Integer deleteFalt) {
        this.deleteFalt = deleteFalt;
    }

    public Long getLoginId() {
        return loginId;
    }

    public void setLoginId(Long loginId) {
        this.loginId = loginId;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
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


    public void setMemberName(String memberName) {
        this.memberName = memberName;
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

    public String getMemberName() {
        return memberName;
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
