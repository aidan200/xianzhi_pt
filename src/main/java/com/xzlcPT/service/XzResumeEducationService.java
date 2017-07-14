package com.xzlcPT.service;

import com.xzlcPT.bean.XzResumeEducation;

import java.util.List;

/**
 * Created by Administrator on 2017/7/14.
 */
public interface XzResumeEducationService {

    List<XzResumeEducation> selectByResumeId(Long resumeId);

    XzResumeEducation selectById(Long educationId);

    int insertEducation(XzResumeEducation education);

    int updateEducation(XzResumeEducation education);

    int deleteEducation(Long educationId);

}
