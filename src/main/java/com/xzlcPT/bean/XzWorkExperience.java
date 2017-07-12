package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * bean层 XzWorkExperience
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public class XzWorkExperience {

    private long workExperienceID;//工作经验表ID
    private long loginID;//登录表ID
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String company;//公司名称
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String duty;//职务
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message="不能为空",groups = {F1.class})
    private Date entryDate;//入职日期
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message="不能为空",groups = {F1.class})
    private Date dimissionDate;//离职日期
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String dimissionCause;//离职原因
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String workDescription;//工作描述
    private Date deleteWorkDate;//删除时间
    private int deleteFalt;//删除类型
    private String filed1;//备用列1
    private String filed2;//备用列2
    private String filed3;//备用列3

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

    public long getWorkExperienceID() {
        return workExperienceID;
    }

    public long getLoginID() {
        return loginID;
    }

    public String getCompany() {
        return company;
    }

    public String getDuty() {
        return duty;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public Date getDimissionDate() {
        return dimissionDate;
    }

    public String getDimissionCause() {
        return dimissionCause;
    }

    public Date getDeleteWorkDate() {
        return deleteWorkDate;
    }

    public String getWorkDescription() {
        return workDescription;
    }


    public void setWorkDescription(String workDescription) {
        this.workDescription = workDescription;
    }

    public void setWorkExperienceID(long workExperienceID) {
        this.workExperienceID = workExperienceID;
    }

    public void setLoginID(long loginID) {
        this.loginID = loginID;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public void setDimissionDate(Date dimissionDate) {
        this.dimissionDate = dimissionDate;
    }

    public void setDimissionCause(String dimissionCause) {
        this.dimissionCause = dimissionCause;
    }

    public void setDeleteWorkDate(Date deleteWorkDate) {
        this.deleteWorkDate = deleteWorkDate;
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
        return "XzWorkExperience{" +
                "workExperienceID=" + workExperienceID +
                ", loginID=" + loginID +
                ", company='" + company + '\'' +
                ", duty='" + duty + '\'' +
                ", entryDate=" + entryDate +
                ", dimissionDate=" + dimissionDate +
                ", dimissionCause='" + dimissionCause + '\'' +
                ", workDescription='" + workDescription + '\'' +
                ", deleteWorkDate=" + deleteWorkDate +
                ", deleteFalt=" + deleteFalt +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                '}';
    }
}
