package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;
/**
 * 建立video类
 *
 * @author 王天岳
 * @create 2017-04-21 17:21
 **/
public class XzVideo {
    /**
     * 视频表ID
     */
    private long videoID;
    /**
     * 登录表ID
     */
    private long loginID;
    /**
     * 用户名
     */
    private String memberName;
    /**
     * 视频预览图
     */
    private String videoPicture;
    /**
     * 视频名称
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String videoName;
    /**
     * 视频介绍
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String videoIntroduce;
    /**
     * 视频地址
     */
    private String videoAddress;
    /**
     * 视频类别
     */
    private int vclass;
    /**
     * 视频审核状态 3未审核  1通过  2未通过
     */
    private int videoType;
    /**
     * 视频价格
     */
    private double videoPrice;
    /**
     * 删除日期
     */
    private Date deleteVideoDate;
    /**
     * 删除类型
     */
    private int deleteFalt;
    /**
     * (查询用)
     * 类别名称
     */
    private String className;
    /**
     * (查询用)
     * 记录日期
     */
    private Date recordDate;

    public Date getRecordDate2() {
        return recordDate2;
    }

    public void setRecordDate2(Date recordDate2) {
        this.recordDate2 = recordDate2;
    }

    /**
     * (查询用)
     * 记录日期
     */
    private Date recordDate2;
    /**
     * 视频评论类型 (1.无评论 2.有评论)
     */
    private int videoDis;


    @Override
    public String toString() {
        return "XzVideo{" +
                "videoID=" + videoID +
                ", loginID=" + loginID +
                ", memberName='" + memberName + '\'' +
                ", videoPicture='" + videoPicture + '\'' +
                ", videoName='" + videoName + '\'' +
                ", videoIntroduce='" + videoIntroduce + '\'' +
                ", videoAddress='" + videoAddress + '\'' +
                ", vclass=" + vclass +
                ", videoType=" + videoType +
                ", videoPrice=" + videoPrice +
                ", deleteVideoDate=" + deleteVideoDate +
                ", deleteFalt=" + deleteFalt +
                ", className='" + className + '\'' +
                ", recordDate=" + recordDate +
                ", recordDate2=" + recordDate2 +
                ", videoDis=" + videoDis +
                '}';
    }

    public int getVideoDis() {
        return videoDis;
    }

    public void setVideoDis(int videoDis) {
        this.videoDis = videoDis;
    }

    public long getLoginID() {
        return loginID;
    }

    public void setLoginID(long loginID) {
        this.loginID = loginID;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public double getVideoPrice() {
        return videoPrice;
    }

    public void setVideoPrice(double videoPrice) {
        this.videoPrice = videoPrice;
    }

    public String getVideoIntroduce() {
        return videoIntroduce;
    }

    public void setVideoIntroduce(String videoIntroduce) {
        this.videoIntroduce = videoIntroduce;
    }

    public String getMemberName() {
        return memberName;
    }public void setMemberName(String memberName) {
        this.memberName = memberName;
    }public long getVideoID() {
        return videoID;
    }

    public void setVideoID(long videoID) {
        this.videoID = videoID;
    }

    public String getVideoPicture() {
        return videoPicture;
    }

    public void setVideoPicture(String videoPicture) {
        this.videoPicture = videoPicture;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public String getVideoAddress() {
        return videoAddress;
    }

    public void setVideoAddress(String videoAddress) {
        this.videoAddress = videoAddress;
    }

    public int getVclass() {
        return vclass;
    }

    public void setVclass(int vclass) {
        this.vclass = vclass;
    }

    public Date getDeleteVideoDate() {
        return deleteVideoDate;
    }

    public void setDeleteVideoDate(Date deleteVideoDate) {
        this.deleteVideoDate = deleteVideoDate;
    }

    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(int deleteFalt) {
        this.deleteFalt = deleteFalt;
    }


    public int getVideoType() {
        return videoType;
    }

    public void setVideoType(int videoType) {
        this.videoType = videoType;
    }



    //验证分组1
    public interface F1{

    }

    //组序列
    @GroupSequence( { XzLogin.F1.class})
    public interface Group {

    }
}
