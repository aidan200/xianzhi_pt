package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostionSend;
import com.xzlcPT.bean.XzResume;

import java.util.List;
import java.util.Map;

public interface XzPostionSendMapper {

    List<XzPostionSend> selSendByRIdAndType(Map map);

    Integer selisSend(Map map);

    List<XzPostionSend> selSendCountByCorRId(Map map);

    int deleteByPrimaryKey(Long sendId);

    int insert(XzPostionSend record);

    int insertSelective(XzPostionSend xzPostionSend);

    XzPostionSend selectByPrimaryKey(Long sendId);

    int updateByPrimaryKeySelective(XzPostionSend record);

    int updateByPrimaryKey(XzPostionSend record);

    int selSendCount(Long resumeId);

    List<XzPostionSend> selByState(Map map);

    List<XzPostionSend> selByType(Map map);

    List<XzPostionSend> selBysendId(Map map);

    List<XzResume> selComCollect(Map map);

    int updateState(Map map);

    int updateState1(Long sendId);

    List<XzPostionSend> selAll(Long companyId);

    Long selByCollect(XzPostionSend xzPostionSend);

    List<XzPostionSend> selByConditions(Map map);
}