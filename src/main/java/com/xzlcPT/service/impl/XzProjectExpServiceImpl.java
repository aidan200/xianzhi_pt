package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzProjectExp;
import com.xzlcPT.dao.XzProjectExpMapper;
import com.xzlcPT.service.XzProjectExpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/10.
 */
@Service("projectExpService")
public class XzProjectExpServiceImpl implements XzProjectExpService{

    @Autowired
    private XzProjectExpMapper projectExpMapper;

    @Override
    public List<XzProjectExp> selectByResumeId(Long resumeId) {
        return projectExpMapper.selectByResumeId(resumeId);
    }
}
