package com.xzlcPT.bean;

import java.util.Date;

/**
 * 建立视频记录表
 *
 * @author 王天岳
 * @create 2017-04-23 17:44
 **/
public class XzVideoRecord {
    /**
     * 视频记录表ID
     */
    private long recordID;
    /**
     *  登录表ID
     */
    private long loginID;
    /**
     * 视频ID
     */
    private long videoID;
    /**
     * 记录类型 1上传 2下载
     */
    private int recordType;
    /**
     * 记录日期
     */
    private Date recordDate;
    /**
     * (查询用)
     * 记录日期
     */
    private Date recordDate2;
    /**
     * 删除日期
     */
    private Date deleteRecordDate;
    /**
     * 删除类型
     */
    private int deleteFalt;


    @Override
    public String toString() {
        return "XzVideoRecord{" +
                "recordID=" + recordID +
                ", loginID=" + loginID +
                ", videoID=" + videoID +
                ", recordType=" + recordType +
                ", recordDate=" + recordDate +
                ", recordDate2=" + recordDate2 +
                ", deleteRecordDate=" + deleteRecordDate +
                ", deleteFalt=" + deleteFalt +
                '}';
    }

    public long getLoginID() {
        return loginID;
    }

    public void setLoginID(long loginID) {
        this.loginID = loginID;
    }

    public Date getRecordDate2() {
        return recordDate2;
    }

    public void setRecordDate2(Date recordDate2) {
        this.recordDate2 = recordDate2;
    }

    public long getRecordID() {
        return recordID;
    }

    public void setRecordID(long recordID) {
        this.recordID = recordID;
    }

    public long getVideoID() {
        return videoID;
    }

    public void setVideoID(long videoID) {
        this.videoID = videoID;
    }

    public int getRecordType() {
        return recordType;
    }

    public void setRecordType(int recordType) {
        this.recordType = recordType;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public Date getDeleteRecordDate() {
        return deleteRecordDate;
    }

    public void setDeleteRecordDate(Date deleteRecordDate) {
        this.deleteRecordDate = deleteRecordDate;
    }

    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(int deleteFalt) {
        this.deleteFalt = deleteFalt;
    }

}
