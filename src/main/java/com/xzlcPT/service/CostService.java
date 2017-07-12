package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.Cost;

import java.util.Date;

/**
 * 	会员交易记录service
 *  Create by 王诗钰 2017/4/25
 */
public interface CostService {

    /**插入一条数据*/
    int insert(Cost cost);

    /**同上，无区别*/
    int saveCost(Cost cost);

    /**删除一条数据*/
    int deleteByPrimaryKey(Cost cost);

    /**同上，无区别*/
    int deleteCost(Cost cost);

    /**修改一条数据*/
    int updateCost(Cost cost);

    /**根据主键查询一条数据*/
    Cost selectByPrimaryKey(Long costId);

    /**查询某会员总支出金额(前台)*/
    Cost selectSumCostMoney(Long vipId);

    /**前台查询所有数据*/
    PageBean<Cost> selectCostAll(Integer page, Integer rows, Cost cost);

    /**后台根据条件查询数据*/
    PageBean<Cost> selectCostAllEnd(Integer page, Integer rows, Cost cost, Date startTime, Date endTime);
}
