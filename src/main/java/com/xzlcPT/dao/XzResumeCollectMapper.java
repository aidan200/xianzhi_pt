package com.xzlcPT.dao;

import com.xzlcPT.bean.XzResumeCollect;

import java.util.List;

public interface XzResumeCollectMapper {
    int deleteByPrimaryKey(Long collectId);

    int insert(XzResumeCollect record);

    int insertSelective(XzResumeCollect record);

    XzResumeCollect selectByPrimaryKey(Long collectId);

    int updateByPrimaryKeySelective(XzResumeCollect record);

    int updateByPrimaryKey(XzResumeCollect record);

    List<XzResumeCollect> selByCompanyId(Long companyId);
}