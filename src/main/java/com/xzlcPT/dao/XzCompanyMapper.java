package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompany;

public interface XzCompanyMapper {

    int addCompany(XzCompany company);

    XzCompany selCompanyInfo(Long id);

    int deleteByPrimaryKey(Long companyId);

    int insert(XzCompany record);

    int insertSelective(XzCompany record);

    XzCompany selectByPrimaryKey(Long companyId);

    int updateByPrimaryKeySelective(XzCompany record);

    int updateByPrimaryKey(XzCompany record);
}