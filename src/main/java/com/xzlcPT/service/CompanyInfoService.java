package com.xzlcPT.service;


import com.util.PageBean;
import com.xzlcPT.bean.XzCompany;

/**
 * Service 层 CompanyInfoService
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface CompanyInfoService {
    //公司详情
    XzCompany selCompanyInfo(Long id);
//    添加公司信息
    int insertCompanyInfo(XzCompany companyInfo);
//    根据公司名称曾查询
    XzCompany selectByCompany(String companyName);
//    根据登录ID查询
    XzCompany selectByLoginID(long loginID);
//     修改公司信息
    int updateCompanyInfo(XzCompany xzCompany);
//      根据公司ID查询
    XzCompany selectByCompanyID(long companyID);
    //    后台
//    查询用户信息
    PageBean<XzCompany> selAllCompanyEnd(Integer page, Integer rows, XzCompany xzCompany);

    //    修改用户信息
    int updateCompanyEnd(XzCompany xzCompany);

    //    删除用户信息
    int deleteCompanyEnd(long loginID);

    //    根据登录ID查询
    XzCompany selByLoginIDEnd(Long loginID);

}
