package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostionSend;

import java.util.List;
import java.util.Map;

public interface XzPostionSendMapper {

    List<XzPostionSend> selSendCountByCorRId(Map map);

    int deleteByPrimaryKey(Long sendId);

    int insert(XzPostionSend record);

    int insertSelective(XzPostionSend record);

    XzPostionSend selectByPrimaryKey(Long sendId);

    int updateByPrimaryKeySelective(XzPostionSend record);

    int updateByPrimaryKey(XzPostionSend record);
}