package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.dao.RegisterMapper;
import com.xzlcPT.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * ServiceImpl 层 RegisterServiceImpl
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Service("registerService")
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    private RegisterMapper registerMapper;

    /**
     * 用户注册方法
     * @param addUser
     * @return
     */
    @Override
    public int insertUser(XzLogin addUser) {
        int a = 0;
        if (addUser!=null){
            a =  registerMapper.insertUser(addUser);
        }
        return a;
    }

    /**
     * 用户激活方法
     * @param activeCount
     * @return
     */
    @Override
    public int updateActiveCount(XzLogin activeCount) {
         return registerMapper.updateActiveCount(activeCount);
    }

    /**
     * 根据用户名查询用户
     * @param user
     * @return
     */
    @Override
    public XzLogin selectByUser(XzLogin user) {
        XzLogin newUser = new XzLogin();
        if (user != null){
            newUser = registerMapper.selectByUser(user);
        }
        return newUser;
    }

    /**
     * 根据邮箱查询
     * @param user
     * @return
     */
    @Override
    public XzLogin selectByEmail(XzLogin user) {
        XzLogin newUser = new XzLogin();
        if (user != null){
            newUser = registerMapper.selectByEmail(user);
        }
        return newUser;
    }

    /**
     * 自定义判定用 (根据用户名查询)
     * @param user
     * @return
     */
    @Override
    public XzLogin selectByCount(String user) {
        if(user != null){
            XzLogin newUser = registerMapper.selectByUsername(user);
            return newUser;
        }else{
            return null;
        }
    }

    /**
     * 自定义判定用(根据邮箱查询)
     * @param email
     * @return
     */
    @Override
    public XzLogin selectEmail(String email) {
        if (email != null) {
            XzLogin newUser = registerMapper.selectEmail(email);
            return newUser;
        }
        return null;
    }

    /**
     * 修改密码方法
     * @param updatePassword
     * @return
     */
    @Override
    public int updatePassword(XzLogin updatePassword) {
        int a = 0;
        if (updatePassword!=null){
            a = registerMapper.updatePassword(updatePassword);
        }
        return a;
    }

    /**
     * 密码找回方法
     * @param getUser
     * @return
     */
    @Override
    public XzLogin getPassword(XzLogin getUser) {
        XzLogin newUser  = new XzLogin();
        if(getUser!=null){
            newUser = registerMapper.getPassword(getUser);
        }
        return newUser;
    }
}
