package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.GroupSequence;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * 项目表
 *
 * @author 王诗钰
 * @create 2017-04-25 19:17
 **/
public class Item {
    private Long itemId;//项目编号(主键)
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String itemTitle;//项目标题
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String itemArticle;//项目简介
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String itemWriter;//发布者
    @NotNull(message="不能为空",groups = {F1.class})
    private Date itemTime;//发布时间
    private List<Image> itemImage;//项目图片
    private String filed1;//备用字段1
    private String filed2;//备用字段2
    private String filed3;//备用字段3
    private Integer deleteFlag;//删除标记(0未删除 1删除)

    public interface F1{
    }

    public interface F2{
    }

    @GroupSequence({Item.F1.class,Item.F2.class})
    public interface Group{

    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public String getItemTitle() {
        return itemTitle;
    }

    public void setItemTitle(String itemTitle) {
        this.itemTitle = itemTitle;
    }

    public String getItemArticle() {
        return itemArticle;
    }

    public void setItemArticle(String itemArticle) {
        this.itemArticle = itemArticle;
    }

    public String getItemWriter() {
        return itemWriter;
    }

    public void setItemWriter(String itemWriter) {
        this.itemWriter = itemWriter;
    }

    public Date getItemTime() {
        return itemTime;
    }

    public void setItemTime(Date itemTime) {
        this.itemTime = itemTime;
    }

    public List<Image> getItemImage() {
        return itemImage;
    }

    public void setItemImage(List<Image> itemImage) {
        this.itemImage = itemImage;
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
        return "Item{" +
                "itemId=" + itemId +
                ", itemTitle='" + itemTitle + '\'' +
                ", itemArticle='" + itemArticle + '\'' +
                ", itemWriter='" + itemWriter + '\'' +
                ", itemTime=" + itemTime +
                ", itemImage=" + itemImage +
                ", filed1='" + filed1 + '\'' +
                ", filed2='" + filed2 + '\'' +
                ", filed3='" + filed3 + '\'' +
                ", deleteFlag=" + deleteFlag +
                '}';
    }
}
