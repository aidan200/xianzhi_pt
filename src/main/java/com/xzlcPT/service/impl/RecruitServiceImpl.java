package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzRecruit;
import com.xzlcPT.dao.RecruitMapper;
import com.xzlcPT.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 建立招聘信息表Service实现类
 *
 * @author 王天岳
 * @create 2017-05-02 17:02
 **/
@Service("recruitService")
public class RecruitServiceImpl implements RecruitService{
    @Autowired
    private RecruitMapper recruitMapper;

    /**
     * 添加招聘信息
     * @param xzRecruit
     * @return
     */
    @Override
    public int insertRecruit(XzRecruit xzRecruit) {
        int a = 0;
        if(xzRecruit != null){
            a = recruitMapper.insertRecruit(xzRecruit);
        }
        return a;
    }

    /**
     * 修改招聘信息
     * @param xzRecruit
     * @return
     */
    @Override
    public int updateRecruit(XzRecruit xzRecruit) {
        int a = 0;
        if(xzRecruit != null){
            a = recruitMapper.updateRecruit(xzRecruit);
        }
        return a;
    }

    /**
     * 根据条件查询招聘信息
     * @param page
     * @param rows
     * @param xzRecruit
     * @return
     */
    @Override
    public PageBean<XzRecruit> selectRecruit(Integer page, Integer rows, XzRecruit xzRecruit) {
        PageHelper.startPage(page,rows);
        List<XzRecruit> recruitList = recruitMapper.selectRecruit(xzRecruit);
        return new PageBean<XzRecruit>(recruitList);
    }

    /**
     * 根据招聘信息表ID查询
     * @param id
     * @return
     */
    @Override
    public XzRecruit selectRecruitByID(Long id) {
        XzRecruit xzRecruit = new XzRecruit();
        if (id != 0){
            xzRecruit = recruitMapper.selectRecruitByID(id);
        }
        return xzRecruit;
    }

    @Override
    public int deleteRecruit(Long id) {
        XzRecruit xzRecruit = new XzRecruit();
        if (id != 0){
            xzRecruit = recruitMapper.selectRecruitByID(id);
        }
        int a = 0;
        if (xzRecruit!=null){
            xzRecruit.setDeleteFalt(1);
            xzRecruit.setDeleteRecruitDate(new Date());
            System.out.println("service:"+xzRecruit);
            a = recruitMapper.updateRecruit(xzRecruit);
        }
        return a;
    }

    @Override
    public PageBean<XzRecruit> selectRecruitEnd(Integer page, Integer rows, XzRecruit xzRecruit) {
        PageHelper.startPage(page,rows);
        List<XzRecruit> recruitList = recruitMapper.selectRecruitEnd(xzRecruit);
        return new PageBean<XzRecruit>(recruitList);
    }

    @Override
    public int updateRecruitEnd(XzRecruit xzRecruit) {
        int a = 0;
        if(xzRecruit != null){
            a = recruitMapper.updateRecruitEnd(xzRecruit);
        }
        return a;
    }

    @Override
    public int deleteRecruitEnd(Long id) {
        XzRecruit xzRecruit = new XzRecruit();
        if(id !=0){
            xzRecruit = recruitMapper.selectRecruitByIDEnd(id);
        }
        int a = 0;
        if(xzRecruit != null){
            xzRecruit.setDeleteFalt(1);
            xzRecruit.setDeleteRecruitDate(new Date());
            a = recruitMapper.updateRecruitEnd(xzRecruit);
        }
        return a;
    }


    @Override
    public XzRecruit selectRecruitByIDEnd(Long id) {
        XzRecruit xzRecruit = new XzRecruit();
        if (id != 0 ){
            xzRecruit = recruitMapper.selectRecruitByIDEnd(id);
        }
        return xzRecruit;
    }


}
