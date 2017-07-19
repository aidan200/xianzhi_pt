package com.xzlcPT.service;

import com.xzlcPT.bean.XzField;
import com.xzlcPT.bean.XzResume;
import com.xzlcPT.bean.XzResumeSkill;
import com.xzlcPT.bean.XzSKill;

import java.util.List;

/**
 * Created by Administrator on 2017/7/10.
 */
public interface XzResumeService {
    XzResume selectByMemberId(Long memberId);
    int updateResumeByFore(XzResume resume);
    XzResume selResumeInformation(Long resumeId);
}
