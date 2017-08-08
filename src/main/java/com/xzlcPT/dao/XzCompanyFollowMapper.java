package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompanyFollow;

import java.util.List;

public interface XzCompanyFollowMapper {

    List<XzCompanyFollow> selectByMemberId(Long memberId);

    int deleteByPrimaryKey(Long followId);

    int insert(XzCompanyFollow record);

    int insertSelective(XzCompanyFollow record);

    XzCompanyFollow selectByPrimaryKey(Long followId);

    int updateByPrimaryKeySelective(XzCompanyFollow record);

    int updateByPrimaryKey(XzCompanyFollow record);
}