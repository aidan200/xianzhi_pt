package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompanyDomain;

import java.util.List;

public interface XzCompanyDomainMapper {

    List<XzCompanyDomain> selectByCompanyId(Long companyId);

    int deleteByPrimaryKey(Long domainId);

    int insert(XzCompanyDomain record);

    int insertSelective(XzCompanyDomain record);

    XzCompanyDomain selectByPrimaryKey(Long domainId);

    int updateByPrimaryKeySelective(XzCompanyDomain record);

    int updateByPrimaryKey(XzCompanyDomain record);
}