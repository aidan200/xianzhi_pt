package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzAccessPostion;
import com.xzlcPT.dao.XzAccessPostionMapper;
import com.xzlcPT.service.XzAccessPostionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/17.
 */
@Service("accessPostionService")
public class XzAccessPostionServiceImpl implements XzAccessPostionService{

    @Autowired
    private XzAccessPostionMapper accessPostionMapper;

    @Override
    public List<XzAccessPostion> selectByMemberId(Long memberId) {
        return accessPostionMapper.selectByMemberId(memberId);
    }
}
