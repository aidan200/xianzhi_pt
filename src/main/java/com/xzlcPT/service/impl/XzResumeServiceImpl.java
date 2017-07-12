package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzResume;
import com.xzlcPT.dao.XzResumeMapper;
import com.xzlcPT.service.XzResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/7/10.
 */
@Service("resumeService")
public class XzResumeServiceImpl implements XzResumeService{
    @Autowired
    private XzResumeMapper resumeMapper;

    @Override
    public XzResume selectByMemberId(Long memberId) {
        return resumeMapper.selectByMemberId(memberId);
    }

    @Override
    public int updateResumeByFore(XzResume resume) {
        //XzResume oldRe = resumeMapper.selectByPrimaryKey(resume.getResumeId());
        return resumeMapper.updateByPrimaryKeySelective(resume);
    }

}
