package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzPostionSend;
import com.xzlcPT.bean.XzResume;
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
    public PageBean<XzResume> selByState(int page,int rows,Map map) {
        PageHelper.startPage(page,rows);
        List<XzResume> list=postionSendMapper.selByState(map);
        PageBean pageBean=new PageBean(list);
        return pageBean;
    }
}
