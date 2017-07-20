package com.xzlcPT.service.impl;/**
 * Created by Administrator on 2017/7/20.
 */

import com.xzlcPT.bean.XzShield;
import com.xzlcPT.dao.XzShieldMapper;
import com.xzlcPT.service.XzShieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 甘汝雷
 * @create 2017-07-20 13:23
 **/
@Service("xzShieldService")
public class XzShieldServiceImpl  implements XzShieldService{
    @Autowired
    private XzShieldMapper xzShieldMapper;

    @Override
    public List<XzShield> selByResumeId(Long resumeId) {
        List<XzShield> xzShield=xzShieldMapper.selByResumeId(resumeId);
        return xzShield;
    }

    @Override
    public int insertShield(XzShield xzShield) {
        int i=xzShieldMapper.insertShield(xzShield);
        return i;
    }
}
