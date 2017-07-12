package com.xzlcPT.service;


import com.util.PageBean;
import com.xzlcPT.bean.Event;

import java.util.Date;

/**
 * 	活动service
 *  Create by 王诗钰 2017/4/17
 */
public interface EventService {

    /**插入一条数据*/
    int insert(Event event);

    /**同上，无区别*/
    int saveEvent(Event event);

    /**删除一条数据*/
    int deleteByPrimaryKey(Long eventId);

    /**同上，无区别*/
    int deleteEvent(Long eventId);

    /**修改一条数据*/
    int updateEvent(Event event);

    /**根据主键查询一条数据*/
    Event selectByPrimaryKey(Long eventId);

    /**前台查询所有数据*/
    PageBean<Event> selectEventAll(Integer page,Integer rows,Event event);

    /**后台根据条件查询数据*/
    PageBean<Event> selectEventAllEnd(Integer page, Integer rows, Event event, Date begin,
                                      Date over, Date beginTime, Date overTime);
    /**查询最近活动(前台)*/
    PageBean<Event> selectRecentEvent(Integer page,Integer rows);
}
