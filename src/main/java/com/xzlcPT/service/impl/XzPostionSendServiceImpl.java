package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzPostionSend;
import com.xzlcPT.dao.XzPostionSendMapper;
import com.xzlcPT.service.XzPostionSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/26.
 */
@Service("postionSendService")
public class XzPostionSendServiceImpl implements XzPostionSendService {

    @Autowired
    private XzPostionSendMapper postionSendMapper;

    @Override
    public List<XzPostionSend> selSendCountByCorRId(Map map) {
        return postionSendMapper.selSendCountByCorRId(map);
    }
}