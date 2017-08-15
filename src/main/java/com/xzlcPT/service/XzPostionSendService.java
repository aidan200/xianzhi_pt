package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.bean.XzPostionSend;
import com.xzlcPT.bean.XzResume;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/17.
 */
public interface XzPostionSendService {

    PageBean<XzPostionSend> selSendByRIdAndType(int page,int rows,Long resumeId,Integer type);

    List<XzPostionSend> selSendCountByCorRId(Map map);

    Integer selisSend(Map map);

    int insertSelective(XzPostionSend xzPostionSend);

    int selSendCount(Long resumeId);

    PageBean<XzPostionSend> selByState(int page,int rows,Map map);

    PageBean<XzPostionSend> selByType(int page,int rows,Map map);

    PageBean<XzResume> selComCollect(int page,int rows,Map map);

    int deleteByPrimaryKey(Long sendId);

    int updateState(Map map);

    int updateState1(Long sendId);

    Long selByCollect(XzPostionSend xzPostionSend);

    PageBean<XzPostionSend> selByConditions(int page,int rows,Map map);
}
