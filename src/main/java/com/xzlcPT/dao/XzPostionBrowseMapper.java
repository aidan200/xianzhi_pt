package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostionBrowse;

import java.util.List;

public interface XzPostionBrowseMapper {

    XzPostionBrowse selPCinfo(Long postionId);

    List<XzPostionBrowse> selectByMemberId(Long memberId);

    Integer selectCountByMemberId(Long memberId);

    int delLast(Long memberId);

    int deleteByPrimaryKey(Long browseId);

    int insert(XzPostionBrowse record);

    int insertSelective(XzPostionBrowse record);

    XzPostionBrowse selectByPrimaryKey(Long browseId);

    int updateByPrimaryKeySelective(XzPostionBrowse record);

    int updateByPrimaryKey(XzPostionBrowse record);
}