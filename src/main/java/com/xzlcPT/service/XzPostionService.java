package com.xzlcPT.service;

import com.amazonaws.services.dynamodbv2.xspec.L;
import com.util.PageBean;
import com.xzlcPT.bean.XzJobExp;
import com.xzlcPT.bean.XzPostion;

import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2017/7/11.
 */
public interface XzPostionService {

    PageBean<XzPostion> selPostionSendList(Map map,int page,int rows);

    PageBean<XzPostion> selPostionIndex(int page, int rows, Map map);

    PageBean<XzPostion> selectByCompanyId(int page,int rows, Long companyId);

    PageBean<XzPostion> selectByConditions(int page,int rows,XzPostion xzPostion);

    List<XzPostion> selectByComId(Long companyId);

    List<XzPostion> selectCityByComId(Long companyId);

    XzPostion selPostionInfo(Long postionId);

    List<XzPostion> selInfoByName(String postionName);

    List<XzPostion> selInfoByComId(XzPostion xzPostion);

    int insertPostion(Map map);

    int insertCollect(Map map);

    int deleteCollect(Long collectId);

    List<XzPostion> selectCollect(Long memberId);

}
