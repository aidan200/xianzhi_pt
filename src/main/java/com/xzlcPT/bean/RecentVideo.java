package com.xzlcPT.bean;

import java.util.Date;

/**
 * 查询最新发布的视频(带发布者头像)
 *
 * @author 王诗钰
 * @create 2017-05-17 14:26
 **/
public class RecentVideo {
    private Long videoId;//视频id
    private String memberName;//发布者姓名
    private String memberPicture;//发布者头像
    private String videoName;//视频名称
    private Date recordDate;//发布时间

    public Long getVideoId() {
        return videoId;
    }

    public void setVideoId(Long videoId) {
        this.videoId = videoId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberPicture() {
        return memberPicture;
    }

    public void setMemberPicture(String memberPicture) {
        this.memberPicture = memberPicture;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    @Override
    public String toString() {
        return "RecentVideo{" +
                "videoId=" + videoId +
                ", memberName='" + memberName + '\'' +
                ", memberPicture='" + memberPicture + '\'' +
                ", videoName='" + videoName + '\'' +
                ", recordDate=" + recordDate +
                '}';
    }
}
