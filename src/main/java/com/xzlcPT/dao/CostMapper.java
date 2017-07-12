package com.xzlcPT.dao;


import com.xzlcPT.bean.Cost;

import java.util.List;
import java.util.Map;

/**
 * 	会员交易记录dao
 *  Create by 王诗钰 2017/4/25
 */
public interface CostMapper {

    /**插入一条数据*/
    int insert(Cost cost);

    /**同上，无区别*/
    int insertSelective(Cost cost);

    /**删除一条数据*/
    int deleteByPrimaryKey(Cost cost);

    /**修改一条数据*/
    int updateByPrimaryKey(Cost cost);

    /**同上，无区别*/
    int updateByPrimaryKeySelective(Cost cost);

    /**根据主键查询一条数据*/
    Cost selectByPrimaryKey(Long costId);

    /**前台查询所有数据*/
    List<Cost> selectCostAll(Cost cost);

    /**后台根据条件查询数据*/
    List<Cost> selectCostAllEnd(Map<String, Object> dateMap);

    /**查询某会员总支出金额(前台)*/
    Cost selectSumCostMoney(Long vipId);
}
