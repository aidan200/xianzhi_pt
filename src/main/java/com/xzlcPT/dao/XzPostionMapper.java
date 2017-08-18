package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostion;

import java.util.List;
import java.util.Map;

public interface XzPostionMapper {

    List<XzPostion> selPostionSendList(Map map);

    List<XzPostion> selPostionList(Map map);

    List<XzPostion> selPostionByListId(List<Long> ll);

    int deleteByPrimaryKey(Long postionId);

    int insert(XzPostion record);

    int insertSelective(XzPostion record);

    XzPostion selectByPrimaryKey(Long postionId);

    int updateByPrimaryKey(XzPostion record);

    List<XzPostion> selectByCompanyId(Long companyId);

    List<XzPostion> selectByConditions(XzPostion record);

    List<XzPostion> selectCityByComId(Long companyId);

    XzPostion selPostionInfo(Long postionId);

    List<XzPostion> selInfoByName(XzPostion xzPostion);

    List<XzPostion> selInfoByComId(XzPostion xzPostion);

    int insertPostion(Map map);

    int insertCollect(Map map);

    int deleteCollect(Long collectId);

    List<XzPostion> selectCollect(Long memberId);

    int updateState(XzPostion xzPostion);

    int selCollectState(Map map);

    List<XzPostion> selByCompanyId(long companyId);

//    以下为管理员用户操作方法
    List<XzPostion> selectAllByWelfare();

    int updateByWelfare(XzPostion xzPostion);
}