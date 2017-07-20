package com.xzlcPT.service.impl;

import com.amazonaws.services.dynamodbv2.xspec.NULL;
import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.dao.XzCompanyMapper;
import com.xzlcPT.dao.XzCompanyWelfareMapper;
import com.xzlcPT.dao.XzShieldMapper;
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
    @Autowired
    private XzShieldMapper xzShieldMapper;

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

    @Override
    public PageBean<XzCompany> selectDomain(Integer page, Integer rows, XzCompany xzCompany) {
        PageHelper.startPage(page,rows);
        List<XzCompany> dlist = companyMapper.selectByDomain(xzCompany);
        PageBean<XzCompany> pb=new PageBean<XzCompany>(dlist);
        List<XzCompany> alist=pb.getList();
        List list = new ArrayList();
        for (XzCompany company : alist) {
            list.add(company.getCompanyId());
        }
        List<XzCompany> companyList = companyMapper.selectAllJob(list);
        for (int i=0;i<companyList.size();i++){
            for (int j=0;j<dlist.size();j++){
                if (companyList.get(i).getCompanyId()==dlist.get(j).getCompanyId()){
                    companyList.get(i).setPcount(dlist.get(j).getPcount());
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
        pb.setList(companyList);
        return pb;
    }

    @Override
    public XzCompany selCompanyInf(Long companyId) {
        XzCompany xzCompany=companyMapper.selCompanyInf(companyId);
        int i=xzCompany.getPostions().size();
        xzCompany.setPcount(i);
        return xzCompany;
    }

    @Override
    public int updateCompanyPic(XzCompany xzCompany) {
        int i=companyMapper.updateCompanyPic(xzCompany);
        return i;
    }

    @Override
    public PageBean<XzCompany> selByCompanyName(Integer page, Integer rows, String companyName,Long resumeId) {
        PageHelper.startPage(page,rows);
        List<XzCompany> dlist = companyMapper.selByCompanyName(companyName);
        List<XzShield> slist=xzShieldMapper.selByResumeId(resumeId);
        for (int i=0;i<dlist.size();i++){
          for (int j=0;j<slist.size();j++){
           if (dlist.get(i).getCompanyId()==slist.get(j).getCompanyId()){
               dlist.remove(i);
           }
          }
        }
        PageBean<XzCompany> pb=new PageBean<XzCompany>(dlist);
        return pb;
    }


}
