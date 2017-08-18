package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzField;
import com.xzlcPT.bean.XzPostion;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/6.
 */
public interface XzCompanyService {

    int editCompany(XzCompany company,String[] welfares,String[] domains,String[] skills);

    int addCompany(XzCompany company);

    PageBean<XzCompany> selectPcount(Integer page, Integer rows, XzCompany xzCompany);

    PageBean<XzCompany> selectDomain(Integer page, Integer rows, XzCompany xzCompany);

    XzCompany selCompanyInf(Long companyId);

    int updateCompanyPic(XzCompany xzCompany);

    int updateByPrimaryKeySelective(XzCompany company);

    PageBean<XzCompany> selByCompanyName(Integer page,Integer rows,String companyName,Long resumeId);

    List<XzCompany> selByCompanyIdList(List list);

    int insertFollow(Map map);

    int deleteFollow(Long followId);

    List<XzCompany> selectFollow(Long memberId);

    PageBean<XzCompany> selComCount(Integer page,Integer rows,Map map);

    int selFollowState(Map map);

    List<XzCompany> selectRecommend();

    XzCompany updateCompletionById(Long companyId);

    PageBean<XzCompany> selAllCompany(int page,int rows,XzCompany xzCompany);

    XzCompany selectByPrimaryKey(Long companyId);

    int deleteByPrimaryKey(Long companyId);
}