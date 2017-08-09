package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzMsg;

/**
 * Created by Administrator on 2017/8/8.
 */
public interface XzMsgService {
    PageBean<XzMsg> selectByReceiveId(int page,int rows,Long msgReceiveId);
    int deleteById (Long msgId);
    XzMsg updateToReadById(Long msgId);
    int deleteAll(Long [] ids);
    int noReadCount(Long msgReceiveId);
}
