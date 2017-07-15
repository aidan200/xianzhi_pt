package com.xzlcPT.service;

import com.xzlcPT.bean.XzJobExp;

import java.util.List;

/**
 * Created by Administrator on 2017/7/10.
 */
public interface XzJobExpService {
    List<XzJobExp> selectByResumeId(Long resumeId);
    XzJobExp selectByJobExpId(Long jobExpId);
    int insertJobExp(XzJobExp jobExp);
    int updateJobExp(XzJobExp jobExp);
    int deleteJobExpById(Long jobExpId);
}
