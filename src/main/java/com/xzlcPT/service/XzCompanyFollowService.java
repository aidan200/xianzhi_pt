package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzCompanyFollow;


/**
 * Created by Administrator on 2017/8/8.
 */
public interface XzCompanyFollowService {
    PageBean<XzCompanyFollow> selCompanyFollowByMemberId(int page, int rows, Long memberId);
}
