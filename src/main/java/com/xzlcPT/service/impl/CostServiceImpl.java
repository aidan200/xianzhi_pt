package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.Cost;
import com.xzlcPT.dao.CostMapper;
import com.xzlcPT.service.CostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 会员交易记录ServiceImpl
 *
 * @author 王诗钰
 * @create 2017-04-25 14:33
 **/
@Service("costService")
public class CostServiceImpl implements CostService {

    @Autowired
    private CostMapper costMapper;

    /**插入一条数据*/
    public int insert(Cost cost){
        costMapper.insert(cost);
        return 0;
    }

    /**同上，无区别*/
    public int saveCost(Cost cost){
        int a = costMapper.insert(cost);
        return a;
    }

    /**删除一条数据*/
    @Override
    public int deleteByPrimaryKey(Cost cost){
        costMapper.deleteByPrimaryKey(cost);
        return 0;
    }

    /**同上，无区别*/
    public int deleteCost(Cost cost){
        int a = costMapper.deleteByPrimaryKey(cost);
        return a;
    }

    /**修改一条数据*/
    @Override
    public int updateCost(Cost cost){
        int a = costMapper.updateByPrimaryKey(cost);
        return a;
    }

    /**根据主键查询一条数据*/
    @Override
    public Cost selectByPrimaryKey(Long costId){
        return costMapper.selectByPrimaryKey(costId);
    }

    /**查询某会员总支出金额(前台)*/
    public Cost selectSumCostMoney(Long vipId){
        return costMapper.selectSumCostMoney(vipId);
    }

    /**前台查询所有数据*/
    public PageBean<Cost> selectCostAll(Integer page, Integer rows, Cost cost){
        PageHelper.startPage(page,rows);
        List<Cost> costList = costMapper.selectCostAll(cost);
        return new PageBean<Cost>(costList);
    }

    /**后台根据条件查询数据*/
    public PageBean<Cost> selectCostAllEnd(Integer page, Integer rows, Cost cost, Date startTime, Date endTime){
        PageHelper.startPage(page,rows);
        Map<String,Object> timeMap = putCostMap(cost);
        if(null != startTime){
            timeMap.put("startTime",startTime);
        }
        if(null != endTime){
            timeMap.put("endTime",endTime);
        }
        List<Cost> costList = costMapper.selectCostAllEnd(timeMap);
        return new PageBean<Cost>(costList);
    }
    /**后台条件查询Map*/
    private Map<String,Object> putCostMap(Cost cost){
        Map<String,Object> timeMap = new HashMap<>();
        timeMap.put("costId",cost.getCostId());
        timeMap.put("vipId",cost.getVipId());
        timeMap.put("costMoney",cost.getCostMoney());
        timeMap.put("costType",cost.getCostType());
        timeMap.put("costReason",cost.getCostReason());
        return timeMap;
    }
}
