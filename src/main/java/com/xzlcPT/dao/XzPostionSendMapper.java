package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostionSend;

public interface XzPostionSendMapper {
    int deleteByPrimaryKey(Long sendId);

    int insert(XzPostionSend record);

    int insertSelective(XzPostionSend record);

    XzPostionSend selectByPrimaryKey(Long sendId);

    int updateByPrimaryKeySelective(XzPostionSend record);

    int updateByPrimaryKey(XzPostionSend record);
}