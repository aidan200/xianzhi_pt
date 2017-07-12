package com.xzlcPT.bean;


import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.GroupSequence;
import java.util.Date;
import java.util.List;

/**
 * 	师资bean
 *  Create by 王诗钰 2017/4/17
 */
public class Teacher {
    private Long teacherId;//讲师编号(主键)
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String teacherName;//讲师姓名
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String subjectId;//所教科目
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String teacherLevel;//讲师级别(总监级，金牌级，普通级等)
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String teacherIntroduce;//讲师简介
    private List<Image> teacherImage;//师资图片
    private Date deleteDate;//删除日期
    private String filed1;//备用字段1
    private String filed2;//备用字段2
    private String filed3;//备用字段3
    private int deleteFlag;//删除标记 0未删除 1删除


    public Long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getTeacherLevel() {
        return teacherLevel;
    }

    public void setTeacherLevel(String teacherLevel) {
        this.teacherLevel = teacherLevel;
    }

    public String getTeacherIntroduce() {
        return teacherIntroduce;
    }

    public void setTeacherIntroduce(String teacherIntroduce) {
        this.teacherIntroduce = teacherIntroduce;
    }

    public List<Image> getTeacherImage() {
        return teacherImage;
    }

    public void setTeacherImage(List<Image> teacherImage) {
        this.teacherImage = teacherImage;
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

    public int getDeleteFlag() {
        return deleteFlag;
    }

    public void setDeleteFlag(int deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "teacherId=" + teacherId +
                ", teacherName='" + teacherName + '\'' +
                ", subjectId='" + subjectId + '\'' +
                ", teacherLevel='" + teacherLevel + '\'' +
                ", teacherIntroduce='" + teacherIntroduce + '\'' +
                ", teacherImage=" + teacherImage +
                ", deleteDate=" + deleteDate +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", deleteFlag=" + deleteFlag +
                '}';
    }

    public interface F1{
    }

    public interface F2{
    }

    @GroupSequence({Teacher.F1.class,Teacher.F2.class})
    public interface Group{
    }
}
