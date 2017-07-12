package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.GroupSequence;
import java.util.Date;

/**
 * 建立视频类别
 *
 * @author 王天岳
 * @create 2017-04-23 17:40
 **/
public class XzVideoClass {

    /**
     * 视频类别表ID
     */
    private long vclassID;
    /**
     * 类别名称
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String className;
    /**
     * 类别介绍
     */
    @NotEmpty(message="不能为空",groups = {F1.class})
    private String classIntroduce;
    /**
     * 删除日期
     */
    private Date deleteVclassDate;
    /**
     * 删除类型
     */
    private int deleteFalt;

    @Override
    public String toString() {
        return "XzVideoClass{" +
                "vclassID=" + vclassID +
                ", className='" + className + '\'' +
                ", classIntroduce='" + classIntroduce + '\'' +
                ", deleteVclassDate=" + deleteVclassDate +
                ", deleteFalt=" + deleteFalt +
                '}';
    }

    public Date getDeleteVclassDate() {
        return deleteVclassDate;
    }

    public void setDeleteVclassDate(Date deleteVclassDate) {
        this.deleteVclassDate = deleteVclassDate;
    }

    public String getClassIntroduce() {
        return classIntroduce;
    }

    public void setClassIntroduce(String classIntroduce) {
        this.classIntroduce = classIntroduce;
    }

    public long getVclassID() {
        return vclassID;
    }

    public void setVclassID(long vclassID) {
        this.vclassID = vclassID;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }



    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(int deleteFalt) {
        this.deleteFalt = deleteFalt;
    }

    //验证分组1
    public interface F1{

    }

    //组序列
    @GroupSequence( { XzLogin.F1.class})
    public interface Group {

    }
}
