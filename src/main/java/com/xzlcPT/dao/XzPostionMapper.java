package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostion;

import java.util.List;

public interface XzPostionMapper {

    List<XzPostion> selPostionList(XzPostion postion);

    List<XzPostion> selPostionByListId(List<Long> ll);

    int deleteByPrimaryKey(Long postionId);

    int insert(XzPostion record);

    int insertSelective(XzPostion record);

    XzPostion selectByPrimaryKey(Long postionId);

    int updateByPrimaryKeySelective(XzPostion record);

    int updateByPrimaryKey(XzPostion record);
}