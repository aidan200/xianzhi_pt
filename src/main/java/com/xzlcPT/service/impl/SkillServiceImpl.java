package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzSKill;
import com.xzlcPT.dao.SkillMapper;
import com.xzlcPT.service.SkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 建立 技能表 service 实现类
 *
 * @author 王天岳
 * @create 2017-05-15 12:54
 **/
@Service("skillService")
public class SkillServiceImpl implements SkillService{
    @Autowired
    private SkillMapper skillMapper;

    /**
     * 条件查询全部 技能信息
     * @param xzSKill
     * @return
     */
    @Override
    public List<XzSKill> selectAllSkill(XzSKill xzSKill) {
        return skillMapper.selectAllSkill(xzSKill);
    }

    /**
     * 根据ID 查询技能信息(技能表ID 或 登录表ID)
     * @param xzSKill
     * @return
     */
    @Override
    public XzSKill selectSkillByID(XzSKill xzSKill) {
        return skillMapper.selectSkillByID(xzSKill);
    }

    /**
     * 添加技能信息
     * @param xzSKill
     * @return
     */
    @Override
    public int insertSkill(XzSKill xzSKill) {
        return skillMapper.insertSkill(xzSKill);
    }

    /**
     * 修改技能信息
     * @param xzSKill
     * @return
     */
    @Override
    public int updateSkill(XzSKill xzSKill) {
        return skillMapper.updateSkill(xzSKill);
    }

    /**
     * 条件查询技能信息
     * @param xzSkill
     * @return
     */
    @Override
    public PageBean<XzSKill> selectAllSkillEnd(Integer page, Integer rows,XzSKill xzSkill) {
        PageHelper.startPage(page,rows);
        List<XzSKill> list = skillMapper.selectAllSkillEnd(xzSkill);
        return new PageBean<XzSKill>(list);
    }

    /**
     * 根据ID查询技能信息
     * @param xzSKill
     * @return
     */
    @Override
    public XzSKill selectSkillByIDEnd(XzSKill xzSKill) {
        return skillMapper.selectSkillByID(xzSKill);
    }

    /**
     * 添加技能信息
     * @param xzSKill
     * @return
     */
    @Override
    public int insertSkillEnd(XzSKill xzSKill) {
        return skillMapper.insertSkillEnd(xzSKill);
    }

    /**
     * 修改技能信息
     * @param xzSKill
     * @return
     */
    @Override
    public int updateSkillEnd(XzSKill xzSKill) {
        return skillMapper.updateSkillEnd(xzSKill);
    }
}
