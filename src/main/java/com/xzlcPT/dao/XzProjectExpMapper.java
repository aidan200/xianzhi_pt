package com.xzlcPT.dao;

import com.xzlcPT.bean.XzProjectExp;

import java.util.List;

public interface XzProjectExpMapper {

    List<XzProjectExp> selectByResumeId(Long resumeId);

    int deleteByPrimaryKey(Long proexpId);

    int insert(XzProjectExp record);

    int insertSelective(XzProjectExp record);

    XzProjectExp selectByPrimaryKey(Long proexpId);

    int updateByPrimaryKeySelective(XzProjectExp record);

    int updateByPrimaryKey(XzProjectExp record);
}