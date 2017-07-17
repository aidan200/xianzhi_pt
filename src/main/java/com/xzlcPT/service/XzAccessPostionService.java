package com.xzlcPT.service;

import com.xzlcPT.bean.XzAccessPostion;

import java.util.List;

/**
 * Created by Administrator on 2017/7/17.
 */
public interface XzAccessPostionService {
    List<XzAccessPostion> selectByMemberId(Long memberId);
}
