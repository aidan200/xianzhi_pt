package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzCompanyFollow;

import java.util.Map;


/**
 * Created by Administrator on 2017/8/8.
 */
public interface XzCompanyFollowService {
    PageBean<XzCompanyFollow> selCompanyFollowByMemberId(int page, int rows, Long memberId);

    int  insertSelective(XzCompanyFollow xzCompanyFollow);

    int deleteByPrimaryKey(long followId);

    int selFollowState(Map map);
}
