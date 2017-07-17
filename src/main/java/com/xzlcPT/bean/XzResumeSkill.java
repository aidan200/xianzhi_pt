package com.xzlcPT.bean;
//简历技能
public class XzResumeSkill {
    private Long skillId;

    private Long resumeId;

    private String skillName;

    private Integer skillType;

    private String skillValue;

    public Long getSkillId() {
        return skillId;
    }

    public void setSkillId(Long skillId) {
        this.skillId = skillId;
    }

    public Long getResumeId() {
        return resumeId;
    }

    public void setResumeId(Long resumeId) {
        this.resumeId = resumeId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName == null ? null : skillName.trim();
    }

    public Integer getSkillType() {
        return skillType;
    }

    public void setSkillType(Integer skillType) {
        this.skillType = skillType;
    }

    public String getSkillValue() {
        return skillValue;
    }

    public void setSkillValue(String skillValue) {
        this.skillValue = skillValue == null ? null : skillValue.trim();
    }
}