package com.xzlcPT.bean;


import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 	行业动态bean
 *  Create by 王诗钰 2017/4/17
 */
public class News {
    private Long newsId;//动态编号(主键)
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String newsWriter;//动态发布者
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String newsTitle;//动态标题
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String newsArticle;//动态内容
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message="不能为空",groups = {F1.class})
    private Date newsDate;//发布日期
    private Date deleteDate;//删除日期
    private String filed1;//备用字段1
    private String filed2;//备用字段2
    private String filed3;//备用字段3
    private Integer deleteFlag;//删除标记 0未删除 1删除

    public interface F1{
    }

    public interface F2{
    }

    @GroupSequence({News.F1.class,News.F2.class})
    public interface Group{

    }

    public Long getNewsId() {
        return newsId;
    }

    public void setNewsId(Long newsId) {
        this.newsId = newsId;
    }

    public String getNewsWriter() {
        return newsWriter;
    }

    public void setNewsWriter(String newsWriter) {
        this.newsWriter = newsWriter;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsArticle() {
        return newsArticle;
    }

    public void setNewsArticle(String newsArticle) {
        this.newsArticle = newsArticle;
    }

    public Date getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(Date newsDate) {
        this.newsDate = newsDate;
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
        return "News{" +
                "newsId=" + newsId +
                ", newsWriter='" + newsWriter + '\'' +
                ", newsTitle='" + newsTitle + '\'' +
                ", newsArticle='" + newsArticle + '\'' +
                ", newsDate=" + newsDate +
                ", deleteDate=" + deleteDate +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", deleteFlag=" + deleteFlag +
                '}';
    }
}
