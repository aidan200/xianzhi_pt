package com.xzlcPT.bean;


import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * 	博客bean
 *  Create by 王诗钰 2017/4/17
 */
public class Blog {
    private Long blogId;//博客编号(主键)
    private Long loginId;//发帖人Id
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String blogTitle;//博客标题
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String blogArticle;//博客内容
    @NotNull(message="不能为空",groups = {F1.class})
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date blogTime;//发帖时间
    private XzLogin login;//发帖人
    private int lsum;//点赞数
    private String blogType;//发帖类型
    private String blogStyle;//原创/转载
    private String blogTag;//标签
    private String blogTypeSelf;//个人类型
    private String blogState;//博客状态 1 审批中 2 草稿 3 发表 4 未通过
    private String blogAbstract;//博客摘要

    private Date createTime;//创建日期
    private Date deleteDate;//删除日期
    private String filed1;//备用字段1
    private String filed2;//备用字段2
    private String filed3;//备用字段3
    private Integer deleteFlag;//删除标记 0未删除 1删除


    public interface F1{
    }

    public interface F2{
    }

    @GroupSequence({Blog.F1.class,Blog.F2.class})
    public interface Group{

    }

    public Long getBlogId() {
        return blogId;
    }

    public void setBlogId(Long blogId) {
        this.blogId = blogId;
    }

    public Long getLoginId() {
        return loginId;
    }

    public void setLoginId(Long loginId) {
        this.loginId = loginId;
    }

    public XzLogin getLogin() {
        return login;
    }

    public void setLogin(XzLogin login) {
        this.login = login;
    }

    public String getBlogType() {
        return blogType;
    }

    public void setBlogType(String blogType) {
        this.blogType = blogType;
    }

    public String getBlogStyle() {
        return blogStyle;
    }

    public void setBlogStyle(String blogStyle) {
        this.blogStyle = blogStyle;
    }

    public String getBlogTag() {
        return blogTag;
    }

    public void setBlogTag(String blogTag) {
        this.blogTag = blogTag;
    }

    public String getBlogTypeSelf() {
        return blogTypeSelf;
    }

    public void setBlogTypeSelf(String blogTypeSelf) {
        this.blogTypeSelf = blogTypeSelf;
    }

    public String getBlogState() {
        return blogState;
    }

    public void setBlogState(String blogState) {
        this.blogState = blogState;
    }

    public String getBlogAbstract() {
        return blogAbstract;
    }

    public void setBlogAbstract(String blogAbstract) {
        this.blogAbstract = blogAbstract;
    }

    public int getLsum() {
        return lsum;
    }

    public void setLsum(int lsum) {
        this.lsum = lsum;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogArticle() {
        return blogArticle;
    }

    public void setBlogArticle(String blogArticle) {
        this.blogArticle = blogArticle;
    }

    public Date getBlogTime() {
        return blogTime;
    }

    public void setBlogTime(Date blogTime) {
        this.blogTime = blogTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getDeleteDate() {
        return deleteDate;
    }

    public void setDeleteDate(Date deleteDate) {
        this.deleteDate = deleteDate;
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

    public Integer getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Integer deleteFlag) {
        this.deleteFlag = deleteFlag;
    }


    @Override
    public String toString() {
        return "Blog{" +
                "blogId=" + blogId +
                ", loginId=" + loginId +
                ", blogTitle='" + blogTitle + '\'' +
                ", blogArticle='" + blogArticle + '\'' +
                ", blogTime=" + blogTime +
                ", login=" + login +
                ", lsum=" + lsum +
                ", blogType='" + blogType + '\'' +
                ", blogStyle='" + blogStyle + '\'' +
                ", blogTag='" + blogTag + '\'' +
                ", blogTypeSelf='" + blogTypeSelf + '\'' +
                ", blogState='" + blogState + '\'' +
                ", blogAbstract='" + blogAbstract + '\'' +
                ", deleteDate=" + deleteDate +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", deleteFlag=" + deleteFlag +
                '}';
    }
}
