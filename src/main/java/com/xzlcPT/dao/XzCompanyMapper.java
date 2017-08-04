package com.xzlcPT.dao;

import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzField;

import java.util.List;
import java.util.Map;

public interface XzCompanyMapper {

    int addCompany(XzCompany company);

    XzCompany selCompanyInfo(Long id);

    int deleteByPrimaryKey(Long companyId);

    int insert(XzCompany record);

    int insertSelective(XzCompany record);

    XzCompany selectByPrimaryKey(Long companyId);

    int updateByPrimaryKeySelective(XzCompany record);

    int updateByPrimaryKey(XzCompany record);

    List<XzCompany> selectAllJob(List<Long> list);

    List<XzCompany> selectPcount(XzCompany record);

    List<XzCompany> selectByDomain(XzCompany record);

    XzCompany selCompanyInf(Long companyId);

    int updateCompanyPic(XzCompany record);

    List<XzCompany> selByCompanyName(Map map);

    List<XzCompany> selByCompanyIdList(List list);

    int insertFollow(Map map);

    int deleteFollow(Long followId);

    List<XzCompany> selectFollow(Long memberId);

    List<XzCompany> selComCount(Map map);

    int selFollowState(Map map);

    List<XzCompany> selectRecommend();
}