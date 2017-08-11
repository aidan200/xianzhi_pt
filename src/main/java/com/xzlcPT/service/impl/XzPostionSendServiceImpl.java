package com.xzlcPT.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.dao.*;
import com.xzlcPT.service.XzPostionSendService;
import com.xzlcPT.service.XzPostionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/26.
 */
@Service("postionSendService")
public class XzPostionSendServiceImpl implements XzPostionSendService {

    @Autowired
    private XzPostionSendMapper postionSendMapper;
    @Autowired
    private XzPostionMapper postionMapper;
    @Autowired
    private XzCompanyMapper companyMapper;
    @Autowired
    private XzCompanyDomainMapper companyDomainMapper;
    @Autowired
    private XzPostionSendMsgMapper postionSendMsgMapper;

    @Override
    public PageBean<XzPostionSend> selSendByRIdAndType(int page,int rows,Long resumeId, Integer type) {
        Map sMap = new HashMap();
        if(type!=8){
            sMap.put("type",type);
        }
        sMap.put("resumeId",resumeId);
        PageHelper.startPage(page,rows);
        List<XzPostionSend> postionSends = postionSendMapper.selSendByRIdAndType(sMap);
        postionSends.forEach(ps->{
            XzPostion postion = postionMapper.selectByPrimaryKey(ps.getPostionId());
            XzCompany company = companyMapper.selectByPrimaryKey(ps.getCompanyId());
            XzPostionSendMsg postionSendMsg = postionSendMsgMapper.selectBySendId(ps.getSendId());
            List<XzCompanyDomain> companyDomains = companyDomainMapper.selectByCompanyId(company.getCompanyId());
            company.setDomains(companyDomains);
            ps.setPostion(postion);
            ps.setCompany(company);
            ps.setPostionSendMsg(postionSendMsg);
        });
        return new PageBean<>(postionSends);
    }

    @Override
    public List<XzPostionSend> selSendCountByCorRId(Map map) {
        return postionSendMapper.selSendCountByCorRId(map);
    }

    @Override
    public Integer selisSend(Map map) {
        return postionSendMapper.selisSend(map);
    }

    @Override
    public int insertSelective(XzPostionSend xzPostionSend) {
        int i=postionSendMapper.insertSelective(xzPostionSend);
        return i;
    }

    @Override
    public int selSendCount(Long resumeId) {
        int i=postionSendMapper.selSendCount(resumeId);
        return i;
    }

    @Override
    public PageBean<XzPostionSend> selByState(int page,int rows,Map map) {
        PageHelper.startPage(page,rows);
        List<XzPostionSend> list2=postionSendMapper.selByState(map);
        PageBean pageBean=new PageBean(list2);
        List<XzPostionSend> list1=pageBean.getList();
        List<Long> list=new ArrayList<>();
        for(XzPostionSend xzPostionSend:list1){
            list.add(xzPostionSend.getSendId());
        }
        List<XzPostionSend> postionSendList=postionSendMapper.selBysendId(list);
        pageBean.setList(postionSendList);
        return pageBean;
    }

    @Override
    public PageBean<XzPostionSend> selByType(int page, int rows, Map map) {
        PageHelper.startPage(page,rows);
        List<XzPostionSend> list2=postionSendMapper.selByType(map);
        PageBean pageBean=new PageBean(list2);
        List<XzPostionSend> list1=pageBean.getList();
        List<Long> list=new ArrayList<>();
        for(XzPostionSend xzPostionSend:list1){
            list.add(xzPostionSend.getSendId());
        }
        List<XzPostionSend> postionSendList=postionSendMapper.selBysendId(list);
        pageBean.setList(postionSendList);
        return pageBean;
    }

    @Override
    public PageBean<XzResume> selComCollect(int page, int rows,Map map) {
        PageHelper.startPage(page,rows);
        List<XzResume> list=postionSendMapper.selComCollect(map);
        PageBean pageBean=new PageBean(list);
        List<XzResume> list1=pageBean.getList();
        return pageBean;
    }

    @Override
    public int deleteByPrimaryKey(Long sendId) {
        int i=postionSendMapper.deleteByPrimaryKey(sendId);
        return i;
    }

    @Override
    public int updateState(Long sendId) {
        int i=postionSendMapper.updateState(sendId);
        return i;
    }

    @Override
    public int updateState1(Long sendId) {
       int i=postionSendMapper.updateState1(sendId);
        return i;
    }

    @Override
    public PageBean<XzPostionSend> selAll(int page, int rows, Long companyId) {
        PageHelper.startPage(page,rows);
        List<XzPostionSend> list2=postionSendMapper.selAll(companyId);
        PageBean pageBean=new PageBean(list2);
        List<XzPostionSend> list1=pageBean.getList();
        List<Long> list=new ArrayList<>();
        for(XzPostionSend xzPostionSend:list1){
            list.add(xzPostionSend.getSendId());
        }
        List<XzPostionSend> postionSendList=postionSendMapper.selBysendId(list);
        pageBean.setList(postionSendList);
        return pageBean;
    }

    @Override
    public Long selByCollect(XzPostionSend xzPostionSend) {
        Long sendId = postionSendMapper.selByCollect(xzPostionSend);
        return sendId;
    }

    @Override
    public PageBean<XzPostionSend> selByConditions(int page, int rows, Map map) {
        PageHelper.startPage(page,rows);
        List<XzPostionSend> list2=postionSendMapper.selByConditions(map);
        PageBean pageBean=new PageBean(list2);
        List<XzPostionSend> list1=pageBean.getList();
        List<Long> list=new ArrayList<>();
        for(XzPostionSend xzPostionSend:list1){
            list.add(xzPostionSend.getSendId());
        }
        for(int i=0;i<list.size();i++){
            System.out.println(list.get(i));
        }
        List<XzPostionSend> postionSendList=postionSendMapper.selBysendId(list);
        pageBean.setList(postionSendList);
        return pageBean;
    }


}
