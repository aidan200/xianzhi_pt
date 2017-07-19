package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzField;
import com.xzlcPT.bean.XzResume;
import com.xzlcPT.bean.XzResumeSkill;
import com.xzlcPT.dao.XzFieldMapper;
import com.xzlcPT.dao.XzResumeMapper;
import com.xzlcPT.dao.XzResumeSkillMapper;
import com.xzlcPT.service.XzResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/10.
 */
@Service("resumeService")
public class XzResumeServiceImpl implements XzResumeService{
    @Autowired
    private XzResumeMapper resumeMapper;
    @Autowired
    private XzFieldMapper fieldMapper;
    @Autowired
    private XzResumeSkillMapper resumeSkillMapper;

    @Override
    public XzResume selectByMemberId(Long memberId) {
        return resumeMapper.selectByMemberId(memberId);
    }

    @Override
    public int updateResumeByFore(XzResume resume) {
        int i = resumeMapper.updateByPrimaryKeySelective(resume);
        if(resume.getFields()!=null){
            Map map = new HashMap<>();
            map.put("resumeId",resume.getResumeId());
            map.put("fieldType",resume.getFields().get(0).getFieldType());
            int i2 = fieldMapper.deleteByResumeDomain(map);
            int i3 = 1;
            for (XzField xzField : resume.getFields()) {
                map = new HashMap<>();
                map.put("resumeId",resume.getResumeId());
                map.put("fieldId",xzField.getFieldId());
                int i4 = fieldMapper.insertByResumeDomain(map);
                if(i4!=1){
                    i3 = i4;
                }
            }
            if(!(i2>0&&i3>0)){
                i = 0;
            }
        }
        return i;
    }

    @Override
    public XzResume selResumeInformation(Long resumeId) {
       XzResume xzResume=resumeMapper.selResumeInformation(resumeId);
        return xzResume;
    }

}
