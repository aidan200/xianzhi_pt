package com.xzlcPT.dao;

import com.xzlcPT.bean.XzJobExp;

import java.util.List;

public interface XzJobExpMapper {

    List<XzJobExp> selectByResumeId(Long resumeId);

    int deleteByPrimaryKey(Long jobexpId);

    int insert(XzJobExp record);

    int insertSelective(XzJobExp record);

    XzJobExp selectByPrimaryKey(Long jobexpId);

    int updateByPrimaryKeySelective(XzJobExp record);

    int updateByPrimaryKey(XzJobExp record);
}