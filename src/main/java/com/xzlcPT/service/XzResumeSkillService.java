package com.xzlcPT.service;

import com.xzlcPT.bean.XzResumeSkill;

import java.util.List;

/**
 * Created by Administrator on 2017/7/17.
 */
public interface XzResumeSkillService {
    List<XzResumeSkill> selSkillByResumeId(Long resumeId);
    int insertSkillByResume(List<XzResumeSkill> resumeSkills);
}
