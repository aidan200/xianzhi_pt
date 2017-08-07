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

    List<XzPostionSend> selSendCountByCorRId(Map map);

    Integer selisSend(Map map);

    int insertSelective(Map map);

    int selSendCount(Long resumeId);

    PageBean<XzResume> selByState(int page,int rows,Map map);

    PageBean<XzResume> selComCollect(int page,int rows,Long companyId);
}
