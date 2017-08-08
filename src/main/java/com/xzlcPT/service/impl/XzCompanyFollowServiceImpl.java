package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.dao.*;
import com.xzlcPT.service.XzCompanyFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/8/8.
 */
@Service("companyFollowService")
public class XzCompanyFollowServiceImpl implements XzCompanyFollowService {
    @Autowired
    private XzCompanyFollowMapper companyFollowMapper;
    @Autowired
    private XzCompanyMapper companyMapper;
    @Autowired
    private XzPostionMapper postionMapper;
    @Autowired
    private XzCompanyWelfareMapper companyWelfareMapper;
    @Autowired
    private XzCompanyDomainMapper companyDomainMapper;

    @Override
    public PageBean<XzCompanyFollow> selCompanyFollowByMemberId(int page, int rows, Long memberId) {
        PageHelper.startPage(page,rows);
        List<XzCompanyFollow> companyFollows = companyFollowMapper.selectByMemberId(memberId);
        companyFollows.forEach(xzCompanyFollow -> {
            XzCompany company = companyMapper.selectByPrimaryKey(xzCompanyFollow.getCompanyId());
            xzCompanyFollow.setCompany(company);
            List<XzPostion> postions = postionMapper.selectByCompanyId(company.getCompanyId());
            company.setPostions(postions);
            List<XzCompanyWelfare> companyWelfares = companyWelfareMapper.selectByCompanyId(company.getCompanyId());
            company.setWelfares(companyWelfares);
            List<XzCompanyDomain> companyDomains = companyDomainMapper.selectByCompanyId(company.getCompanyId());
            company.setDomains(companyDomains);
        });
        return new PageBean<>(companyFollows);
    }
}
