package com.xzlcPT.controller;


import com.util.PageBean;
import com.xzlcPT.bean.News;
import com.xzlcPT.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 	行业动态controller
 *  Create by 王诗钰 2017/4/17
 */
@Controller
@RequestMapping("/News")
public class NewsController extends BaseController{

    @Autowired
    private NewsService newsService;

    /**日期设置*/
    @InitBinder
    public void initBinder(WebDataBinder binder){
        //日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat, true));
    }

    /**
     * 后台插入一条数据
     * @param news
     * @return
     */
    @RequestMapping("saveNews.emp")
    public ModelAndView saveNews(@Validated(News.F1.class)News news, BindingResult bindingResult){
        ModelAndView mav = new ModelAndView("backEnd/newsEdit");
        if(bindingResult.hasErrors()){

        }else{
            try{
                newsService.saveNews(news);
                mav.addObject("msg","添加成功");
            }catch (Exception ex) {
                ex.printStackTrace();
                mav.addObject("msg","添加失败");
            }
        }
        return mav;
    }

    /**
     * 后台删除一条数据
     * @param news
     * @return
     */
    @RequestMapping("deleteNews.emp")
    public ModelAndView deleteNews(News news, RedirectAttributes attr){
        ModelAndView mav = new ModelAndView("redirect:selectNewsAll.emp");
        try{
            newsService.deleteNews(news.getNewsId());
            attr.addAttribute("msg","删除成功");
        }catch (Exception ex){
            ex.printStackTrace();
            attr.addAttribute("msg","删除失败");
        }
        return mav;
    }
    /**
     * 后台修改一条数据
     * @param news
     * @return
     */
    @RequestMapping("updateNews.emp")
    public ModelAndView updateNews(@Validated(News.F1.class)News news, BindingResult bindingResult){
        ModelAndView mav = new ModelAndView("backEnd/newsEdit");
        if (bindingResult.hasErrors()){

        }else{
            try{
                newsService.updateNews(news);
                mav.addObject("msg","修改成功");
            }catch (Exception ex){
                ex.printStackTrace();
                mav.addObject("msg","修改失败");
            }
        }
        return mav;
    }
    /**
     * 后台分页查询所有数据
     * @param news
     * @param startDate
     * @param endDate
     * @return
     */
    @RequestMapping("selectNewsAll.emp")
    public ModelAndView selectNewsAllEnd(@RequestParam(defaultValue = "1")Integer page,
                                         @RequestParam(defaultValue = "10")Integer rows,
                                         News news,Date startDate,Date endDate){
        ModelAndView mav = new ModelAndView("backEnd/newsShow");
        PageBean<News> pageBean = newsService.selectNewsAllEnd(page,rows,news,startDate,endDate);
        List<News> newsList = pageBean.getList();
        mav.addObject("newsList",newsList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页条数
        mav.addObject("total",pageBean.getTotal());//总条数
        mav.addObject("news",news);
        mav.addObject("startDate",startDate);
        mav.addObject("endDate",endDate);
        return mav;
    }
    /**
     * 前台分页查询所有数据
     * @param news
     * @return
     */
    @RequestMapping("selectNewsAll.do")
    public ModelAndView selectNewsAll(@RequestParam(defaultValue = "1")Integer page,
                                      @RequestParam(defaultValue = "15")Integer rows,News news){
        ModelAndView mav = new ModelAndView("foreEnd/dynamic");
        PageBean<News> pageBean = newsService.selectNewsAll(page,rows,news);
        List<News> newsList = pageBean.getList();
        mav.addObject("newsList",newsList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页条数
        mav.addObject("total",pageBean.getTotal());//总条数
        mav.addObject("news",news);
        return mav;
    }
    /**
     * 前台分页查询部分数据(index页面使用)
     * @param news
     * @return
     */
    @RequestMapping("selectNewsIndex.do")
    public ModelAndView selectNewsIndex(@RequestParam(defaultValue = "1")Integer page,
                                       @RequestParam(defaultValue = "10")Integer rows,News news){
        ModelAndView mav = new ModelAndView("forward:eventEditIndex.do");
        PageBean<News> pageBean = newsService.selectNewsAll(page,rows,news);
        List<News> newsList = pageBean.getList();
        mav.addObject("newsList",newsList);
        return mav;
    }
    /**
     * 前台根据主键查询一条数据
     * @param newsId
     * @return
     */
    @ResponseBody
    @RequestMapping("newsEdit.do")
    public ModelAndView selectByNewsEdit(Long newsId){
        ModelAndView mav = new ModelAndView("foreEnd/newsDetail");
        News news = new News();
        if(null != newsId && 0 != newsId){
            news = newsService.selectByPrimaryKey(newsId);
        }
        mav.addObject("news",news);
        return mav;
    }
    /**
     * 后台根据主键查询一条数据
     * @param newsId
     * @return
     */
    @ResponseBody
    @RequestMapping("newsEdit.emp")
    public ModelAndView selectByNewsEditEnd(Long newsId){
        ModelAndView mav = new ModelAndView("backEnd/newsEdit");
        News news = new News();
        if(null != newsId && 0 != newsId){
            news = newsService.selectByPrimaryKey(newsId);
        }
        mav.addObject("news",news);
        return mav;
    }
}
