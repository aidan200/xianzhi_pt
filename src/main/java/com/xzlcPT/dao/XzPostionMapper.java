package com.xzlcPT.dao;

import com.xzlcPT.bean.XzPostion;

import java.util.List;
import java.util.Map;

public interface XzPostionMapper {

    List<XzPostion> selPostionList(Map map);

    List<XzPostion> selPostionByListId(List<Long> ll);

    int deleteByPrimaryKey(Long postionId);

    int insert(XzPostion record);

    int insertSelective(XzPostion record);

    XzPostion selectByPrimaryKey(Long postionId);

    int updateByPrimaryKeySelective(XzPostion record);

    int updateByPrimaryKey(XzPostion record);

    List<XzPostion> selectByCompanyId(Long companyId);

    List<XzPostion> selectByConditions(XzPostion record);

    List<XzPostion> selectCityByComId(Long companyId);
}