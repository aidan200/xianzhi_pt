package com.xzlcPT.dao;

/**
 * mapper 层 WorkExperienceMapper
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/

import com.xzlcPT.bean.XzWorkExperience;

import java.util.List;

public interface WorkExperienceMapper {
    //    根据登录表ID 新增工作经验
    int addWorkExperience(XzWorkExperience workExperience);

    //    根据登录表ID 查询工作经验
    List<XzWorkExperience> selectWorkEByID(long id);

    /**
     * 后台添加工作经验
     * @param xzWorkExperience
     * @return
     */
    int addWorkEnd(XzWorkExperience xzWorkExperience);

    //    根据项目表D 修改工作经验
    int updateWorkE(XzWorkExperience ed);
    //    根据项目表ID 删除工作经验
    int delateWorkE(long ed);

    //    根据登录表ID 查询工作经验
    XzWorkExperience selectWorkEByWID(long id);

//    后台
//    查询全部工作经验信息
    List<XzWorkExperience> selAllWorkEEnd(XzWorkExperience xzWorkExperience);

    //    修改工作经验信息
    int updateWorkEEnd(XzWorkExperience xzWorkExperience);

    //    删除工作经验信息
    int deleteWorkEEnd(long wid);

    //    根据ID查询工作经验信息
    XzWorkExperience selByLoginIDEnd(long wid);


}
