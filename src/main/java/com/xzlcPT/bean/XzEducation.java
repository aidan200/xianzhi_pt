package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * bean层 XzEducation
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public class XzEducation {

    private long educationID; //学历表ID
    private long loginID;   //登录表ID
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String education;   //学历
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String school;  //学校
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String major;   //专业
    @NotNull(message="不能为空",groups = {F1.class})
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date enrollmentDate;    //入学时间
    @NotNull(message="不能为空",groups = {F1.class})
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date graduateDate;  //毕业时间
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String educationSkill;//专业技能 是否统招

    private Date deleteEducationDate;   //删除日期
    private int deleteFalt;     // 删除类型
    private String filed1;//备用列1
    private String filed2;//备用列2
    private String filed3;//备用列3

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

    public long getEducationID() {
        return educationID;
    }

    public long getLoginID() {
        return loginID;
    }

    public String getEducation() {
        return education;
    }

    public String getSchool() {
        return school;
    }

    public String getMajor() {
        return major;
    }

    public Date getEnrollmentDate() {
        return enrollmentDate;
    }

    public Date getGraduateDate() {
        return graduateDate;
    }

    public String getEducationSkill() {
        return educationSkill;
    }

    public void setEducationSkill(String educationSkill) {
        this.educationSkill = educationSkill;
    }

    public Date getDeleteEducationDate() {
        return deleteEducationDate;
    }

    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setEducationID(long educationID) {
        this.educationID = educationID;
    }

    public void setLoginID(long loginID) {
        this.loginID = loginID;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setEnrollmentDate(Date enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }

    public void setGraduateDate(Date graduateDate) {
        this.graduateDate = graduateDate;
    }

    public void setDeleteEducationDate(Date deleteEducationDate) {
        this.deleteEducationDate = deleteEducationDate;
    }

    public void setDeleteFalt(int deleteFalt) {
        this.deleteFalt = deleteFalt;
    }

    //验证分组1
    public interface F1{

    }
    //验证分组2
    public interface F2{

    }


    //组序列
    @GroupSequence( { F1.class, F2.class })
    public interface Group {

    }

    @Override
    public String toString() {
        return "XzEducation{" +
                "educationID=" + educationID +
                ", loginID=" + loginID +
                ", education='" + education + '\'' +
                ", school='" + school + '\'' +
                ", major='" + major + '\'' +
                ", enrollmentDate=" + enrollmentDate +
                ", graduateDate=" + graduateDate +
                ", educationSkill='" + educationSkill + '\'' +
                ", deleteEducationDate=" + deleteEducationDate +
                ", deleteFalt=" + deleteFalt +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                '}';
    }
}
