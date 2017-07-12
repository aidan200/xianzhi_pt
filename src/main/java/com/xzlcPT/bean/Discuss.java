package com.xzlcPT.bean;


import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * 	评论bean
 *  Create by 王诗钰 2017/4/17
 */
public class Discuss {
    private Long discussId;//评论编号(主键)
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String discussWriter;//评论人
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String discussArticle;//评论内容
    private List<Discuss> replyId;//回复
    @NotNull(message="不能为空",groups = {F1.class})
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date discussTime;//评论时间
    private Long blogId;//被评论的博客编号
    private Integer exist;//该条评论是否有回复 0没有 1有
    private String discussType;//评论类型(博客/视频)
    private Date deleteDate;//删除日期
    private String filed1;//备用字段1
    private String filed2;//备用字段2
    private String filed3;//备用字段3
    private Integer deleteFlag;//删除标记 0未删除 1删除

    private Long memberID;//用户ID
    private String memberPicture;//用户头像

    public interface F1{
    }

    public interface F2{
    }
    public interface F3{
    }
    @GroupSequence({Discuss.F1.class,Discuss.F2.class})
    public interface Group{

    }

    public Long getMemberID() {
        return memberID;
    }

    public void setMemberID(Long memberID) {
        this.memberID = memberID;
    }

    public String getMemberPicture() {
        return memberPicture;
    }

    public void setMemberPicture(String memberPicture) {
        this.memberPicture = memberPicture;
    }

    public Long getDiscussId() {
        return discussId;
    }

    public void setDiscussId(Long discussId) {
        this.discussId = discussId;
    }

    public String getDiscussWriter() {
        return discussWriter;
    }

    public void setDiscussWriter(String discussWriter) {
        this.discussWriter = discussWriter;
    }

    public String getDiscussArticle() {
        return discussArticle;
    }

    public void setDiscussArticle(String discussArticle) {
        this.discussArticle = discussArticle;
    }

    public List<Discuss> getReplyId() {
        return replyId;
    }

    public void setReplyId(List<Discuss> replyId) {
        this.replyId = replyId;
    }

    public Date getDiscussTime() {
        return discussTime;
    }

    public void setDiscussTime(Date discussTime) {
        this.discussTime = discussTime;
    }

    public Long getBlogId() {
        return blogId;
    }

    public void setBlogId(Long blogId) {
        this.blogId = blogId;
    }

    public Integer getExist() {
        return exist;
    }

    public void setExist(Integer exist) {
        this.exist = exist;
    }

    public String getDiscussType() {
        return discussType;
    }

    public void setDiscussType(String discussType) {
        this.discussType = discussType;
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
        return "Discuss{" +
                "discussId=" + discussId +
                ", discussWriter='" + discussWriter + '\'' +
                ", discussArticle='" + discussArticle + '\'' +
                ", replyId=" + replyId +
                ", discussTime=" + discussTime +
                ", blogId=" + blogId +
                ", exist=" + exist +
                ", discussType='" + discussType + '\'' +
                ", deleteDate=" + deleteDate +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", deleteFlag=" + deleteFlag +
                '}';
    }
}