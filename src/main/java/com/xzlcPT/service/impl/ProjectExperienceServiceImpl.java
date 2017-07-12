package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzProjectExperience;
import com.xzlcPT.dao.ProjectExperienceMapper;
import com.xzlcPT.service.ProjectExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * ServiceImpl 层 ProjectExperienceServiceImpl
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Service("projectExperienceService")
public class ProjectExperienceServiceImpl implements ProjectExperienceService {
    @Autowired
    ProjectExperienceMapper projectExperienceMapper;
    /**
     * 前台方法
     */
    /**
     * 添加项目经验
     * @param pe
     * @return
     */
    @Override
    public int addProjectExperience(XzProjectExperience pe) {
        int a = 0;
        if(pe!=null){
            a = projectExperienceMapper.addProject(pe);
        }
        return 0;
    }

    /**
     * 根据ID查询
     * @param id
     * @return
     */
    @Override
    public List<XzProjectExperience> selectProjectByID(long id) {
        List<XzProjectExperience> projectList = new ArrayList<XzProjectExperience>();
        if(id!=0){
            projectList = projectExperienceMapper.selectProjectByID(id);
        }
        return projectList;
    }

    /**
     * 修改项目经验
     * @param pID
     * @return
     */
    @Override
    public int updateProject(XzProjectExperience pID) {
        int a = 0;
        if(pID!=null){
            a = projectExperienceMapper.updateProject(pID);
        }
        return a;
    }

    /**
     * 是演出项目经验
     * @param pID
     * @return
     */
    @Override
    public int delateProject(long pID) {
        int a = 0;
        if(pID!=0){
            a = projectExperienceMapper.delateProject(pID);
        }
        return a;
    }

    /**
     * 根据项目表ID查询项目经验
     * @param id
     * @return
     */
    @Override
    public XzProjectExperience selectProjectByPID(long id) {
        XzProjectExperience project1 = projectExperienceMapper.selByLoginIDEnd(id);
        return project1;
    }
    /**
     * 后台方法
     */
    /**
     * 根据条件查询项目经验
     * @param page
     * @param rows
     * @param xzProjectExperience
     * @return
     */
    @Override
    public PageBean<XzProjectExperience> selAllProjectEEnd(Integer page, Integer rows, XzProjectExperience xzProjectExperience) {
        PageHelper.startPage(page,rows);
        List<XzProjectExperience> projectList = projectExperienceMapper.selAllProjectEEnd(xzProjectExperience);
        return new PageBean<XzProjectExperience>(projectList);
    }

    /**
     * 添加项目经验
     * @param xzProjectExperience
     * @return
     */
    @Override
    public int addProjectEnd(XzProjectExperience xzProjectExperience) {
        return projectExperienceMapper.addProjectEnd(xzProjectExperience);
    }

    /**
     * 修改项目经验
     * @param xzProjectExperience
     * @return
     */
    @Override
    public int updateProjectEEnd(XzProjectExperience xzProjectExperience) {
        return projectExperienceMapper.updateProjectEEnd(xzProjectExperience);
    }

    /**
     * 删除项目经验
     * @param pid
     * @return
     */
    @Override
    public int deleteProjectEEnd(long pid) {
        return projectExperienceMapper.deleteProjectEEnd(pid);
    }

    /**
     * 根据ID查询项目经验
     * @param pid
     * @return
     */
    @Override
    public XzProjectExperience selByLoginIDEnd(Long pid) {
        return projectExperienceMapper.selByLoginIDEnd(pid);
    }
}
