package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.Item;

import java.util.Date;

/**
 * 	项目service
 *  Create by 王诗钰 2017/4/25
 */
public interface ItemService {

    /**插入一条数据*/
    int insert(Item item);

    /**同上，无区别*/
    int saveItem(Item item);

    /**删除一条数据*/
    int deleteByPrimaryKey(Item item);

    /**同上，无区别*/
    int deleteItem(Item item);

    /**修改一条数据*/
    int updateItem(Item item);

    /**根据主键查询一条数据*/
    Item selectByPrimaryKey(Long itemId);

    /**前台查询所有数据*/
    PageBean<Item> selectItemAll(Integer page, Integer rows, Item item);

    /**后台根据条件查询数据*/
    PageBean<Item> selectItemAllEnd(Integer page, Integer rows, Item item, Date startTime, Date endTime);
}
