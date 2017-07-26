package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompanySkill;

public interface XzCompanySkillMapper {

    int deleteByCompanyId(Long companyId);

    int deleteByPrimaryKey(Long skillId);

    int insert(XzCompanySkill record);

    int insertSelective(XzCompanySkill record);

    XzCompanySkill selectByPrimaryKey(Long skillId);

    int updateByPrimaryKeySelective(XzCompanySkill record);

    int updateByPrimaryKey(XzCompanySkill record);
}