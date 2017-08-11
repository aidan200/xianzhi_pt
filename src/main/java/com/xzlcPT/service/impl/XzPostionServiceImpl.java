package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.sun.javafx.collections.MappingChange;
import com.util.PageBean;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.dao.XzPostionMapper;
import com.xzlcPT.service.XzPostionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/11.
 */
@Service("postionService")
public class XzPostionServiceImpl implements XzPostionService{
    @Autowired
    private XzPostionMapper postionMapper;


    @Override
    public PageBean<XzPostion> selPostionSendList(Map map,int page,int rows) {
        PageHelper.startPage(page,rows);
        List<XzPostion> plist=postionMapper.selPostionSendList(map);
        PageBean<XzPostion> pageBean=new PageBean<>(plist);
        return pageBean;
    }

    @Override
    public PageBean<XzPostion> selPostionIndex(int page, int rows, Map map) {
        PageHelper.startPage(page,rows);
        List<XzPostion> postion1 = postionMapper.selPostionList(map);

        PageBean<XzPostion> pp = new PageBean<>(postion1);
        List<Long> ll = new ArrayList<>();
        List<XzPostion> postions = pp.getList();
        for (XzPostion xzPostion : postions) {
            ll.add(xzPostion.getPostionId());
        }
        if(ll.size()>0){
            List<XzPostion> aa = postionMapper.selPostionByListId(ll);
            pp.setList(aa);
        }
        return pp;
        //return null;
    }

    @Override
    public PageBean<XzPostion> selectByCompanyId(int page, int rows, Long companyId) {
        PageHelper.startPage(page,rows);
        List<XzPostion> plist=postionMapper.selectByCompanyId(companyId);
        PageBean<XzPostion> pageBean=new PageBean<>(plist);
        return pageBean;
    }

    @Override
    public PageBean<XzPostion> selectByConditions(int page, int rows, XzPostion xzPostion) {
       PageHelper.startPage(page,rows);
       List<XzPostion> plist=postionMapper.selectByConditions(xzPostion);
       PageBean<XzPostion> pageBean=new PageBean<>(plist);
        return pageBean;
    }

    @Override
    public List<XzPostion> selectByComId(Long companyId) {
        List<XzPostion> clist=postionMapper.selectByCompanyId(companyId);
        return clist;
    }

    @Override
    public List<XzPostion> selectCityByComId(Long companyId) {
        List<XzPostion> clist=postionMapper.selectCityByComId(companyId);
        return clist;
    }

    @Override
    public XzPostion selPostionInfo(Long postionId) {
        XzPostion xzPostion=postionMapper.selPostionInfo(postionId);
        return xzPostion;
    }

    @Override
    public List<XzPostion> selInfoByName(XzPostion xzPostion) {
       List<XzPostion> plist = postionMapper.selInfoByName(xzPostion);
        return plist;
    }

    @Override
    public List<XzPostion> selInfoByComId(XzPostion xzPostion) {
        List<XzPostion> cplist=postionMapper.selInfoByComId(xzPostion);
        return cplist;
    }

    @Override
    public int insertPostion(Map map) {
       String str1=map.get("postionAgeMin").toString();
       String str2=map.get("postionAgeMax").toString();
       String str3="-";
       String postionAge=str1+str3+str2;
        map.put("postionAge",postionAge);
        if (map.get("forceAgeMin")!=null&map.get("forceAgeMax")!=null) {
            String string1 = map.get("forceAgeMin").toString();
            String string2 = map.get("forceAgeMax").toString();
            String string3 = "-";
            String forceAge = string1 + string3 + string2;
            map.put("forceAge", forceAge);
        }
        int i=postionMapper.insertPostion(map);
        return i;
    }

    @Override
    public int insertCollect(Map map) {
       int i=postionMapper.insertCollect(map);
        return i;
    }

    @Override
    public int deleteCollect(Long collectId) {
       int i=postionMapper.deleteCollect(collectId);
        return i;
    }

    @Override
    public List<XzPostion> selectCollect(Long memberId) {
        List<XzPostion> list=postionMapper.selectCollect(memberId);
        return list;
    }

    @Override
    public int updateState(XzPostion xzPostion) {
      int i=postionMapper.updateState(xzPostion);
        return i;
    }

    @Override
    public List<XzPostion> selByCompanyId(Long companyId) {
       List<XzPostion> postionList=postionMapper.selByCompanyId(companyId);
        return postionList;
    }
}
