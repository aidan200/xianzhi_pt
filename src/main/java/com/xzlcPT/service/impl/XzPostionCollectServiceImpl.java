package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzCompanyDomain;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.bean.XzPostionCollect;
import com.xzlcPT.dao.XzCompanyDomainMapper;
import com.xzlcPT.dao.XzCompanyMapper;
import com.xzlcPT.dao.XzPostionCollectMapper;
import com.xzlcPT.dao.XzPostionMapper;
import com.xzlcPT.service.XzPostionCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/8/8.
 */
@Service("postionCollectService")
public class XzPostionCollectServiceImpl implements XzPostionCollectService {
    @Autowired
    private XzPostionCollectMapper postionCollectMapper;
    @Autowired
    private XzPostionMapper postionMapper;
    @Autowired
    private XzCompanyMapper companyMapper;
    @Autowired
    private XzCompanyDomainMapper companyDomainMapper;


    @Override
    public PageBean<XzPostionCollect> selCollectByMemberId(int page, int rows, Long memberId) {
        PageHelper.startPage(page,rows);
        List<XzPostionCollect> collectList = postionCollectMapper.selectByMemberId(memberId);
        collectList.forEach(xzPostionCollect -> {
            XzPostion postion = postionMapper.selectByPrimaryKey(xzPostionCollect.getPostionId());
            XzCompany company = companyMapper.selectByPrimaryKey(postion.getCompany().getCompanyId());
            List<XzCompanyDomain> companyDomains = companyDomainMapper.selectByCompanyId(company.getCompanyId());
            company.setDomains(companyDomains);
            postion.setCompany(company);
            xzPostionCollect.setPostion(postion);
        });
        return new PageBean<>(collectList);
    }

    @Override
    public int insertSelective(XzPostionCollect xzPostionCollect) {
       int i=postionCollectMapper.insertSelective(xzPostionCollect);
        return i;
    }

    @Override
    public int selCollectState(XzPostionCollect xzPostionCollect) {
       int i=postionCollectMapper.selCollectState(xzPostionCollect);
        return i;
    }

    @Override
    public int deleteCollect(Long collectId) {
        int i=postionCollectMapper.deleteCollect(collectId);
        return i;
    }
}
