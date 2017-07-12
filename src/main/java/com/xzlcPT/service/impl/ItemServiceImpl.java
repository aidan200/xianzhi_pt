package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.Item;
import com.xzlcPT.dao.ItemMapper;
import com.xzlcPT.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目ServiceImpl
 *
 * @author 王诗钰
 * @create 2017-04-25 19:44
 **/
@Service("itemService")
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemMapper itemMapper;

    /**插入一条数据*/
    public int insert(Item item){
        itemMapper.insert(item);
        return 0;
    }

    /**同上，无区别*/
    public int saveItem(Item item){
        int a = itemMapper.insert(item);
        return a;
    }

    /**删除一条数据*/
    @Override
    public int deleteByPrimaryKey(Item item){
        itemMapper.deleteByPrimaryKey(item);
        return 0;
    }

    /**同上，无区别*/
    public int deleteItem(Item item){
        int a = itemMapper.deleteByPrimaryKey(item);
        return a;
    }

    /**修改一条数据*/
    @Override
    public int updateItem(Item item){
        int a = itemMapper.updateByPrimaryKey(item);
        return a;
    }

    /**根据主键查询一条数据*/
    @Override
    public Item selectByPrimaryKey(Long itemId){
        return itemMapper.selectByPrimaryKey(itemId);
    }

    /**前台查询所有数据*/
    public PageBean<Item> selectItemAll(Integer page, Integer rows, Item item){
        /*PageHelper.startPage(page,rows);
        List<Item> itemList = itemMapper.selectItemAll(item);
        return new PageBean<Item>(itemList);*/
        return null;
    }

    /**后台根据条件查询数据*/
    public PageBean<Item> selectItemAllEnd(Integer page, Integer rows, Item item, Date startTime, Date endTime){
        PageHelper.startPage(page,rows);
        Map<String,Object> timeMap = putItemMap(item);
        if(null != startTime){
            timeMap.put("startTime",startTime);
        }
        if(null != endTime){
            timeMap.put("endTime",endTime);
        }
        /*List<Item> itemList = itemMapper.selectItemAllEnd(timeMap);
        return new PageBean<Item>(itemList);*/
        return null;
    }
    /**后台条件查询Map*/
    private Map<String,Object> putItemMap(Item item){
        Map<String,Object> timeMap = new HashMap<>();
        timeMap.put("itemId",item.getItemId());
        timeMap.put("itemWriter",item.getItemWriter());
        timeMap.put("itemTitle",item.getItemTitle());
        timeMap.put("itemArticle",item.getItemArticle());
        return timeMap;
    }
}
