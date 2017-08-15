package com.xzlcPT.service.impl;/**
 * Created by Administrator on 2017/8/3.
 */

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.dao.*;
import com.xzlcPT.service.XzResumeBrowseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 甘汝雷
 * @create 2017-08-03 14:38
 **/
@Service("resumeBrowseService")
public class XzResumeBrowseServiceImpl implements XzResumeBrowseService {
    @Autowired
    private XzResumeBrowseMapper xzResumeBrowseMapper;
    @Autowired
    private XzCompanyMapper companyMapper;
    @Autowired
    private XzPostionMapper postionMapper;
    @Autowired
    private XzCompanyWelfareMapper companyWelfareMapper;
    @Autowired
    private XzCompanyDomainMapper companyDomainMapper;


    @Override
    public int insert(XzResumeBrowse xzResumeBrowse) {
        int i=xzResumeBrowseMapper.insert(xzResumeBrowse);
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Long browseId) {
        int i=xzResumeBrowseMapper.updateByPrimaryKey(browseId);
        return i;
    }

    @Override
    public int selCountByResumeId(Long resumeId) {
        int i=xzResumeBrowseMapper.selCountByResumeId(resumeId);
        return i;
    }

    @Override
    public PageBean<XzResumeBrowse> selWhoSawMe(int page,int rows, Long resumeId) {
        PageHelper.startPage(page,rows);
        List<XzResumeBrowse> resumeBrowses = xzResumeBrowseMapper.selectByResumeId(resumeId);
        resumeBrowses.forEach(o->{
            XzCompany company = companyMapper.selectByPrimaryKey(o.getCompanyId());
            o.setCompany(company);
            List<XzPostion> postions = postionMapper.selectByCompanyId(company.getCompanyId());
            company.setPostions(postions);
            List<XzCompanyWelfare> companyWelfares = companyWelfareMapper.selectByCompanyId(company.getCompanyId());
            company.setWelfares(companyWelfares);
            List<XzCompanyDomain> companyDomains = companyDomainMapper.selectByCompanyId(company.getCompanyId());
            company.setDomains(companyDomains);
        });
        return new PageBean<>(resumeBrowses);
    }

    @Override
    public int updateIsRead(Long resumeBrowseId) {
        XzResumeBrowse xzResumeBrowse = xzResumeBrowseMapper.selectByPrimaryKey(resumeBrowseId);
        xzResumeBrowse.setIsread(1);
        return xzResumeBrowseMapper.updateByPrimaryKeySelective(xzResumeBrowse);
    }

    @Override
    public int insertSelective(XzResumeBrowse resumeBrowse) {
        int i=xzResumeBrowseMapper.insertSelective(resumeBrowse);
        return i;
    }

    @Override
    public int selectByComIdAndRId(XzResumeBrowse xzResumeBrowse) {
        int i=xzResumeBrowseMapper.selectByComIdAndRId(xzResumeBrowse);
        return i;
    }
}
