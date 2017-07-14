package com.xzlcPT.dao;

import com.xzlcPT.bean.XzResumeEducation;

import java.util.List;

public interface XzResumeEducationMapper {

    List<XzResumeEducation> selectByResumeId(Long resumeId);

    int deleteByPrimaryKey(Long educationId);

    int insert(XzResumeEducation record);

    int insertSelective(XzResumeEducation record);

    XzResumeEducation selectByPrimaryKey(Long educationId);

    int updateByPrimaryKeySelective(XzResumeEducation record);

    int updateByPrimaryKey(XzResumeEducation record);
}