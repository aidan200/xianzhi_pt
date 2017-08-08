package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzPostionCollect;

/**
 * Created by Administrator on 2017/8/8.
 */
public interface XzPostionCollectService {

    PageBean<XzPostionCollect> selCollectByMemberId(int page, int rows, Long memberId);

    int insertSelective(XzPostionCollect xzPostionCollect);

    int selCollectState(XzPostionCollect xzPostionCollect);

    int deleteCollect(Long collectId);

}
