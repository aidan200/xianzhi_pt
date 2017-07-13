package com.xzlcPT.controller;

import com.xzlcPT.bean.XzMember;

public interface XzMemberMapper {
    int deleteByPrimaryKey(Long memberId);

    int insert(XzMember record);

    int insertSelective(XzMember record);

    XzMember selectByPrimaryKey(Long memberId);

    int updateByPrimaryKeySelective(XzMember record);

    int updateByPrimaryKey(XzMember record);
}