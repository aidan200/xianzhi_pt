package com.xzlcPT.dao;


import com.xzlcPT.bean.Event;

import java.util.List;
import java.util.Map;

/**
 * 	活动dao
 *  Create by 王诗钰 2017/4/17
 */
public interface EventMapper {

    /**插入一条数据*/
    int insert(Event event);

    /**删除一条数据*/
    int deleteByPrimaryKey(Long eventId);

    /**修改一条数据*/
    int updateByPrimaryKey(Event event);

    /**根据主键查询一条数据*/
    Event selectByPrimaryKey(Long eventId);

    /**前台查询所有数据*/
    List<Event> selectEventAll(Event event);

    /**后台根据条件查询数据*/
    List<Event> selectEventAllEnd(Map<String,Object> timeMap);

    /**查询最近活动(前台)*/
    List<Event> selectRecentEvent();
}
