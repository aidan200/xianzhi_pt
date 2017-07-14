package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzEducation;

import java.util.List;

/**
 * Service 层 EducationService
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface EducationService {

    //    根据member ID 查询
    List<XzEducation> selectEducationByID(long id);
    // 添加学历
    int insertEducation(XzEducation education);


    //    新增学历信息
    int addUserInfo(XzEducation ed);
    // memberId 查询
    List<XzEducation> selectMemberId(Long menberId);

    //    根据学历ID 修改学历信息
    int updateEducation(XzEducation ed);

    //    根据学历ID 删除学历信息

    int delateEducation(long edID);

    //     根据学历表ID 查询
    XzEducation selectEducationByEID(long edID);


    //    后台
//    查询用户信息
    PageBean<XzEducation> selAllEducationEnd(Integer page, Integer rows, XzEducation xzEducation);

    /**
     * 后台添加学历信息
     * @param xzEducation
     * @return
     */
    int addEducationEnd(XzEducation xzEducation);
    //    修改用户信息
    int updateEducationEnd(XzEducation xzEducation);

    //    删除用户信息
    int deleteEducationEnd(long eid);

    //    根据登录ID查询
    XzEducation selByLoginIDEnd(long eid);
}
