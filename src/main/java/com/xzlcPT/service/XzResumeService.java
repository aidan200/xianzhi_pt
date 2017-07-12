package com.xzlcPT.service;

import com.xzlcPT.bean.XzResume;

/**
 * Created by Administrator on 2017/7/10.
 */
public interface XzResumeService {
    XzResume selectByMemberId(Long memberId);
    int updateResumeByFore(XzResume resume);
}
