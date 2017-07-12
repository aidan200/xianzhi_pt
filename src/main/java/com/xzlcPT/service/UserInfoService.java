package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzMember;

/**
 * Service 层 UserInfoService
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface UserInfoService {
//    根据登录表ID 查询用户信息
    XzMember selectUserByID (Long id);

//    新增用户信息
    int addUserInfo (XzMember user);

//    修改用户信息
    int updateUserInfo(XzMember user);

//    后台
//    查询用户信息
    PageBean<XzMember> selAllUserInfoEnd(Integer page, Integer rows, XzMember xzMember);

    //    修改用户信息
    int updateUserInfoEnd(XzMember xzMember);

    //    删除用户信息
    int deleteUserInfoEnd(long loginID);

    //    根据登录ID查询
    XzMember selByLoginIDEnd(Long loginID);

    //根据member_id查询login_id
    XzMember selectLoginId(Long memberId);
}
