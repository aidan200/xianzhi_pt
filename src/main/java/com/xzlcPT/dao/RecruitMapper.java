package com.xzlcPT.dao;/**
 * Created by Administrator on 2017/5/2.
 */

import com.xzlcPT.bean.XzRecruit;

import java.util.List;

/**
 * 建立招聘信息表Mapper
 *
 * @author 王天岳
 * @create 2017-05-02 14:23
 **/
public interface RecruitMapper {
    /**
     *  新增招聘信息
     * @param xzRecruit
     * @return
     */
    int insertRecruit(XzRecruit xzRecruit);

    /**
     * 修改招聘信息
     * @param xzRecruit
     * @return
     */
    int updateRecruit(XzRecruit xzRecruit);

    /**
     * 根据条件查询招聘信息
     * (查询条件:公司名,工作地点,工资,工作类别,招聘表ID)
     * @param xzRecruit
     * @return
     */
    List<XzRecruit> selectRecruit(XzRecruit xzRecruit);

    /**
     * 根据招聘信息表ID查询
     * @param id
     * @return
     */
    XzRecruit selectRecruitByID(Long id);

    /**
     * 后台方法
     */

    /**
     * 根据条件查询招聘信息
     * (查询条件:公司名,工作地点,工资,工作类别,招聘表ID)
     * @param xzRecruit
     * @return
     */
    List<XzRecruit> selectRecruitEnd(XzRecruit xzRecruit);

    /**
     * 修改招聘信息
     * @param xzRecruit
     * @return
     */
    int updateRecruitEnd(XzRecruit xzRecruit);

    /**
     * 根据ID查询招聘信息
     * @param id
     * @return
     */
    XzRecruit selectRecruitByIDEnd(Long id);
}
