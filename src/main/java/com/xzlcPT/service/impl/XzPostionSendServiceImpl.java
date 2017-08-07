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

import java.util.ArrayList;
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
        List<XzPostionSend> list2=postionSendMapper.selByState(map);
        PageBean pageBean=new PageBean(list2);
        List<XzResume> list1=pageBean.getList();
        List<Long>  list=new ArrayList<>();
        for(XzPostionSend xzPostionSend:list2){
            list.add(xzPostionSend.getSendId());
        }
        List<XzResume> resumeList=postionSendMapper.selBysendId(list);
        pageBean.setList(resumeList);
        return pageBean;
    }

    @Override
    public PageBean<XzResume> selComCollect(int page, int rows, Long companyId) {
        PageHelper.startPage(page,rows);
        List<XzResume> list=postionSendMapper.selComCollect(companyId);
        PageBean pageBean=new PageBean(list);
        List<XzResume> list1=pageBean.getList();
        return pageBean;
    }


}
