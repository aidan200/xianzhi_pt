package com.xzlcPT.dao;

/**
 * mapper 层 UserInfoMapper
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
import com.xzlcPT.bean.XzMember;

import java.util.List;

public interface UserInfoMapper {
    //    根据登录表ID 查询用户信息
    XzMember selectUserByID(XzMember id);

    //    根据登录表ID 修改用户信息
    int updateUserInfo(XzMember user);

    //    根据登录表ID 新增用户信息
    int addUserInfo(XzMember user);
//    根据登录表ID 删除用户信息

    //    后台
//    查询全部用户
    List<XzMember> selAllUserInfoEnd(XzMember xzMember);

    //    修改登录表信息
    int updateUserInfoEnd(XzMember xzMember);

    //    删除登录表信息
    int deleteUserInfoEnd(long loginID);

    //    根据ID查询用户
    XzMember selByLoginIDEnd(long loginID);

    //根据member_id查询login_id
    XzMember selectLoginId(Long memberId);
}
