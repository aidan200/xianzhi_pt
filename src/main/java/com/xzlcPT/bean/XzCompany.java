package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * bean层 XzCompany
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public class XzCompany {

    private long companyId;//公司表ID
    private long loginId;//登录表ID
    private String companyName;//公司名
    private String companyCity;
    private String companySpace;
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String companyLocation;//公司地址
    private Double companyY;
    private Double companyX;
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String companyPhone;//公司电话
    private String companyPicture;//公司标志 url
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String companyIntro;//公司简介
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String companyScale;//公司规模
    private int companyNature;//公司性质 1国企 2民营 3外企
    private String licence;//执照 url
    private int companyState;//执照审核状态 0审核中 1通过 2未通过
    private int isListing;//预留
    private String domain;//经营领域
    private String skill;//技术选型
    private String financing;// 种子期 天使期 A轮 B轮 C轮 D及以上 上市 不需要融资

    private List<XzCompanyWelfare> welfares;//公司福利
    private List<XzField> fields;//经营领域
    private List<XzCompanyProduct> products;//产品列表
    private List<Image> images;//公司风采
    private List<XzCompanyMien> miens;//公司风采
    private List<XzPostion> postions;//公司职位
    private List<XzCompanySkill> skills;//公司技能
    private List<XzCompanyDomain> domains;//经营领域2
    private Date deleteCompanyDate;//删除日期
    private int deleteFalt;//删除类型
    private String filed1;//备用列1
    private String filed2;//备用列2
    private String filed3;//备用列3
    private int pcount;//职位个数
    private Long followId;//关注ID
    private Date followTime;//关注时间

    public List<XzCompanyDomain> getDomains() {
        return domains;
    }

    public void setDomains(List<XzCompanyDomain> domains) {
        this.domains = domains;
    }

    public List<XzField> getFields() {
        return fields;
    }

    public void setFields(List<XzField> fields) {
        this.fields = fields;
    }

    public long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }

    public long getLoginId() {
        return loginId;
    }

    public void setLoginId(long loginId) {
        this.loginId = loginId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyLocation() {
        return companyLocation;
    }

    public void setCompanyLocation(String companyLocation) {
        this.companyLocation = companyLocation;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    public String getCompanyPicture() {
        return companyPicture;
    }

    public void setCompanyPicture(String companyPicture) {
        this.companyPicture = companyPicture;
    }

    public String getCompanyIntro() {
        return companyIntro;
    }

    public void setCompanyIntro(String companyIntro) {
        this.companyIntro = companyIntro;
    }

    public String getCompanyScale() {
        return companyScale;
    }

    public void setCompanyScale(String companyScale) {
        this.companyScale = companyScale;
    }

    public int getCompanyNature() {
        return companyNature;
    }

    public void setCompanyNature(int companyNature) {
        this.companyNature = companyNature;
    }

    public String getLicence() {
        return licence;
    }

    public void setLicence(String licence) {
        this.licence = licence;
    }

    public int getCompanyState() {
        return companyState;
    }

    public void setCompanyState(int companyState) {
        this.companyState = companyState;
    }

    public int getIsListing() {
        return isListing;
    }

    public void setIsListing(int isListing) {
        this.isListing = isListing;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getFinancing() {
        return financing;
    }

    public void setFinancing(String financing) {
        this.financing = financing;
    }

    public List<XzCompanyWelfare> getWelfares() {
        return welfares;
    }

    public void setWelfares(List<XzCompanyWelfare> welfares) {
        this.welfares = welfares;
    }

    public List<XzCompanyProduct> getProducts() {
        return products;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public void setProducts(List<XzCompanyProduct> products) {
        this.products = products;
    }

    public Date getDeleteCompanyDate() {
        return deleteCompanyDate;
    }

    public void setDeleteCompanyDate(Date deleteCompanyDate) {
        this.deleteCompanyDate = deleteCompanyDate;
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

    public void setPostions(List<XzPostion> postions) {
        this.postions = postions;
    }

    public List<XzPostion> getPostions() {
        return postions;
    }

    public void setPcount(int pcount) {
        this.pcount = pcount;
    }

    public int getPcount() {
        return pcount;
    }

    public void setCompanyCity(String companyCity) {
        this.companyCity = companyCity;
    }

    public String getCompanyCity() {
        return companyCity;
    }

    public void setCompanySpace(String companySpace) {
        this.companySpace = companySpace;
    }

    public String getCompanySpace() {
        return companySpace;
    }

    public void setCompanyX(Double companyX) {
        this.companyX = companyX;
    }

    public Double getCompanyX() {
        return companyX;
    }

    public void setCompanyY(Double companyY) {
        this.companyY = companyY;
    }

    public Double getCompanyY() {
        return companyY;
    }

    public void setMiens(List<XzCompanyMien> miens) {
        this.miens = miens;
    }

    public List<XzCompanyMien> getMiens() {
        return miens;
    }

    public void setSkills(List<XzCompanySkill> skills) {
        this.skills = skills;
    }

    public List<XzCompanySkill> getSkills() {
        return skills;
    }

    public void setFollowId(Long followId) {
        this.followId = followId;
    }

    public Long getFollowId() {
        return followId;
    }

    public void setFollowTime(Date followTime) {
        this.followTime = followTime;
    }

    public Date getFollowTime() {
        return followTime;
    }

    @Override
    public String toString() {
        return "XzCompany{" +
                "companyId=" + companyId +
                ", loginId=" + loginId +
                ", companyName='" + companyName + '\'' +
                ", companyCity='" + companyCity + '\'' +
                ", companySpace='" + companySpace + '\'' +
                ", companyLocation='" + companyLocation + '\'' +
                ", companyY=" + companyY +
                ", companyX=" + companyX +
                ", companyPhone='" + companyPhone + '\'' +
                ", companyPicture='" + companyPicture + '\'' +
                ", companyIntro='" + companyIntro + '\'' +
                ", companyScale='" + companyScale + '\'' +
                ", companyNature=" + companyNature +
                ", licence='" + licence + '\'' +
                ", companyState=" + companyState +
                ", isListing=" + isListing +
                ", domain='" + domain + '\'' +
                ", skill='" + skill + '\'' +
                ", financing='" + financing + '\'' +
                ", welfares=" + welfares +
                ", fields=" + fields +
                ", products=" + products +
                ", images=" + images +
                ", miens=" + miens +
                ", postions=" + postions +
                ", skills=" + skills +
                ", deleteCompanyDate=" + deleteCompanyDate +
                ", deleteFalt=" + deleteFalt +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", pcount=" + pcount +
                '}';
    }

    //验证分组1
    public interface F1{

    }

    //组序列
    @GroupSequence( { XzCompany.F1.class})
    public interface Group {

    }
}
