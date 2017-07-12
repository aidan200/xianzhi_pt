package com.xzlcPT.bean;

/**
 * 图片管理表
 *
 * @author 王诗钰
 * @create 2017-05-12 16:58
 **/
public class Image {
    private Long imageId;//主键
    private String imageType;//图片类别(师资/活动/...)
    private String imagePath;//图片路径

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public String getImageType() {
        return imageType;
    }

    public void setImageType(String imageType) {
        this.imageType = imageType;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "Image{" +
                "imageId=" + imageId +
                ", imageType='" + imageType + '\'' +
                ", imagePath='" + imagePath + '\'' +
                '}';
    }
}
