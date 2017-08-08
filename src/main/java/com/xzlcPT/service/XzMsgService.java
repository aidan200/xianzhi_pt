package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzMsg;

/**
 * Created by Administrator on 2017/8/8.
 */
public interface XzMsgService {
    PageBean<XzMsg> selectByReceiveId(int page,int rows,Long msgReceiveId);
}
