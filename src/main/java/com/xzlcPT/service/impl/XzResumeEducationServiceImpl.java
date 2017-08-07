package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzResumeEducation;
import com.xzlcPT.dao.XzResumeEducationMapper;
import com.xzlcPT.service.XzResumeEducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017/7/14.
 */
@Service("resumeEducationService")
public class XzResumeEducationServiceImpl implements XzResumeEducationService{

    @Autowired
    private XzResumeEducationMapper resumeEducationMapper;

    @Override
    public List<XzResumeEducation> selectByResumeId(Long resumeId) {
        return resumeEducationMapper.selectByResumeId(resumeId);
    }

    @Override
    public XzResumeEducation selectById(Long educationId) {
        return resumeEducationMapper.selectByPrimaryKey(educationId);
    }

    @Override
    public int insertEducation(XzResumeEducation education) {
        return resumeEducationMapper.insert(education);
    }

    @Override
    public int updateEducation(XzResumeEducation education) {
        return resumeEducationMapper.updateByPrimaryKeySelective(education);
    }

    @Override
    public int deleteEducation(Long educationId) {
        return resumeEducationMapper.deleteByPrimaryKey(educationId);
    }
}
