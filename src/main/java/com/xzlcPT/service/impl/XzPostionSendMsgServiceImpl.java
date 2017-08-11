package com.xzlcPT.service.impl;/**
 * Created by Administrator on 2017/8/10.
 */

import com.xzlcPT.bean.XzPostionSend;
import com.xzlcPT.bean.XzPostionSendMsg;
import com.xzlcPT.dao.XzPostionSendMsgMapper;
import com.xzlcPT.service.XzPostionSendMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 甘汝雷
 * @create 2017-08-10 13:21
 **/
@Service("postionSendMsgService")
public class XzPostionSendMsgServiceImpl implements XzPostionSendMsgService{
    @Autowired
    private XzPostionSendMsgMapper postionSendMsgMapper;

    @Override
    public int insertSelective(XzPostionSendMsg xzPostionSendMsg) {
        int i=postionSendMsgMapper.insertSelective(xzPostionSendMsg);
        return i;
    }

    @Override
    public int updateType(XzPostionSendMsg xzPostionSendMsg) {
        int i=postionSendMsgMapper.updateByPrimaryKeySelective(xzPostionSendMsg);
        return i;
    }
}
