package com.xzlcPT.dao;


import com.xzlcPT.bean.Item;

import java.util.List;
import java.util.Map;

/**
 * 	项目dao
 *  Create by 王诗钰 2017/4/25
 */
public interface ItemMapper {

    /**插入一条数据*/
    int insert(Item item);

    /**同上，无区别*/
    int insertSelective(Item item);

    /**删除一条数据*/
    int deleteByPrimaryKey(Item item);

    /**修改一条数据*/
    int updateByPrimaryKey(Item item);

    /**同上，无区别*/
    int updateByPrimaryKeySelective(Item item);

    /**根据主键查询一条数据*/
    Item selectByPrimaryKey(Long itemId);

    /**前台查询所有数据*/
    //List<Item> selectItemAll(Item item);

    /**后台根据条件查询数据*/
    //List<Item> selectItemAllEnd(Map<String, Object> timeMap);
}
