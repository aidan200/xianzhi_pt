package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzField;
import com.xzlcPT.bean.XzResume;
import com.xzlcPT.bean.XzResumeSkill;
import com.xzlcPT.bean.XzSKill;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/10.
 */
public interface XzResumeService {

    XzResume selectById(Long resumeId);

    XzResume selectByMemberId(Long memberId);

    int updateResumeByFore(XzResume resume);

    XzResume selResumeInformation(Long resumeId);

    PageBean<XzResume> selectRcount(Integer page,Integer rows,Map map);

    //XzResume selectCompletionById(Long id);

    int insertCollect(Map map);

    int deleteCollect(Long collectId);

    List<XzResume> selectCollect(Long companyId);

    PageBean<XzResume> selResume(Integer page,Integer rows,Map map);

    PageBean<XzResume> selAllResume(Integer page,Integer rows,XzResume xzResume);

    int deleteByPrimaryKey(Long resumeId);

    XzResume selectByPrimaryKey(Long resumeId);
}
