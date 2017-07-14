package com.xzlcPT.service.impl;

import com.amazonaws.services.dynamodbv2.xspec.NULL;
import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzCompanyWelfare;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.dao.XzCompanyMapper;
import com.xzlcPT.dao.XzCompanyWelfareMapper;
import com.xzlcPT.service.XzCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    @Override
    public List<XzCompany> selectAllJob(List<XzCompany> clist) {
      /* XzCompany x=new XzCompany();
       List<XzCompany> alist=companyMapper.selectPcount(x);
        List<XzCompany> tlist=companyMapper.selectAllJob(alist);*/
        return null;
    }

    @Override
    public PageBean<XzCompany> selectPcount(Integer page, Integer rows, XzCompany xzCompany) {
        //计数分页
        PageHelper.startPage(page,rows);
        List<XzCompany> plist=companyMapper.selectPcount(xzCompany);
        PageBean<XzCompany> pb = new PageBean<XzCompany>(plist);
        List<XzCompany> tlist=pb.getList();
        List list = new ArrayList();
        for (XzCompany company : tlist) {
            list.add(company.getCompanyId());
        }
        //获取plist所有id
        //使用id集 合查询全部内容
        List<XzCompany> companyList = companyMapper.selectAllJob(list);
        for (int i=0;i<companyList.size();i++){
            for (int j=0;j<plist.size();j++){
                if (companyList.get(i).getCompanyId()==plist.get(j).getCompanyId()){
                    companyList.get(i).setPcount(plist.get(j).getPcount());
                }
            }
        }
        List<XzPostion> polist=new ArrayList<XzPostion>();
        for (int i=0;i<companyList.size();i++){
            if (companyList.get(i).getPostions().size()>2){
                polist=companyList.get(i).getPostions().subList(0,2);
                companyList.get(i).setPostions(polist);
            }
        }
        List<XzCompanyWelfare> welist=new ArrayList<XzCompanyWelfare>();
        for (int i=0;i<companyList.size();i++){
            if (companyList.get(i).getWelfares().size()>2){
                welist=companyList.get(i).getWelfares().subList(0,2);
                companyList.get(i).setWelfares(welist);
            }
        }
        //装载count
        pb.setList(companyList);
        return pb;

    }

}
