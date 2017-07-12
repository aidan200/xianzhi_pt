package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzEducation;
import com.xzlcPT.dao.EducationMapper;
import com.xzlcPT.service.EducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * ServiceImpl 层 EducationServiceImpl
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Service("educationService")
public class EducationServiceImpl implements EducationService {
    @Autowired
    EducationMapper educationMapper;
    /**
     * 前台方法
     */
    /**
     * 添加用户信息
     * @param ed
     * @return
     */
    @Override
    public int addUserInfo(XzEducation ed) {
        int a = 0;
        if (ed != null) {
            a = educationMapper.addEducation(ed);
        }
        return a;
    }

    /**
     * 根据ID查询学历信息
     * @param id
     * @return
     */
    @Override
    public List<XzEducation> selectEducationByID(long id) {
        List<XzEducation> edList = new ArrayList<XzEducation>();
        if(id != 0){
            XzEducation ed = new XzEducation();
            ed.setLoginID(id);
            edList = educationMapper.selectEducationByID(ed);
        }else{
            edList = null;
        }
        return edList;
    }

    @Override
    public List<XzEducation> selectMemberId(Long menberId) {
        return educationMapper.selectMemberId(menberId);
    }

    /**
     * 修改学历信息
     * @param ed
     * @return
     */
    @Override
    public int updateEducation(XzEducation ed) {
        int a = 0;
        if (ed!=null){
            a = educationMapper.updateEducation(ed);
        }
        return a;
    }

    /**
     * 删除学历信息
     * @param edID
     * @return
     */
    @Override
    public int delateEducation(long edID) {
        int a = 0;
        if (edID!=0){
            a = educationMapper.delateEducation(edID);
        }
        return a;
    }
    /**
     * 查询学历ID信息
     * @param edID
     * @return
     */
    @Override
    public XzEducation selectEducationByEID(long edID) {
        XzEducation xzEducation = new XzEducation();
        if (edID!=0){
            xzEducation = educationMapper.selectEducationByEID(edID);
        }
        return xzEducation;
    }

    /**
     * 后台方法
     */
    /**
     * 根据条件查询学历信息
     * @param page
     * @param rows
     * @param xzEducation
     * @return
     */
    @Override
    public PageBean<XzEducation> selAllEducationEnd(Integer page, Integer rows, XzEducation xzEducation) {
        PageHelper.startPage(page,rows);
        List<XzEducation> educationList = educationMapper.selAllEducationEnd(xzEducation);
        return new PageBean<XzEducation>(educationList);
    }

    /**
     * 根据条件添加学历信息
     * @param xzEducation
     * @return
     */
    @Override
    public int addEducationEnd(XzEducation xzEducation) {
        return educationMapper.addEducationEnd(xzEducation);
    }

    /**
     * 根据条件修改学历信息
     * @param xzEducation
     * @return
     */
    @Override
    public int updateEducationEnd(XzEducation xzEducation) {
        return educationMapper.updateEducationEnd(xzEducation);
    }

    /**
     * 根据条件删除学历信息
     * @param loginID
     * @return
     */
    @Override
    public int deleteEducationEnd(long loginID) {
        return educationMapper.deleteEducationEnd(loginID);
    }

    /**
     * 根据登录ID查询
     * @param eid
     * @return
     */
    @Override
    public XzEducation selByLoginIDEnd(long eid) {
        XzEducation xzEducation = new XzEducation();
        if(educationMapper.selByLoginIDEnd(eid)!=null){
            xzEducation = educationMapper.selByLoginIDEnd(eid);
        }
        return xzEducation;
    }
}
