package com.xzlcPT.bean;/**
 * Created by Administrator on 2017/7/24.
 */

import com.amazonaws.services.dynamodbv2.xspec.L;

/**
 * @author 甘汝雷
 * @create 2017-07-24 12:30
 **/
public class XzCompanySkill {
    private Long skillId;

    private Long companyId;

    private String skillName;

    public void setSkillId(Long skillId) {
        this.skillId = skillId;
    }

    public Long getSkillId() {
        return skillId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getSkillName() {
        return skillName;
    }
}
