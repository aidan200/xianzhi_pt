package com.xzlcPT.service.impl;


import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.Event;
import com.xzlcPT.dao.EventMapper;
import com.xzlcPT.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 	活动serviceImpl
 *  Create by 王诗钰 2017/4/17
 */
@Service("eventService")
public class EventServiceImpl implements EventService{

    @Autowired
    private EventMapper eventMapper;

    /**插入一条数据*/
    public int insert(Event event){
        eventMapper.insert(event);
        return 0;
    }

    /**同上，无区别*/
    public int saveEvent(Event event){
        int a = eventMapper.insert(event);
        return a;
    }

    /**删除一条数据*/
    @Override
    public int deleteByPrimaryKey(Long eventId){
        eventMapper.deleteByPrimaryKey(eventId);
        return 0;
    }

    /**同上，无区别*/
    public int deleteEvent(Long eventId){
        int a = eventMapper.deleteByPrimaryKey(eventId);
        return a;
    }

    /**修改一条数据*/
    @Override
    public int updateEvent(Event event){
        int a = eventMapper.updateByPrimaryKey(event);
        return a;
    }

    /**根据主键查询一条数据*/
    @Override
    public Event selectByPrimaryKey(Long eventId){
        return eventMapper.selectByPrimaryKey(eventId);
    }

    /**前台查询所有数据*/
    public PageBean<Event> selectEventAll(Integer page,Integer rows,Event event){
        PageHelper.startPage(page,rows);
        List<Event> eventList = eventMapper.selectEventAll(event);
        return new PageBean<Event>(eventList);
    }

    /**后台根据条件查询数据*/
    public PageBean<Event> selectEventAllEnd(Integer page, Integer rows, Event event, Date begin,
                                             Date over, Date beginTime, Date overTime){
        PageHelper.startPage(page,rows);
        Map<String,Object> timeMap = putEventMap(event);
        if(null != begin){timeMap.put("begin",begin);}
        if(null != over){timeMap.put("over",over);}
        if(null != beginTime){timeMap.put("beginTime",beginTime);}
        if(null != overTime){timeMap.put("overTime",overTime);}
        List<Event> eventList = eventMapper.selectEventAllEnd(timeMap);
        return new PageBean<Event>(eventList);
    }
    /**后台根据条件查询Map*/
    private Map<String,Object> putEventMap(Event event){
        Map<String,Object> timeMap = new HashMap<>();
        timeMap.put("eventId",event.getEventId());
        timeMap.put("startTime",event.getStartTime());
        timeMap.put("endTime",event.getEndTime());
        timeMap.put("eventPlace",event.getEventPlace());
        timeMap.put("eventBy",event.getEventBy());
        timeMap.put("eventWriter",event.getEventWriter());
        timeMap.put("eventTitle",event.getEventTitle());
        timeMap.put("eventArticle",event.getEventArticle());
        timeMap.put("eventType",event.getEventType());
        return timeMap;
    }
    /**查询最近活动(前台)*/
    public PageBean<Event> selectRecentEvent(Integer page,Integer rows){
        PageHelper.startPage(page,rows);
        List<Event> recentList = eventMapper.selectRecentEvent();
        return new PageBean<Event>(recentList);
    }
}
