package com.xzlcPT.service;/**
 * Created by Administrator on 2017/5/2.
 */

import com.util.PageBean;
import com.xzlcPT.bean.XzRecruit;

/**
 * 招聘信息表Service
 *
 * @author 王天岳
 * @create 2017-05-02 16:16
 **/
public interface RecruitService {

    int insertRecruit(XzRecruit xzRecruit);

    int updateRecruit(XzRecruit xzRecruit);

    PageBean<XzRecruit> selectRecruit(Integer page, Integer rows, XzRecruit xzRecruit);

    XzRecruit selectRecruitByID(Long id);

    int deleteRecruit(Long id);

    /**
     * 后台方法
     */

    PageBean<XzRecruit> selectRecruitEnd(Integer page, Integer rows, XzRecruit xzRecruit);

    int updateRecruitEnd(XzRecruit xzRecruit);

    int deleteRecruitEnd(Long id);

    XzRecruit selectRecruitByIDEnd(Long id);

}
