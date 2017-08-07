package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzPostionSend;
import com.xzlcPT.dao.XzPostionSendMapper;
import com.xzlcPT.service.XzPostionSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    public Integer selisSend(Map map) {
        return postionSendMapper.selisSend(map);
    }

    @Override
    public int insertSelective(Map map) {
        int i=postionSendMapper.insertSelective(map);
        return i;
    }

    @Override
    public int selSendCount(Long resumeId) {
        int i=postionSendMapper.selSendCount(resumeId);
        return i;
    }

    @Override
    public Map selByState(Map map) {
        Map map1=postionSendMapper.selByState(map);
        return map1;
    }
}
