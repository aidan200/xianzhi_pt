package com.xzlcPT.dao;/**
 * Created by Administrator on 2017/7/20.
 */

import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzShield;

import java.util.List;

/**
 * @author 甘汝雷
 * @create 2017-07-20 13:20
 **/
public interface XzShieldMapper {
    List<XzShield> selByResumeId(Long resumeId);

    int insertShield(XzShield xzShield);

    int deleteByShieldId(Long shieldId);
}
