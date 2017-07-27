package com.xzlcPT.service;

import com.xzlcPT.bean.XzPostionBrowse;

import java.util.List;

/**
 * Created by Administrator on 2017/7/27.
 */
public interface XzPostionBrowseService {
    int insertPostionBrowse(Long postionId,Long memberId);
    List<XzPostionBrowse> selPostionBrowse(Long memberId);
}
