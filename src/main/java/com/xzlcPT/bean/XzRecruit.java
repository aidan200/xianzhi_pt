package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 建立招聘信息表
 *
 * @author 王天岳
 * @create 2017-05-02 13:43
 **/
public class XzRecruit {
    /**
     * 招聘信息表ID
     */
    private long recruitID;
    /**
     *  公司ID
     */
    private long companyID;
    /**
     *  公司名称
     */
    private String companyName;
    /**
     * 职位名称
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String jobName;
    /**
     *  最低月薪
     */
    @NotNull(message="不能为空",groups = {F1.class})
    private double monthlyMin;
    /**
     *  最高月薪
     */
    @NotNull(message="不能为空",groups = {F1.class})
    private double monthlyMax;
    /**
     *  工作地点
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String workplace;
    /**
     *  工作经验
     *  1. 无限制  2. 1-3年  3. 3-5年  4. 5年以上
     */
    private String workExperience;
    /**
     *  招聘人数
     *  1-5人 5-10人 10-15人 15-20人 20人以上
     */
    @NotNull(message="不能为空",groups = {F1.class})
    private String recNumber;
    /**
     *  工作性质
     */
    @NotNull(message="不能为空",groups = {F1.class})
    private int jobNature;
    /**
     *  学历要求
     */
    private int education;
    /**
     *  福利待遇
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String treatment;
    /**
     *  工作职责
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String obligation;
    /**
     *  详细地址
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String jobAddress;
    /**
     * 职位(1开发 2实施 3测试 4运维 5其他)
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String profession;
    /**
     * 发布日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date releaseDate;
    /**
     *  删除日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date deleteRecruitDate;
    /**
     *  删除类型
     */
    private int deleteFalt;
    /**
     *  备用列1
     */
    private String field1;
    /**
     *  备用列2
     */
    private String field2;
    /**
     *  备用列3
     */
    private String field3;

    /**
     * 查询条件
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date releaseDate2;

    @Override
    public String toString() {
        return "XzRecruit{" +
                "recruitID=" + recruitID +
                ", companyID=" + companyID +
                ", companyName='" + companyName + '\'' +
                ", jobName='" + jobName + '\'' +
                ", monthlyMin=" + monthlyMin +
                ", monthlyMax=" + monthlyMax +
                ", workplace='" + workplace + '\'' +
                ", workExperience=" + workExperience +
                ", recNumber=" + recNumber +
                ", jobNature=" + jobNature +
                ", education=" + education +
                ", treatment='" + treatment + '\'' +
                ", obligation='" + obligation + '\'' +
                ", jobAddress='" + jobAddress + '\'' +
                ", profession='" + profession + '\'' +
                ", releaseDate=" + releaseDate +
                ", deleteRecruitDate=" + deleteRecruitDate +
                ", deleteFalt=" + deleteFalt +
                ", field1='" + field1 + '\'' +
                ", field2='" + field2 + '\'' +
                ", field3='" + field3 + '\'' +
                ", releaseDate2=" + releaseDate2 +
                '}';
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public Date getReleaseDate2() {
        return releaseDate2;
    }

    public void setReleaseDate2(Date releaseDate2) {
        this.releaseDate2 = releaseDate2;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public long getRecruitID() {
        return recruitID;
    }

    public void setRecruitID(long recruitID) {
        this.recruitID = recruitID;
    }

    public long getCompanyID() {
        return companyID;
    }

    public void setCompanyID(long companyID) {
        this.companyID = companyID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public double getMonthlyMin() {
        return monthlyMin;
    }

    public void setMonthlyMin(double monthlyMin) {
        this.monthlyMin = monthlyMin;
    }

    public double getMonthlyMax() {
        return monthlyMax;
    }

    public void setMonthlyMax(double monthlyMax) {
        this.monthlyMax = monthlyMax;
    }

    public String getWorkplace() {
        return workplace;
    }

    public void setWorkplace(String workplace) {
        this.workplace = workplace;
    }

    public String getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(String workExperience) {
        this.workExperience = workExperience;
    }

    public String getRecNumber() {
        return recNumber;
    }

    public void setRecNumber(String recNumber) {
        this.recNumber = recNumber;
    }

    public int getJobNature() {
        return jobNature;
    }

    public void setJobNature(int jobNature) {
        this.jobNature = jobNature;
    }

    public int getEducation() {
        return education;
    }

    public void setEducation(int education) {
        this.education = education;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public String getObligation() {
        return obligation;
    }

    public void setObligation(String obligation) {
        this.obligation = obligation;
    }

    public String getJobAddress() {
        return jobAddress;
    }

    public void setJobAddress(String jobAddress) {
        this.jobAddress = jobAddress;
    }

    public Date getDeleteRecruitDate() {
        return deleteRecruitDate;
    }

    public void setDeleteRecruitDate(Date deleteRecruitDate) {
        this.deleteRecruitDate = deleteRecruitDate;
    }

    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(int deleteFalt) {
        this.deleteFalt = deleteFalt;
    }

    public String getField1() {
        return field1;
    }

    public void setField1(String field1) {
        this.field1 = field1;
    }

    public String getField2() {
        return field2;
    }

    public void setField2(String field2) {
        this.field2 = field2;
    }

    public String getField3() {
        return field3;
    }

    public void setField3(String field3) {
        this.field3 = field3;
    }


    //验证分组1
    public interface F1{

    }

    //组序列
    @GroupSequence( { XzRecruit.F1.class})
    public interface Group {

    }
}
