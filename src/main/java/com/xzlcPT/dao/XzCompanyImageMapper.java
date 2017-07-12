package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompanyImage;

public interface XzCompanyImageMapper {
    int deleteByPrimaryKey(Long imageId);

    int insert(XzCompanyImage record);

    int insertSelective(XzCompanyImage record);

    XzCompanyImage selectByPrimaryKey(Long imageId);

    int updateByPrimaryKeySelective(XzCompanyImage record);

    int updateByPrimaryKey(XzCompanyImage record);
}