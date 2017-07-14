package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompany;

import java.util.List;

public interface XzCompanyMapper {

    int addCompany(XzCompany company);

    XzCompany selCompanyInfo(Long id);

    int deleteByPrimaryKey(Long companyId);

    int insert(XzCompany record);

    int insertSelective(XzCompany record);

    XzCompany selectByPrimaryKey(Long companyId);

    int updateByPrimaryKeySelective(XzCompany record);

    int updateByPrimaryKey(XzCompany record);

    List<XzCompany> selectAllJob(List<Long> list);

    List<XzCompany> selectPcount(XzCompany record);



}