package com.xzlcPT.dao;

import com.xzlcPT.bean.XzEducation;
import com.xzlcPT.bean.XzResume;

public interface XzResumeMapper {
    XzResume selectByMemberId(Long memberId);

    int deleteByPrimaryKey(Long resumeId);

    int insert(XzResume record);

    int insertSelective(XzResume record);

    XzResume selectByPrimaryKey(Long resumeId);

    int updateByPrimaryKeySelective(XzResume record);

    int updateByPrimaryKey(XzResume record);

    XzResume selResumeInformation(Long resumeId);
}