package com.xzlcPT.dao;

import com.xzlcPT.bean.XzLogin;

import java.util.List;
import java.util.Map;

/**
 * mapper 层 LoginUserMapper
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface LoginUserMapper {

    //   前台
    //用户名和邮箱查询
    XzLogin selNE(Map map);
    //登录查询
    XzLogin loginNE(Map map);
    //按id和类型查询企业或个人信息
    XzLogin selLoginForMOrCById(Map map);


    //    后台
    //    查询登录表全部信息
    List<XzLogin> selAllLoginEnd(XzLogin xzLogin);

    //    根据用户名查询用户信息
    XzLogin selLoginByCountEnd(XzLogin xzLogin);

    //    添加用户信息
    int addLoginEnd(XzLogin xzLogin);

    //    修改登录表信息
    int updateLoginEnd(XzLogin xzLogin);

    //    删除登录表信息
    int deleteLoginEnd(long xzLogin);

    //    根据ID查询用户
    XzLogin selByLoginIDEnd(Long loginID);

}