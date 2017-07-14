package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzCompany;

import java.util.List;

/**
 * Created by Administrator on 2017/7/6.
 */
public interface XzCompanyService {
    int addCompany(XzCompany company);
    List<XzCompany> selectAllJob(List<XzCompany> clist);
    PageBean<XzCompany> selectPcount(Integer page, Integer rows, XzCompany xzCompany);
}