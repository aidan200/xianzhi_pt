package com.xzlcPT.dao;

import com.xzlcPT.bean.XzEducation;
import com.xzlcPT.bean.XzResume;

import java.util.List;
import java.util.Map;

public interface XzResumeMapper {
    XzResume selectByMemberId(Long memberId);

    int deleteByPrimaryKey(Long resumeId);

    int insert(XzResume record);

    int insertSelective(XzResume record);

    XzResume selectByPrimaryKey(Long resumeId);

    int updateByPrimaryKeySelective(XzResume record);

    int updateByPrimaryKey(XzResume record);

    XzResume selResumeInformation(Long resumeId);

    List<XzResume> selResumeByConditions(Map map);

    List<XzResume> selectRcount(Map map);

}