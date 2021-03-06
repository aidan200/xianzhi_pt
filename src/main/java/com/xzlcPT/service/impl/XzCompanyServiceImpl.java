package com.xzlcPT.service.impl;

import com.amazonaws.services.dynamodbv2.xspec.NULL;
import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.dao.*;
import com.xzlcPT.service.XzCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private XzFieldMapper fieldMapper;
    @Autowired
    private XzCompanySkillMapper companySkillMapper;
    @Autowired
    private XzShieldMapper xzShieldMapper;


    @Override
    public int editCompany(XzCompany company, String[] welfaress, String[] domains, String[] skills) {
        int i = companyMapper.updateByPrimaryKeySelective(company);
        XzCompany c = companyMapper.selectByPrimaryKey(company.getCompanyId());
        if(c.getCompanyName()!=null&&!c.getCompanyName().equals("")){
            company.setCompanyName(null);
        }
        if(welfaress!=null&&welfaress.length>0){
        companyWelfareMapper.deleteByCompanyId(company.getCompanyId());
            for (String welfare : welfaress) {
                XzCompanyWelfare w = new XzCompanyWelfare();
                w.setCompanyId(company.getCompanyId());
                w.setWelfareName(welfare);
                companyWelfareMapper.insert(w);
            }
        }
        if(domains!=null&&domains.length>0){
            fieldMapper.deleteByCompanyDomain(company.getCompanyId());
            for (String domain : domains) {
                Map map = new HashMap();
                map.put("companyId",company.getCompanyId());
                map.put("fieldId",Long.parseLong(domain));
                fieldMapper.insertByCompanyDomain(map);
            }
        }
        if(skills!=null&&skills.length>0){
            companySkillMapper.deleteByCompanyId(company.getCompanyId());
            for (String skill : skills) {
                XzCompanySkill companySkill = new XzCompanySkill();
                companySkill.setCompanyId(company.getCompanyId());
                companySkill.setSkillName(skill);
                companySkillMapper.insert(companySkill);
            }
        }
        updateCompletionById(company.getCompanyId());
        return i;
    }

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
    public int updateByPrimaryKeySelective(XzCompany company) {
        return companyMapper.updateByPrimaryKeySelective(company);
    }

    @Override
    public PageBean<XzCompany> selByCompanyName(Integer page, Integer rows, String companyName,Long resumeId) {
        PageHelper.startPage(page,rows);
        Map map=new HashMap();
        map.put("companyName",companyName);
        map.put("resumeId",resumeId);
        List<XzCompany> dlist = companyMapper.selByCompanyName(map);
        PageBean<XzCompany> pb=new PageBean<XzCompany>(dlist);
        return pb;
    }

    @Override
    public List<XzCompany> selByCompanyIdList(List list) {
        List<XzCompany> nlist=companyMapper.selByCompanyIdList(list);
        return nlist;
    }

    @Override
    public int insertFollow(Map map) {
        int i=companyMapper.insertFollow(map);
        return i;
    }

    @Override
    public int deleteFollow(Long followId) {
        int i=companyMapper.deleteFollow(followId);
        return i;
    }

    @Override
    public List<XzCompany> selectFollow(Long memberId) {
        List<XzCompany> companyList=companyMapper.selectFollow(memberId);
        return companyList;
    }

    @Override
    public PageBean<XzCompany> selComCount(Integer page, Integer rows, Map map) {
        PageHelper.startPage(page,rows);
        List<XzCompany> plist=companyMapper.selComCount(map);
        PageBean<XzCompany> pageBean=new PageBean<>(plist);
        List<XzCompany> tlist=pageBean.getList();
        List list = new ArrayList();
        for (XzCompany company : tlist) {
            list.add(company.getCompanyId());
        }
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
        pageBean.setList(companyList);
        return pageBean;
    }

    @Override
    public int selFollowState(Map map) {
        int i=companyMapper.selFollowState(map);
        return i;
    }

    @Override
    public List<XzCompany> selectRecommend() {
        List<XzCompany> xzCompanyList=companyMapper.selectRecommend();
        return xzCompanyList;
    }
    //公司信息完成度
    @Override
    public XzCompany updateCompletionById(Long companyId) {
        XzCompany xzCompany=companyMapper.selCompanyInf(companyId);
        Class c=XzCompany.class;
        Field[] fields = c.getDeclaredFields();
        int count=0;
        int size=0;
        try {
            for (Field f:fields){
                if (f.getName().startsWith("company")||f.getType().equals(List.class)){
                    if (!f.getName().equals("companyId")&&!f.getName().equals("companyState")&&!f.getName().equals("companyX")&&!f.getName().equals("companyY")
                        &&!f.getName().equals("postions")&&!f.getName().equals("skills")&&!f.getName().equals("domains")&&!f.getName().equals("images")){
                    f.setAccessible(true);
                    if (f.getType().equals(List.class)){
                        size+=3;
                        List list1=(List)f.get(xzCompany);
                        if (list1!=null&&list1.size()!=0){
                            count+=3;
                        }
                        }else {
                        size++;
                        Object o=f.get(xzCompany);
                        if (o!=null&&o!=""){
                            count++;
                        }
                        }
                    }
                }
            }
            xzCompany.setIsListing(new Double(Math.floor(count*1.0/size*100)).intValue());
            int j=new Double(Math.floor(count*1.0/size*100)).intValue();
            System.out.println("j:::::::::::::::::::::::::::::"+j);
            companyMapper.updateByPrimaryKeySelective(xzCompany);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    //以下为管理员操作方法
    //查询所有执照状态为1的公司
    @Override
    public List<XzCompany> selAllCompanyExamine() {
        List<XzCompany> xzCompanyList=companyMapper.selAllCompanyExamine();
        return xzCompanyList;
    }

    //按公司id查询与预览
    @Override
    public XzCompany selCompanyById(Long companyId) {
        XzCompany xzCompany=companyMapper.selCompanyById(companyId);
        return xzCompany;
    }

    //修改执照审核状态
    @Override
    public int updateCompanyState(XzCompany xzCompany) {
        int i=companyMapper.updateCompanyState(xzCompany);
        return i;
    }


    @Override
    public PageBean<XzCompany> selAllCompany(int page, int rows, XzCompany xzCompany) {
        PageHelper.startPage(page,rows);
        List<XzCompany> clist=companyMapper.selAllCompany(xzCompany);
        PageBean<XzCompany> pageBean=new PageBean<>(clist);
        return pageBean;
    }

    @Override
    public XzCompany selectByPrimaryKey(Long companyId) {
        XzCompany xzCompany=companyMapper.selectByPrimaryKey(companyId);
        return xzCompany;
    }

    @Override
    public int deleteByPrimaryKey(Long companyId) {
        int i=companyMapper.deleteByPrimaryKey(companyId);
        return i;
    }


}
