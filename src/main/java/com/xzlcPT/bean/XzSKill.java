package com.xzlcPT.bean;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.GroupSequence;
import java.util.Date;

/**
 * 建立 技能掌握Bean层
 *
 * @author 王天岳
 * @create 2017-05-15 11:35
 **/
public class XzSKill {
    /**
     * 技能掌握表ID
     */
    private long skillID;
    /**
     * 登录表ID
     */
    private long loginID;
    /**
     * 技能名称
     */
    @NotEmpty(message="技能名称不能为空",groups = {F1.class})
    private String skillName;
    /**
     * 技能值
     */
    private int skillValue;
    /**
     * 删除日期
     */
    private Date deleteSkillDate;
    /**
     * 删除类型
     */
    private int deleteFalt;


    @Override
    public String toString() {
        return "XzSKill{" +
                "skillID=" + skillID +
                ", loginID=" + loginID +
                ", skillName=" + skillName +
                ", skillValue=" + skillValue +
                ", deleteSkillDate=" + deleteSkillDate +
                ", deleteFalt=" + deleteFalt +
                '}';
    }

    public long getSkillID() {
        return skillID;
    }

    public void setSkillID(long skillID) {
        this.skillID = skillID;
    }

    public long getLoginID() {
        return loginID;
    }

    public void setLoginID(long loginID) {
        this.loginID = loginID;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public int getSkillValue() {
        return skillValue;
    }

    public void setSkillValue(int skillValue) {
        this.skillValue = skillValue;
    }

    public Date getDeleteSkillDate() {
        return deleteSkillDate;
    }

    public void setDeleteSkillDate(Date deleteSkillDate) {
        this.deleteSkillDate = deleteSkillDate;
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
    @GroupSequence( { XzSKill.F1.class})
    public interface Group {

    }
}
