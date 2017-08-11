package com.xzlcPT.service.impl;/**
 * Created by Administrator on 2017/8/9.
 */

import com.xzlcPT.bean.XzResumeCollect;
import com.xzlcPT.dao.XzResumeCollectMapper;
import com.xzlcPT.service.XzResumeCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 甘汝雷
 * @create 2017-08-09 10:01
 **/
@Service("resumeCollectService")
public class XzResumeCollectServiceImpl implements XzResumeCollectService{
    @Autowired
    private XzResumeCollectMapper resumeCollectMapper;

    @Override
    public List<XzResumeCollect> selByCompanyId(Long companyId) {
        List<XzResumeCollect> list=resumeCollectMapper.selByCompanyId(companyId);
        return list;
    }

    @Override
    public int insertSelective(XzResumeCollect xzResumeCollect) {
        int i=resumeCollectMapper.insertSelective(xzResumeCollect);
        return i;
    }

    @Override
    public XzResumeCollect selectByPrimaryKey(Long collectId) {
        XzResumeCollect xzResumeCollect=resumeCollectMapper.selectByPrimaryKey(collectId);
        return xzResumeCollect;
    }

    @Override
    public int deleteByPrimaryKey(Long collectId) {
        int i=resumeCollectMapper.deleteByPrimaryKey(collectId);
        return i;
    }
}
