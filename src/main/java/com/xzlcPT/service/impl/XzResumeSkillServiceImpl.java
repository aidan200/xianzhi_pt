package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzResumeSkill;
import com.xzlcPT.dao.XzResumeSkillMapper;
import com.xzlcPT.service.XzResumeSkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/17.
 */
@Service("resumeSkillService")
public class XzResumeSkillServiceImpl implements XzResumeSkillService{

    @Autowired
    private XzResumeSkillMapper resumeSkillMapper;

    @Override
    public List<XzResumeSkill> selSkillByResumeId(Long resumeId) {
        return resumeSkillMapper.selectByResumeId(resumeId);
    }

    @Override
    public int insertSkillByResume(List<XzResumeSkill> resumeSkills) {
        int i = 1;
        if(resumeSkills!=null&&resumeSkills.size()!=0){
            Long resumeId = resumeSkills.get(0).getResumeId();
            resumeSkillMapper.deleteByResumeId(resumeId);
        }
        for (XzResumeSkill resumeSkill : resumeSkills) {
            int i2 = resumeSkillMapper.insert(resumeSkill);
            if(i2==0){
                i = 0;
            }
        }
        if(i==0){
            i = i/0;
        }
        return i;
    }


}
