package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostionSendMsg;

public interface XzPostionSendMsgMapper {
    int deleteByPrimaryKey(Long pmsgId);

    int insert(XzPostionSendMsg record);

    int insertSelective(XzPostionSendMsg record);

    XzPostionSendMsg selectByPrimaryKey(Long pmsgId);

    int updateByPrimaryKeySelective(XzPostionSendMsg record);

    int updateByPrimaryKey(XzPostionSendMsg record);
}