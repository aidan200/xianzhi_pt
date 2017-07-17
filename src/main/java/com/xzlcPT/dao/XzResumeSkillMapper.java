package com.xzlcPT.dao;

import com.xzlcPT.bean.XzResumeSkill;

import java.util.List;

public interface XzResumeSkillMapper {

    int deleteByResumeId(Long resumeId);

    List<XzResumeSkill> selectByResumeId(Long resumeId);

    int deleteByPrimaryKey(Long skillId);

    int insert(XzResumeSkill record);

    int insertSelective(XzResumeSkill record);

    XzResumeSkill selectByPrimaryKey(Long skillId);

    int updateByPrimaryKeySelective(XzResumeSkill record);

    int updateByPrimaryKey(XzResumeSkill record);
}