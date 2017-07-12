package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzCompanyWelfare;
import com.xzlcPT.dao.XzCompanyMapper;
import com.xzlcPT.dao.XzCompanyWelfareMapper;
import com.xzlcPT.service.XzCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/6.
 */
@Service("companyService")
public class XzCompanyServiceImpl implements XzCompanyService{

    @Autowired
    private XzCompanyMapper companyMapper;
    @Autowired
    private XzCompanyWelfareMapper companyWelfareMapper;

    @Override
    public int addCompany(XzCompany company) {
        int i = companyMapper.addCompany(company);
        List<XzCompanyWelfare> ws = company.getWelfares();
        if(null!=ws&&ws.size()!=0){
            for (XzCompanyWelfare w : ws) {
                w.setCompanyId(company.getCompanyId());
            }
            companyWelfareMapper.insertAll(ws);
        }
        return i;
    }
}
