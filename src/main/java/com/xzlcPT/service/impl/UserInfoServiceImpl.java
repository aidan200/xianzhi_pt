package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzMember;
import com.xzlcPT.dao.UserInfoMapper;
import com.xzlcPT.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * ServiceImpl 层 UserInfoServiceImpl
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService{
    @Autowired
    UserInfoMapper userInfoMapper;

    /**
     * 根据ID查询
     * @param id
     * @return
     */
    @Override
    public XzMember selectUserByID(Long id) {
        XzMember loginID = new XzMember();
        //loginID.setLoginId(id);
        XzMember xzMember = new XzMember();

        if (id!=null){
            xzMember = userInfoMapper.selectUserByID(loginID);
        }
        if(xzMember == null){
            return  new XzMember();
        }
        return xzMember;
    }

    /**
     * 添加用户信息
     * @param user
     * @return
     */
    @Override
    public int addUserInfo(XzMember user) {
        int a = 0;
        if (user!=null){
           a =  userInfoMapper.addUserInfo(user);
        }
        return a;
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @Override
    public int updateUserInfo(XzMember user) {
        int a = 0;
        if (user!=null){
            a = userInfoMapper.updateUserInfo(user);
        }
        return a;
    }
    /**
     * 后台方法
     */
    /**
     * 查询全部用户信息
     * @param page
     * @param rows
     * @param xzMember
     * @return
     */
    @Override
    public PageBean<XzMember> selAllUserInfoEnd(Integer page, Integer rows, XzMember xzMember) {
        PageHelper.startPage(page,rows);
        List<XzMember> memberList = userInfoMapper.selAllUserInfoEnd(xzMember);
        if(memberList==null){
            memberList = new ArrayList<XzMember>();
        }
        return new PageBean<XzMember>(memberList);
    }

    /**
     * 修改用户信息
     * @param xzMember
     * @return
     */
    @Override
    public int updateUserInfoEnd(XzMember xzMember) {
        return userInfoMapper.updateUserInfoEnd(xzMember);
    }

    /**
     * 删除用户信息
     * @param loginID
     * @return
     */
    @Override
    public int deleteUserInfoEnd(long loginID) {
        return userInfoMapper.deleteUserInfoEnd(loginID);
    }

    /**
     * 根据ID查询用户信息
     * @param loginID
     * @return
     */
    @Override
    public XzMember selByLoginIDEnd(Long loginID) {
        return userInfoMapper.selByLoginIDEnd(loginID);
    }

    /**
     * 根据member_id查询login_id
     * @param memberId
     * @return
     */
    @Override
    public XzMember selectLoginId(Long memberId){
        return userInfoMapper.selectLoginId(memberId);
    }
}
