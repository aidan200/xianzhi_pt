package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompanyWelfare;

import java.util.List;

public interface XzCompanyWelfareMapper {
    int deleteByPrimaryKey(Long welfareId);

    int insertAll(List<XzCompanyWelfare> list);

    int insert(XzCompanyWelfare record);

    int insertSelective(XzCompanyWelfare record);

    XzCompanyWelfare selectByPrimaryKey(Long welfareId);

    int updateByPrimaryKeySelective(XzCompanyWelfare record);

    int updateByPrimaryKey(XzCompanyWelfare record);
}