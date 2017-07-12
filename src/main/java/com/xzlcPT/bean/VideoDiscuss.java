package com.xzlcPT.bean;

import java.util.Date;
import java.util.List;

/**
 * 视频评论bean
 *
 * @author 王诗钰
 * @create 2017-05-17 17:47
 **/
public class VideoDiscuss {
    private Long videoId;//视频编号
    private Long discussId;//评论编号
    private String discussWriter;//评论人
    private String discussArticle;//评论内容
    private String memberPicture;//评论人头像
    private Date discussTime;//评论时间
    private Integer deleteFlag;//评论删除标记(0未删除 1删除)
    private List<Discuss> replyId;//回复

    public Long getVideoId() {
        return videoId;
    }

    public void setVideoId(Long videoId) {
        this.videoId = videoId;
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

    public String getMemberPicture() {
        return memberPicture;
    }

    public void setMemberPicture(String memberPicture) {
        this.memberPicture = memberPicture;
    }

    public Date getDiscussTime() {
        return discussTime;
    }

    public void setDiscussTime(Date discussTime) {
        this.discussTime = discussTime;
    }

    public Integer getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(Integer deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public List<Discuss> getReplyId() {
        return replyId;
    }

    public void setReplyId(List<Discuss> replyId) {
        this.replyId = replyId;
    }

    @Override
    public String toString() {
        return "VideoDiscuss{" +
                "videoId=" + videoId +
                ", discussId=" + discussId +
                ", discussWriter='" + discussWriter + '\'' +
                ", discussArticle='" + discussArticle + '\'' +
                ", memberPicture='" + memberPicture + '\'' +
                ", discussTime=" + discussTime +
                ", deleteFlag=" + deleteFlag +
                ", replyId=" + replyId +
                '}';
    }
}
