package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostionSend;
import com.xzlcPT.bean.XzResume;

import java.util.List;
import java.util.Map;

public interface XzPostionSendMapper {

    Integer selisSend(Map map);

    List<XzPostionSend> selSendCountByCorRId(Map map);

    int deleteByPrimaryKey(Long sendId);

    int insert(XzPostionSend record);

    int insertSelective(Map map);

    XzPostionSend selectByPrimaryKey(Long sendId);

    int updateByPrimaryKeySelective(XzPostionSend record);

    int updateByPrimaryKey(XzPostionSend record);

    int selSendCount(Long resumeId);

    List<XzPostionSend> selByState(Map map);

    List<XzResume> selComCollect(Long companyId);

    List<XzResume> selBysendId(List list);
}