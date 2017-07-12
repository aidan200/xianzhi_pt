package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzProjectExperience;

import java.util.List;

/**
 * Service 层 ProjectExperienceService
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
public interface ProjectExperienceService {
    //   根据登录ID 新增项目经验
    int addProjectExperience(XzProjectExperience pe);

    //    根据登录表 ID 查询
    List<XzProjectExperience> selectProjectByID(long id);


    //    根据学历ID 修改工作经验
    int updateProject(XzProjectExperience pID);

    //    根据学历ID 删除工作经验

    int delateProject(long pID);

    //    根据学历ID 查询
    XzProjectExperience selectProjectByPID(long id);


    //    后台
//    查询用户信息
    PageBean<XzProjectExperience> selAllProjectEEnd(Integer page, Integer rows, XzProjectExperience xzProjectExperience);

    /**
     * 添加工作经验
     * @param xzProjectExperience
     * @return
     */
    int addProjectEnd(XzProjectExperience xzProjectExperience);
    //    修改用户信息
    int updateProjectEEnd(XzProjectExperience xzProjectExperience);

    //    删除用户信息
    int deleteProjectEEnd(long pid);

    //    根据登录ID查询
    XzProjectExperience selByLoginIDEnd(Long pid);


}
