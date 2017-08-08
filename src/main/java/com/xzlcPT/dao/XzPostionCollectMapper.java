package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostionCollect;

import java.util.List;
import java.util.Map;

public interface XzPostionCollectMapper {

    List<XzPostionCollect> selectByMemberId(Long memberId);

    int deleteByPrimaryKey(Long collectId);

    int insert(XzPostionCollect record);

    int insertSelective(XzPostionCollect record);

    XzPostionCollect selectByPrimaryKey(Long collectId);

    int updateByPrimaryKeySelective(XzPostionCollect record);

    int updateByPrimaryKey(XzPostionCollect record);

    int selCollectState(XzPostionCollect xzPostionCollect);

    int deleteCollect(Long collectId);
}