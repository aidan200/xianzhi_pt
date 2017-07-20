package com.xzlcPT.service;


import com.xzlcPT.bean.XzLogin;

/**
 * Service 层 RegisterService
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface RegisterService {

    //    添加用户
    //int insertUser(XzLogin addUser);

    //    激活用户
    int updateActiveCount(XzLogin activeCount);

    //    根据用户名查询用户
    XzLogin selectByUser(XzLogin user);

    //    根据邮箱查询用户
    XzLogin selectByEmail(XzLogin user);

    //    (自定义判定用)
    XzLogin selectByCount(String user);

    //    (自定义判定用)
    XzLogin selectEmail(String email);

    //    密码找回
    int updatePassword(XzLogin updatePassword);
    //    根据账号邮箱查询
    XzLogin getPassword(XzLogin getUser);
}
