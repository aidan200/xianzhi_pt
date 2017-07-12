package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompanyProduct;

public interface XzCompanyProductMapper {
    int deleteByPrimaryKey(Long productId);

    int insert(XzCompanyProduct record);

    int insertSelective(XzCompanyProduct record);

    XzCompanyProduct selectByPrimaryKey(Long productId);

    int updateByPrimaryKeySelective(XzCompanyProduct record);

    int updateByPrimaryKey(XzCompanyProduct record);
}