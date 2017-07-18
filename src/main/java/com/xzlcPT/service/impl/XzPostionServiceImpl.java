package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.sun.javafx.collections.MappingChange;
import com.util.PageBean;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.dao.XzPostionMapper;
import com.xzlcPT.service.XzPostionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
