package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzWorkExperience;

import java.util.List;

/**
 * Service 层 WorkExperienceService
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface WorkExperienceService {
    //   根据登录ID 新增工作经验
    int addWorkExperience(XzWorkExperience we);

    //    根据登录表 ID 查询
    List<XzWorkExperience> selectWorkEByID(long id);


    //    根据工作经验表ID 修改工作经验
    int updateWorkE(XzWorkExperience wdID);

    //    根据工作经验表ID 删除工作经验

    int delateWorkE(long wdID);

    //      根据工作经验表ID 查询
    XzWorkExperience selectWorkEByWID(long id);

    //    后台
//    查询用户信息
    PageBean<XzWorkExperience> selAllWorkEEnd(Integer page, Integer rows, XzWorkExperience xzWorkExperience);

    /**
     * 添加工作经验
     * @param xzWorkExperience
     * @return
     */
    int addWorkEnd(XzWorkExperience xzWorkExperience);
    //    修改用户信息
    int updateWorkEEnd(XzWorkExperience xzWorkExperience);

    //    删除用户信息
    int deleteWorkEEnd(long wid);

    //    根据登录ID查询
    XzWorkExperience selByLoginIDEnd(long wid);


}
