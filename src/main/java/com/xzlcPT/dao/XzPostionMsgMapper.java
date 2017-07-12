package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostionMsg;

public interface XzPostionMsgMapper {
    int deleteByPrimaryKey(Long pmsgId);

    int insert(XzPostionMsg record);

    int insertSelective(XzPostionMsg record);

    XzPostionMsg selectByPrimaryKey(Long pmsgId);

    int updateByPrimaryKeySelective(XzPostionMsg record);

    int updateByPrimaryKey(XzPostionMsg record);
}