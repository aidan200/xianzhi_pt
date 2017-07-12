package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzJobExp;
import com.xzlcPT.dao.XzJobExpMapper;
import com.xzlcPT.service.XzJobExpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/10.
 */
@Service("jobExpService")
public class XzJobExpServiceImpl implements XzJobExpService{

    @Autowired
    private XzJobExpMapper jobExpMapper;

    @Override
    public List<XzJobExp> selectByResumeId(Long resumeId) {
        return jobExpMapper.selectByResumeId(resumeId);
    }
}
