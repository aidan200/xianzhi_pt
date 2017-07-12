package com.xzlcPT.controller;


import com.util.PageBean;
import com.xzlcPT.bean.Event;
import com.xzlcPT.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

/**
 * 	活动controller
 *  Create by 王诗钰 2017/4/17
 */
@Controller
@RequestMapping("/Event")
public class EventController extends BaseController {

    @Autowired
    private EventService eventService;

    /**
     * 后台插入一条数据
     * @param event
     * @return
     */
    @RequestMapping("saveEvent.emp")
    public ModelAndView saveEvent(@Validated(Event.F1.class) Event event, BindingResult bindingResult){
        ModelAndView mav= new ModelAndView("backEnd/eventEdit");;
        if (bindingResult.hasErrors()){

        }else{
            if(null != event.getStartTime() && null != event.getEndTime() &&
                    event.getStartTime().getTime() < event.getEndTime().getTime()){
                mav = new ModelAndView("backEnd/eventEdit");
                try{
                    eventService.saveEvent(event);
                    mav.addObject("msg","添加成功");
                }catch (Exception ex){
                    ex.printStackTrace();
                    mav.addObject("msg","添加失败");
                }
            }else {
                mav = new ModelAndView("redirect:selectEventAll.emp");
            }
        }
        return mav;
    }
    /**
     * 后台删除一条数据
     * @param eventId
     * @return
     */
    @RequestMapping("deleteEvent.emp")
    public ModelAndView deleteEvent(Long eventId, RedirectAttributes attr){
        ModelAndView mav = new ModelAndView("redirect:selectEventAll.emp");
        try{
            eventService.deleteEvent(eventId);
            attr.addAttribute("msg","删除成功");
        }catch (Exception ex){
            ex.printStackTrace();;
            attr.addAttribute("msg","删除失败");
        }
        return mav;
    }
    /**
     * 后台修改一条数据
     * @param event
     * @return
     */
    @RequestMapping("updateEvent.emp")
    public ModelAndView updateEvent(@Validated(Event.F1.class) Event event, BindingResult bindingResult){
        ModelAndView mav = new ModelAndView("backEnd/eventEdit");
        if(bindingResult.hasErrors()){

        }else{
            if(event.getStartTime().getTime() < event.getEndTime().getTime()){
                mav = new ModelAndView("backEnd/eventEdit");
                try{
                    eventService.updateEvent(event);
                    mav.addObject("msg","修改成功");
                }catch (Exception ex){
                    ex.printStackTrace();
                    mav.addObject("msg","修改失败");
                }
            } else {
                mav = new ModelAndView("redirect:selectEventAll.emp");
            }
        }
        return mav;
    }
    /**
     * 后台分页查询所有数据
     * @param event
     * @return
     */
    @RequestMapping("selectEventAll.emp")
    public ModelAndView selectEventAllEnd(@RequestParam(defaultValue = "1")Integer page,
                                          @RequestParam(defaultValue = "10")Integer rows, Event event,
                                          Date begin,Date over,Date beginTime,Date overTime){
        ModelAndView mav = new ModelAndView("backEnd/eventShow");
        PageBean<Event> pageBean = eventService.selectEventAllEnd(page,rows,event,begin,over,beginTime,overTime);
        List<Event> eventList = pageBean.getList();
        mav.addObject("eventList",eventList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页行数
        mav.addObject("total",pageBean.getTotal());// 行数
        mav.addObject("event",event);
        mav.addObject("begin",begin);
        mav.addObject("over",over);
        mav.addObject("beginTime",beginTime);
        mav.addObject("overTime",overTime);
        return mav;
    }
    /**
     * 前台分页查询所有数据
     * @param event
     * @return
     */
    @RequestMapping("selectEventAll.do")
    public ModelAndView selectEventAll(@RequestParam(defaultValue = "1")Integer page,
                                          @RequestParam(defaultValue = "7")Integer rows,Event event,
                                       @RequestParam(defaultValue = "1")Integer page2,
                                       @RequestParam(defaultValue = "3")Integer rows2){
        ModelAndView mav = new ModelAndView("foreEnd/events");
        PageBean<Event> pageBean = eventService.selectEventAll(page,rows,event);
        List<Event> eventList = pageBean.getList();
        //查询最近活动
        PageBean<Event> pageBean2 = eventService.selectRecentEvent(page2,rows2);
        List<Event> recentEvent = pageBean2.getList();
        mav.addObject("recentEvent",recentEvent);

        mav.addObject("eventList",eventList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页行数
        mav.addObject("total",pageBean.getTotal());// 行数
        mav.addObject("event",event);
        return mav;
    }
    /**
     * 后台根据主键查询一条数据
     * @param eventId
     * @return
     */
    @ResponseBody
    @RequestMapping("eventEdit.emp")
    public ModelAndView selectByEventEditEnd(Long eventId){
        ModelAndView mav = new ModelAndView("/backEnd/eventEdit");
        Event event = new Event();
        if(null != eventId && 0 != eventId){
            event = eventService.selectByPrimaryKey(eventId);
        }
        mav.addObject("event",event);
        return mav;
    }
    /**
     * 前台分页查询部分数据(index页面使用)
     * @param event
     * @return
     */
    @ResponseBody
    @RequestMapping("eventEditIndex.do")
    public ModelAndView selectEditIndex(@RequestParam(defaultValue = "1")Integer page,
                                        @RequestParam(defaultValue = "2")Integer rows, Event event){
        ModelAndView mav = new ModelAndView("foreEnd/index");
        PageBean<Event> pageBean = eventService.selectEventAll(page,rows,event);
        List<Event> eventList = pageBean.getList();
        mav.addObject("eventList",eventList);
        mav.addObject("event",event);
        return mav;
    }
    /**
     * 前台根据主键查询一条数据
     * @param eventId
     * @return
     */
    @ResponseBody
    @RequestMapping("eventEdit.do")
    public ModelAndView selectByEventEdit(Long eventId){
        ModelAndView mav = new ModelAndView("foreEnd/eventDetail");
        Event event = new Event();
        if(null != eventId && 0 != eventId){
            event = eventService.selectByPrimaryKey(eventId);
        }
        mav.addObject("event",event);
        return mav;
    }
}
