package com.xzlcPT.controller;

import com.util.MD5;
import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Controller 层 LoginController
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/

@Controller
@RequestMapping("/")
@SessionAttributes("userLogin")
public class GoIndexController extends BaseController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private EventService eventService;

    @Autowired
    private ItemService itemService;

    //    跳转到主页
    @RequestMapping("/")
    public ModelAndView getIndex(@RequestParam(defaultValue = "1")Integer page,
                                 @RequestParam(defaultValue = "4")Integer rows, News news,
                                 @RequestParam(defaultValue = "1")Integer page1,
                                 @RequestParam(defaultValue = "3")Integer rows1, Event event,
                                 @RequestParam(defaultValue = "1")Integer page2,
                                 @RequestParam(defaultValue = "6")Integer rows2, Item item) {
        ModelAndView mv = new ModelAndView("foreEnd3/index");
        /*String s2 = (String) httpSession.getAttribute("userIndex");
        if (s2 == null) {
            model.addAttribute("userNull", "未登录");
            model.addAttribute("userIndex", "");
        }
        XzLogin xzLogin = (XzLogin)httpSession.getAttribute("userLogin");
        if (null==xzLogin||"".equals(xzLogin)){
            model.addAttribute("userLogin", new XzLogin());
        }*/
        //行业动态
        /*PageBean<News> pageBean = newsService.selectNewsAll(page,rows,news);
        List<News> newsList = pageBean.getList();
        mv.addObject("newsList",newsList);*/
        //项目
        /*PageBean<Item> pageBean2 = itemService.selectItemAll(page2,rows2,item);
        List<Item>itemList = pageBean2.getList();
        mv.addObject("itemList",itemList);
        mv.addObject("item",item);*/
        //活动
        /*PageBean<Event> pageBean1 = eventService.selectEventAll(page1,rows1,event);
        List<Event> eventList = pageBean1.getList();
        mv.addObject("eventList",eventList);
        mv.addObject("event",event);
        mv.addObject("goIndexA","aaa");
*/
        return mv;
    }


}