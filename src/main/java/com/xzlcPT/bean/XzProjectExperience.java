package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * bean层 XzProjectExperience
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public class XzProjectExperience {


    private long projectID;//项目经验表ID
    private long loginID;//登录表ID
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String projectName; //项目名称
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String projectDescribe; //项目描述
    @NotNull(message="不能为空",groups = {F1.class})
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate; //开始日期
    @NotNull(message="不能为空",groups = {F1.class})
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;   //结束日期
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String jobDuties;   //工作内容
    private Date deleteProjectDate; //删除时间
    private int deleteFalt; // 删除类型
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

    public long getProjectID() {
        return projectID;
    }

    public long getLoginID() {
        return loginID;
    }

    public String getProjectName() {
        return projectName;
    }

    public String getProjectDescribe() {
        return projectDescribe;
    }

    public Date getStartDate() {
        return startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public String getJobDuties() {
        return jobDuties;
    }

    public Date getDeleteProjectDate() {
        return deleteProjectDate;
    }

    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setProjectID(long projectID) {
        this.projectID = projectID;
    }

    public void setLoginID(long loginID) {
        this.loginID = loginID;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public void setProjectDescribe(String projectDescribe) {
        this.projectDescribe = projectDescribe;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public void setJobDuties(String jobDuties) {
        this.jobDuties = jobDuties;
    }

    public void setDeleteProjectDate(Date deleteProjectDate) {
        this.deleteProjectDate = deleteProjectDate;
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
    @GroupSequence( { XzWorkExperience.F1.class, XzWorkExperience.F2.class })
    public interface Group {

    }

    @Override
    public String toString() {
        return "XzProjectExperience{" +
                "projectID=" + projectID +
                ", loginID=" + loginID +
                ", projectName='" + projectName + '\'' +
                ", projectDescribe='" + projectDescribe + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", jobDuties='" + jobDuties + '\'' +
                ", deleteProjectDate=" + deleteProjectDate +
                ", deleteFalt=" + deleteFalt +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                '}';
    }
}
