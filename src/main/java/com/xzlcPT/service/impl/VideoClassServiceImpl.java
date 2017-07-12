package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzVideoClass;
import com.xzlcPT.dao.VideoClassMapper;
import com.xzlcPT.service.VideoClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 建立 视频类别service 实现类
 *
 * @author 王天岳
 * @create 2017-05-11 10:41
 **/


@Service("videoClassService")
public class VideoClassServiceImpl implements VideoClassService{
    @Autowired
    private VideoClassMapper videoClassMapper;
//    前台

    /**
     * 查询视频类别
     * @param xzVideoClass
     * @return
     */
    @Override
    public List<XzVideoClass> selectVideoVideoClass(XzVideoClass xzVideoClass) {

        return videoClassMapper.selectVideoClass(xzVideoClass);
    }

    /**
     * 根据ID查询视频类别
     * @param vclassID
     * @return
     */
    @Override
    public XzVideoClass selectByClassID(int vclassID) {
        XzVideoClass xzVideoClass = new XzVideoClass();
        if(vclassID!=0){
            xzVideoClass = videoClassMapper.selectVclassByID(vclassID);
        }
        return xzVideoClass;
    }
//    后台

    /**
     * 查询视频类别
     * @param page
     * @param rows
     * @param xzVideoClass
     * @return
     */
    @Override
    public PageBean<XzVideoClass> selectVideoClassEnd(Integer page, Integer rows, XzVideoClass xzVideoClass) {
        PageHelper.startPage(page,rows);
        List<XzVideoClass> list = videoClassMapper.selectVideoClass(xzVideoClass);
        return new PageBean<XzVideoClass>(list);
    }

    /**
     * 根据ID 查询视频类别
     * @param vclassID
     * @return
     */
    @Override
    public XzVideoClass selectVideoClassByIDEnd(Long vclassID) {
        XzVideoClass xzVideoClass = new XzVideoClass();
        if(vclassID != 0){
            xzVideoClass = videoClassMapper.selectVclassByID(vclassID);
        }
        return xzVideoClass;
    }

    /**
     * 增加视频类别
     * @param xzVideoClass
     * @return
     */
    @Override
    public int insertVideoClassEnd(XzVideoClass xzVideoClass) {
        int  a = videoClassMapper.insertVideoClass(xzVideoClass);
        return 0;
    }

    /**
     * 修改视频类别
     * @param xzVideoClass
     * @return
     */
    @Override
    public int updateVideoClassEnd(XzVideoClass xzVideoClass) {
        int  a = videoClassMapper.updateVideoClass(xzVideoClass);
        return a;
    }
}
