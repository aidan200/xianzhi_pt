package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzField;
import com.xzlcPT.bean.XzJobExp;
import com.xzlcPT.dao.XzJobExpMapper;
import com.xzlcPT.service.XzJobExpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public XzJobExp selectByJobExpId(Long jobExpId) {
        return jobExpMapper.selectByPrimaryKey(jobExpId);
    }

    @Override
    public int insertJobExp(XzJobExp jobExp) {
        int i = jobExpMapper.insert(jobExp);
        if(i==1){
            updateDomain(jobExp);
        }
        return i;
    }

    @Override
    public int updateJobExp(XzJobExp jobExp) {
        int i = jobExpMapper.updateByPrimaryKeySelective(jobExp);
        jobExpMapper.deleteDomainByJobId(jobExp.getJobexpId());
        if(i==1){
            updateDomain(jobExp);
        }
        return i;
    }

    private void updateDomain(XzJobExp jobExp){
        if(jobExp.getFields()!=null){
            for (XzField xzField : jobExp.getFields()) {
                Map map = new HashMap<>();
                map.put("jobexpId",jobExp.getJobexpId());
                map.put("fieldId",xzField.getFieldId());
                jobExpMapper.insertJobDomain(map);
            }
        }
    }

    @Override
    public int deleteJobExpById(Long jobExpId) {
        int i = jobExpMapper.deleteByPrimaryKey(jobExpId);
        jobExpMapper.deleteDomainByJobId(jobExpId);
        return i;
    }

}
