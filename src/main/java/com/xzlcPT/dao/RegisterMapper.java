package com.xzlcPT.dao;

import com.xzlcPT.bean.XzLogin;

/**
 * mapper 层 RegisterMapper
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface RegisterMapper {

//      用户注册
    int insertUser(XzLogin loginU);
//      用户激活
    int updateActiveCount(XzLogin activeCount);
//      根据用户名查询方法
    XzLogin selectByUser(XzLogin user);
//      根据用户名查询方法
    XzLogin selectByEmail(XzLogin user);

//      根据用户名查询(自定义判定用)
    XzLogin selectByUsername(String username);
//      根据邮箱查询(自定义判定用)
    XzLogin selectEmail(String email);
//      修改密码
    int updatePassword(XzLogin updatePassword);
//      根据账号,邮箱查询
    XzLogin getPassword(XzLogin getUser);
}
