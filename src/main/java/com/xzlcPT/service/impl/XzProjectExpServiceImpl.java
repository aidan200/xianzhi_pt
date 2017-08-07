package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzProjectExp;
import com.xzlcPT.dao.XzProjectExpMapper;
import com.xzlcPT.service.XzProjectExpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    public XzProjectExp selectByProjectExpId(Long projectExpId) {
        return projectExpMapper.selectByPrimaryKey(projectExpId);
    }

    @Override
    public int insertProjectExp(XzProjectExp projectExp) {
        return projectExpMapper.insert(projectExp);
    }

    @Override
    public int updateProjectExp(XzProjectExp projectExp) {
        return projectExpMapper.updateByPrimaryKeySelective(projectExp);
    }

    @Override
    public int deleteProjectExpById(Long projectExpId) {
        return projectExpMapper.deleteByPrimaryKey(projectExpId);
    }
}
