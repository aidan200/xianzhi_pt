package com.xzlcPT.service.impl;/**
 * Created by Administrator on 2017/8/3.
 */

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.dao.XzCompanyMapper;
import com.xzlcPT.dao.XzCompanyWelfareMapper;
import com.xzlcPT.dao.XzPostionMapper;
import com.xzlcPT.dao.XzResumeBrowseMapper;
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
    public PageBean<XzResumeBrowse> updateWhoSawMe(int page,int rows, Long resumeId) {
        PageHelper.startPage(page,rows);
        List<XzResumeBrowse> resumeBrowses = xzResumeBrowseMapper.selectByResumeId(resumeId);
        resumeBrowses.forEach(o->{
            XzCompany company = companyMapper.selectByPrimaryKey(o.getCompanyId());
            o.setCompany(company);
            List<XzPostion> postions = postionMapper.selectByCompanyId(company.getCompanyId());
            company.setPostions(postions);
            List<XzCompanyWelfare> companyWelfares = companyWelfareMapper.selectByCompanyId(company.getCompanyId());
            company.setWelfares(companyWelfares);
            //修改为已读
            if(o.getIsread()==0){
                o.setIsread(1);
                xzResumeBrowseMapper.updateByPrimaryKeySelective(o);
            }
        });
        return new PageBean<>(resumeBrowses);
    }
}
