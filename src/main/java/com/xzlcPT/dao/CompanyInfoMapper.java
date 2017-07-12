package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompany;

import java.util.List;

/**
 * mapper 层 CompanyInfoMapper
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface CompanyInfoMapper {
//    添加公司信息
    int insertCompanyInfo(XzCompany xzCompany);
//    根据公司名查询
    XzCompany selectByCompanyName(String companyName);
//      根据登录表ID查询
    XzCompany selectByLoginID(XzCompany loginID);
//        根据公司ID查询
    XzCompany selectByCompanyID(Long companyID);
//    修改公司信息
    int updateCompanyInfo(XzCompany xzCompany);

    //    后台
//    查询全部用户
    List<XzCompany> selAllCompanyEnd(XzCompany xzCompany);

    //    根据ID查询企业用户信息
    XzCompany selByLoginIDEnd(Long loginID);

    //    修改企业用户信息
    int updateCompanyEnd(XzCompany xzCompany);

    //    删除企业用户信息
    int deleteCompanyEnd(long loginID);



}
