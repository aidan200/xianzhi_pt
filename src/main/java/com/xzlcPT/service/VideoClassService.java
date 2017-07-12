package com.xzlcPT.service;/**
 * Created by Administrator on 2017/5/11.
 */

import com.util.PageBean;
import com.xzlcPT.bean.XzVideoClass;

import java.util.List;

/**
 * 建立视频类别Service
 *
 * @author 王天岳
 * @create 2017-05-11 9:52
 **/
public interface VideoClassService {
//    查询视频类别
    List<XzVideoClass> selectVideoVideoClass( XzVideoClass xzVideoClass);
//    根据ID查询类别
    XzVideoClass selectByClassID(int vclassID);

//    后台
//    查询视频类别
    PageBean<XzVideoClass> selectVideoClassEnd(Integer page, Integer rows, XzVideoClass xzVideoClass);
//    根据ID查询视频类别
    XzVideoClass selectVideoClassByIDEnd(Long vclassID);
//    添加视频类别
    int insertVideoClassEnd(XzVideoClass xzVideoClass);
//    修改视频类别
    int updateVideoClassEnd(XzVideoClass xzVideoClass);

}
