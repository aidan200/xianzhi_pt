package com.xzlcPT.dao;

/**
 * mapper 层 ProjectExperienceMapper
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/

import com.xzlcPT.bean.XzProjectExperience;

import java.util.List;

public interface ProjectExperienceMapper {
    //    根据登录表ID 新增项目经验
    int addProject(XzProjectExperience projectExperience);
    //    根据登录表ID 查询项目信息
    List<XzProjectExperience> selectProjectByID(long id);


    /**
     * 添加项目经验
     * @param xzProjectExperience
     * @return
     */
    int addProjectEnd(XzProjectExperience xzProjectExperience);

    //    根据项目表D 修改项目信息
    int updateProject(XzProjectExperience ed);
    //    根据项目表ID 删除项目信息
    int delateProject(long ed);

    //    根据项目表ID 查询项目信息
    XzProjectExperience selectProjectByPID(long id);

    //    后台
//    查询全部项目经验信息
    List<XzProjectExperience> selAllProjectEEnd(XzProjectExperience xzProjectExperience);

    //    修改项目经验信息
    int updateProjectEEnd(XzProjectExperience xzProjectExperience);

    //    删除项目经验信息
    int deleteProjectEEnd(long pid);

    //    根据ID查询项目经验信息
    XzProjectExperience selByLoginIDEnd(Long pid);

}
