package com.xzlcPT.dao;

import com.xzlcPT.bean.XzResumeBrowse;

public interface XzResumeBrowseMapper {
    int deleteByPrimaryKey(Long browseId);

    int insert(XzResumeBrowse record);

    int insertSelective(XzResumeBrowse record);

    XzResumeBrowse selectByPrimaryKey(Long browseId);

    int updateByPrimaryKeySelective(XzResumeBrowse record);

    int updateByPrimaryKey(Long browseId);

    int selCountByResumeId(Long resumeId);
}