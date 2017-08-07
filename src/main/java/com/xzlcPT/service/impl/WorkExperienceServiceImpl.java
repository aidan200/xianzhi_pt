package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzWorkExperience;
import com.xzlcPT.dao.WorkExperienceMapper;
import com.xzlcPT.service.WorkExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * ServiceImpl 层 WorkExperienceServiceImpl
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Service("workExperienceService")
public class WorkExperienceServiceImpl implements WorkExperienceService {
    @Autowired
    WorkExperienceMapper workExperienceMapper;

    /**
     * 添加工作经验
     * @param we
     * @return
     */
    @Override
    public int addWorkExperience(XzWorkExperience we) {
        int a = 0;
        if (we != null) {
            a = workExperienceMapper.addWorkExperience(we);
        }
        return a;
    }

    /**
     * 根据用户ID查询工作经验
     * @param id
     * @return
     */
    @Override
    public List<XzWorkExperience> selectWorkEByID(long id) {
        List<XzWorkExperience> workList = new ArrayList<XzWorkExperience>();
        if (id != 0) {
            workList = workExperienceMapper.selectWorkEByID(id);
        }
        return workList;
    }

    /**
     * 修改工作经验
     * @param wdID
     * @return
     */
    @Override
    public int updateWorkE(XzWorkExperience wdID) {
        int a = 0;
        if (wdID != null) {
            a = workExperienceMapper.updateWorkE(wdID);
        }
        return a;
    }

    /**
     * 删除工作经验
     * @param wdID
     * @return
     */
    @Override
    public int delateWorkE(long wdID) {
        int a = 0;
        if (wdID != 0) {
            a = workExperienceMapper.delateWorkE(wdID);
        }
        return a;
    }

    /**
     * 根据工作经验表ID查询工作经验
     * @param id
     * @return
     */
    @Override
    public XzWorkExperience selectWorkEByWID(long id) {
        XzWorkExperience xzWorkExperience1 = new XzWorkExperience();
        System.out.println("service:" + id);
        xzWorkExperience1 = workExperienceMapper.selectWorkEByWID(id);
        return xzWorkExperience1;
    }
    /**
     * 后台方法
     */
    /**
     * 根据条件查询工作经验
     * @param page
     * @param rows
     * @param xzWorkExperience
     * @return
     */
    @Override
    public PageBean<XzWorkExperience> selAllWorkEEnd(Integer page, Integer rows, XzWorkExperience xzWorkExperience) {
        PageHelper.startPage(page,rows);
        List<XzWorkExperience> workList = workExperienceMapper.selAllWorkEEnd(xzWorkExperience);
        return new PageBean<XzWorkExperience>(workList);
    }

    /**
     * 添加工作经验
     * @param xzWorkExperience
     * @return
     */
    @Override
    public int addWorkEnd(XzWorkExperience xzWorkExperience) {
        return workExperienceMapper.addWorkEnd(xzWorkExperience);
    }

    /**
     * 修改工作经验
     * @param xzWorkExperience
     * @return
     */
    @Override
    public int updateWorkEEnd(XzWorkExperience xzWorkExperience) {
        return workExperienceMapper.updateWorkEEnd(xzWorkExperience);
    }

    /**
     * 删除工作经验
     * @param wid
     * @return
     */
    @Override
    public int deleteWorkEEnd(long wid) {
        return workExperienceMapper.deleteWorkEEnd(wid);
    }

    /**
     * 根据ID查询工作经验
     * @param wid
     * @return
     */
    @Override
    public XzWorkExperience selByLoginIDEnd(long wid) {
        return workExperienceMapper.selByLoginIDEnd(wid);
    }

}
