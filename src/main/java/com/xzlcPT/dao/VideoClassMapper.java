package com.xzlcPT.dao;/**
 * Created by Administrator on 2017/4/23.
 */

import com.xzlcPT.bean.XzVideoClass;

import java.util.List;

/**
 * 建立视频类别Mapper
 *
 * @author 王天岳
 * @create 2017-04-23 18:01
 **/
public interface VideoClassMapper {
    /**
     * 添加视频类别
     * @param xzVideoClass
     * @return
     */
    int insertVideoClass(XzVideoClass xzVideoClass);

    /**
     * 根据条件查询视频类别
     * @param xzVideoClass
     * @return
     */
    List<XzVideoClass> selectVideoClass(XzVideoClass xzVideoClass);

    /**
     * 根据条件修改视频类别
     * @return
     */
    int updateVideoClass(XzVideoClass xzVideoClass);

    /**
     * 根据视频类别ID查询
     * @param vcid
     * @return
     */
    XzVideoClass selectVclassByID(long vcid);

}
