package com.xzlcPT.dao;

import com.xzlcPT.bean.XzMsg;

import java.util.List;

public interface XzMsgMapper {

    List<XzMsg> selectByReceiveId(Long msgReceiveId);

    int deleteByPrimaryKey(Long msgId);

    int insert(XzMsg record);

    int insertSelective(XzMsg record);

    XzMsg selectByPrimaryKey(Long msgId);

    int updateByPrimaryKeySelective(XzMsg record);

    int updateByPrimaryKey(XzMsg record);
}