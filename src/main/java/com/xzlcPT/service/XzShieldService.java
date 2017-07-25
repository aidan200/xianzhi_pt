package com.xzlcPT.service;/**
 * Created by Administrator on 2017/7/20.
 */

import com.xzlcPT.bean.XzShield;

import java.util.List;

/**
 * @author 甘汝雷
 * @create 2017-07-20 13:21
 **/
public interface XzShieldService {
    List<XzShield> selByResumeId(Long resumeId);

    int insertShield(XzShield xzShield);

    int deleteByShieldId(Long shieldId);
}
