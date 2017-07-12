package com.xzlcPT.dao;/**
 * Created by Administrator on 2017/5/15.
 */

import com.xzlcPT.bean.XzSKill;

import java.util.List;

/**
 * 建立技能表Mapper
 *
 * @author 王天岳
 * @create 2017-05-15 12:18
 **/
public interface SkillMapper {
    /**
     * 前台方法
     */
    /**
     * 根据条件查询技能信息
     *
     * @param xzSKill
     * @return
     */
    List<XzSKill> selectAllSkill(XzSKill xzSKill);

    /**
     * 根据ID 查询技能信息
     *
     * @param xzSKill
     * @return
     */
    XzSKill selectSkillByID(XzSKill xzSKill);

    /**
     * 添加技能信息
     *
     * @param xzSKill
     * @return
     */
    int insertSkill(XzSKill xzSKill);

    /**
     * 修改技能信息
     *
     * @param xzSKill
     * @return
     */
    int updateSkill(XzSKill xzSKill);

    /**
     * 后台方法
     */

    /**
     * 根据条件查询技能信息
     *
     * @param xzSKill
     * @return
     */
    List<XzSKill> selectAllSkillEnd(XzSKill xzSKill);

    /**
     * 根据ID 查询技能信息
     *
     * @param xzSKill
     * @return
     */
    XzSKill selectSkillByIDEnd(XzSKill xzSKill);

    /**
     * 添加技能信息
     *
     * @param xzSKill
     * @return
     */
    int insertSkillEnd(XzSKill xzSKill);

    /**
     * 修改技能信息
     *
     * @param xzSKill
     * @return
     */
    int updateSkillEnd(XzSKill xzSKill);



}
