package com.xzlcPT.service;


import com.util.PageBean;
import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzLogin;

import java.util.List;
import java.util.Map;

/**
 * Service 层 LoginUserService
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface LoginUserService {
    //    前台
    // 用户登录
    Map sellogin(String username,String passowrd);
    //个人用户登录
    int addUserForMember(XzLogin xzLogin);
    //企业用户登陆
    XzCompany addUserForCompany(XzLogin xzLogin);
    //按类型和id查询企业和个人信息
    XzLogin selLoginForMOrCById(Map map);

    //      后台
    // 管理员登陆
    XzLogin selAdmin(String username,String passowrd);
    //   查询登录信息
    PageBean<XzLogin> selAllLoginEnd(Integer page, Integer rows, XzLogin xzLogin);

    //  根据账号查询
    XzLogin selLoginByCountEnd(XzLogin xzLogin);

    //    增加用户
    int addLoginEnd(XzLogin xzLogin);

    //    修改登录表信息
    int updateLoginEnd(XzLogin xzLogin);

    //    删除登录表信息
    int deleteLoginEnd(long loginID);

    //    根据登录ID查询
    XzLogin selByLoginIDEnd(Long loginID);


}
