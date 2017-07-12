package com.xzlcPT.service;/**
 * Created by Administrator on 2017/5/15.
 */

import com.util.PageBean;
import com.xzlcPT.bean.XzSKill;

import java.util.List;

/**
 * 建立 技能表 service
 *
 * @author 王天岳
 * @create 2017-05-15 12:49
 **/
public interface SkillService {
    /**
     * 根据条件查询 技能信息
     * @param xzSKill
     * @return
     */
    List<XzSKill> selectAllSkill(XzSKill xzSKill);

    /**
     * 根据ID 查询技能信息(技能表ID 或 登录表ID)
     * @param xzSKill
     * @return
     */
    XzSKill selectSkillByID(XzSKill xzSKill);

    /**
     * 添加技能信息
     * @param xzSKill
     * @return
     */
    int insertSkill(XzSKill xzSKill);

    /**
     * 修改技能信息
     * @param xzSKill
     * @return
     */
    int updateSkill(XzSKill xzSKill);


    /**
     * 后台
     */

    /**
     * 根据条件查询 技能信息
     * @param xzSkill
     * @return
     */
    PageBean<XzSKill> selectAllSkillEnd(Integer page, Integer rows,XzSKill xzSkill);

    /**
     * 根据ID 查询技能信息(技能表ID 或 登录表ID)
     * @param xzSKill
     * @return
     */
    XzSKill selectSkillByIDEnd(XzSKill xzSKill);

    /**
     * 添加技能信息
     * @param xzSKill
     * @return
     */
    int insertSkillEnd(XzSKill xzSKill);

    /**
     * 修改技能信息
     * @param xzSKill
     * @return
     */
    int updateSkillEnd(XzSKill xzSKill);

}
