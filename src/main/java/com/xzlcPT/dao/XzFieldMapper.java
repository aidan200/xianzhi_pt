package com.xzlcPT.dao;

import com.xzlcPT.bean.XzField;

import java.util.List;

public interface XzFieldMapper {

    List<XzField> selectByType(int fieldType);

    int deleteByPrimaryKey(Long fieldId);

    int insert(XzField record);

    int insertSelective(XzField record);

    XzField selectByPrimaryKey(Long fieldId);

    int updateByPrimaryKeySelective(XzField record);

    int updateByPrimaryKey(XzField record);
}