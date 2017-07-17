package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzField;

import java.util.List;

/**
 * Created by Administrator on 2017/7/6.
 */
public interface XzCompanyService {
    int addCompany(XzCompany company);
    PageBean<XzCompany> selectPcount(Integer page, Integer rows, XzCompany xzCompany);
    PageBean<XzCompany> selectDomain(Integer page, Integer rows, XzCompany xzCompany);
    XzCompany selCompanyInf(Long companyId);
}