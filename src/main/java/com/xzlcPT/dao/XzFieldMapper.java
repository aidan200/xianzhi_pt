package com.xzlcPT.dao;

import com.xzlcPT.bean.XzField;

import java.util.List;
import java.util.Map;

public interface XzFieldMapper {

    int deleteByResumeDomain(Map map);

    int insertByResumeDomain(Map map);

    int deleteByCompanyDomain(Long companyId);

    int insertByCompanyDomain(Map map);

    List<XzField> selectByType(int fieldType);

    List<XzField> selectSkillByResumeId(Long resumeId);

    int deleteByPrimaryKey(Long fieldId);

    int insert(XzField record);

    int insertSelective(XzField record);

    XzField selectByPrimaryKey(Long fieldId);

    int updateByPrimaryKeySelective(XzField record);

    int updateByPrimaryKey(XzField record);

    XzField selectByFieldId(Map map);
}