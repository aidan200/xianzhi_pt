package com.xzlcPT.bean;


import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * 	活动bean
 *  Create by 王诗钰 2017/4/17
 */
public class Event {
    private Long eventId;//活动编号(主键)
    @NotNull(message="不能为空",groups = {F1.class})
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;//举办时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @NotNull(message="不能为空",groups = {F1.class})
    private Date endTime;//截止时间
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String eventPlace;//活动地点
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String eventBy;//主办人或主办方
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String eventWriter;//活动发布者
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String eventTitle;//活动标题
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String eventArticle;//活动内容简介
    private String eventType;//活动类别
    private List<Image> eventImage;//活动图片
    private Date deleteDate;//删除日期
    private String filed1;//备用字段1
    private String filed2;//备用字段2
    private String filed3;//备用字段3
    private Integer deleteFlag;//删除标记 0未删除 1删除

    public interface F1{
    }

    public interface F2{
    }

    @GroupSequence({Event.F1.class,Event.F2.class})
    public interface Group{

    }


    public Long getEventId() {
        return eventId;
    }

    public void setEventId(Long eventId) {
        this.eventId = eventId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getEventPlace() {
        return eventPlace;
    }

    public void setEventPlace(String eventPlace) {
        this.eventPlace = eventPlace;
    }

    public String getEventBy() {
        return eventBy;
    }

    public void setEventBy(String eventBy) {
        this.eventBy = eventBy;
    }

    public String getEventWriter() {
        return eventWriter;
    }

    public void setEventWriter(String eventWriter) {
        this.eventWriter = eventWriter;
    }

    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public String getEventArticle() {
        return eventArticle;
    }

    public void setEventArticle(String eventArticle) {
        this.eventArticle = eventArticle;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public List<Image> getEventImage() {
        return eventImage;
    }

    public void setEventImage(List<Image> eventImage) {
        this.eventImage = eventImage;
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
        return "Event{" +
                "eventId=" + eventId +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", eventPlace='" + eventPlace + '\'' +
                ", eventBy='" + eventBy + '\'' +
                ", eventWriter='" + eventWriter + '\'' +
                ", eventTitle='" + eventTitle + '\'' +
                ", eventArticle='" + eventArticle + '\'' +
                ", eventType='" + eventType + '\'' +
                ", eventImage=" + eventImage +
                ", deleteDate=" + deleteDate +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", deleteFlag=" + deleteFlag +
                '}';
    }


}
