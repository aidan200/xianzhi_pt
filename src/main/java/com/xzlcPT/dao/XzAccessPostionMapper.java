package com.xzlcPT.dao;

import com.xzlcPT.bean.XzAccessPostion;

import java.util.List;

public interface XzAccessPostionMapper {

    List<XzAccessPostion> selectByMemberId(Long memberId);

    int deleteByPrimaryKey(Long accessId);

    int insert(XzAccessPostion record);

    int insertSelective(XzAccessPostion record);

    XzAccessPostion selectByPrimaryKey(Long accessId);

    int updateByPrimaryKeySelective(XzAccessPostion record);

    int updateByPrimaryKey(XzAccessPostion record);
}