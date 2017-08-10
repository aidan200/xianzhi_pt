package com.xzlcPT.service;/**
 * Created by Administrator on 2017/8/9.
 */

import com.xzlcPT.bean.XzResumeCollect;

import java.util.List;

/**
 * @author 甘汝雷
 * @create 2017-08-09 9:47
 **/
public interface XzResumeCollectService {

    List<XzResumeCollect> selByCompanyId(Long companyId);

    int insertSelective(XzResumeCollect xzResumeCollect);

    XzResumeCollect selectByPrimaryKey(Long collectId);
}
