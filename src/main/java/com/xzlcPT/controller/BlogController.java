package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.Blog;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 博客controller
 * Create by 王诗钰 2017/4/17
 */
@Controller
@RequestMapping("/Blog")
@SessionAttributes({"userLogin"})
public class BlogController extends BaseController {

    @Autowired
    private BlogService blogService;

    //前台
    /**
     * 博客首页查询
     * @return page，rows
     */
    @RequestMapping("/selBlogIndex.do")
    public ModelAndView selBlogIndex(@RequestParam(defaultValue = "1") Integer page,
                                     @RequestParam(defaultValue = "6") Integer rows){
        ModelAndView mv = new ModelAndView("foreEnd3/blog_home");
        PageBean<Blog> pageBean = blogService.selBlogLogin(page,rows);
        mv.addObject("blist",pageBean.getList());
        mv.addObject("page", pageBean.getPageNum());//当前页数
        mv.addObject("pages", pageBean.getPages());//总页数
        mv.addObject("rows", pageBean.getPageSize());//每页条数
        mv.addObject("total", pageBean.getTotal());//总条数
        return mv;
    }
    @ResponseBody
    @RequestMapping("/selBlogIndexAjax.do")
    public Map<String,Object> selBlogIndexAjax(@RequestParam(defaultValue = "1") Integer page,
                                     @RequestParam(defaultValue = "6") Integer rows){
        Map<String,Object> map = new HashMap<>();
        PageBean<Blog> pageBean = blogService.selBlogLogin(page,rows);
        map.put("blist",pageBean.getList());
        map.put("page", pageBean.getPageNum());//当前页数
        map.put("pages", pageBean.getPages());//总页数
        map.put("rows", pageBean.getPageSize());//每页条数
        map.put("total", pageBean.getTotal());//总条数
        return map;
    }
    /**
     *发表博客
     * @param blog
     */
    @RequestMapping("/insertBlog.do")
    public ModelAndView insertBlog(Blog blog,@ModelAttribute("userLogin")XzLogin userLogin){
        ModelAndView mv = new ModelAndView("redirect:/Blog/selBlogIndex.do");
        blog.setLoginId(userLogin.getLoginId());
        blog.setCreateTime(new Date());
        blog.setDeleteFlag(0);
        blogService.insert(blog);
        System.out.println(blog);
        return mv;
    }



    /**
     * 后台插入一条数据
     *
     * @param blog
     * @return
     */
    @RequestMapping("saveBlog.emp")
    public ModelAndView saveBlog(@Validated(Blog.F1.class) Blog blog, BindingResult bindingResult) {
        ModelAndView mav = new ModelAndView("backEnd/blogEdit");
        System.out.println("saveBlog.emp : "+blog);
        if (bindingResult.hasErrors()) {

        } else {
            try {
                blogService.insert(blog);
                mav.addObject("msg", "添加成功");
            } catch (Exception ex) {
                ex.printStackTrace();
                mav.addObject("msg", "添加失败");
            }
        }
        return mav;
    }

    /**
     * 后台删除一条数据
     *
     * @param blogId
     * @return
     */
    @RequestMapping("deleteBlog.emp")
    public ModelAndView deleteBlog(Long blogId, RedirectAttributes attr) {
        ModelAndView mav = new ModelAndView("redirect:selectBlogAll.emp");
        try {
            blogService.deleteByPrimaryKey(blogId);
            attr.addAttribute("msg", "删除成功");
        } catch (Exception ex) {
            ex.printStackTrace();
            attr.addAttribute("msg", "删除失败");
        }
        return mav;
    }

    /**
     * 后台修改一条数据
     *
     * @param blog
     * @return
     */
    @RequestMapping("updateBlog.emp")
    public ModelAndView updateBlog(@Validated(Blog.F1.class) Blog blog, BindingResult bindingResult) {
        ModelAndView mav = new ModelAndView("backEnd/blogEdit");
        if (bindingResult.hasErrors()) {

        } else {
            try {
                blogService.updateByPrimaryKey(blog);
                mav.addObject("msg", "修改成功");
            } catch (Exception ex) {
                ex.printStackTrace();
                mav.addObject("msg", "修改失败");
            }
        }
        return mav;
    }

    /**
     * 后台分页查询所有数据
     *
     * @param blog
     * @return
     */
    @RequestMapping("selectBlogAll.emp")
    public ModelAndView selectBlogAllEnd(@RequestParam(defaultValue = "1") Integer page,
                                         @RequestParam(defaultValue = "10") Integer rows,
                                         Date startTime, Date endTime, Blog blog) {
        ModelAndView mav = new ModelAndView("backEnd/blogShow");
        PageBean<Blog> pageBean = blogService.selectBlogAllEnd(page, rows, blog, startTime, endTime);
        List<Blog> blogList = pageBean.getList();
        mav.addObject("blogList", blogList);
        mav.addObject("page", pageBean.getPageNum());//当前页数
        mav.addObject("pages", pageBean.getPages());//总页数
        mav.addObject("rows", pageBean.getPageSize());//每页条数
        mav.addObject("total", pageBean.getTotal());//总条数
        mav.addObject("blog", blog);
        mav.addObject("startTime", startTime);
        mav.addObject("endTime", endTime);
        return mav;
    }

    /**
     * 前台分页查询所有数据
     *
     * @param blog
     * @return
     */
    @RequestMapping("selectBlogAll.do")
    public ModelAndView selectBlogAll(@RequestParam(defaultValue = "1") Integer page,
                                      @RequestParam(defaultValue = "6") Integer rows, Blog blog) {
        ModelAndView mav = new ModelAndView("foreEnd/blog");
        PageBean<Blog> pageBean = blogService.selectBlogAll(page, rows, blog);
        List<Blog> blogList = pageBean.getList();
        mav.addObject("blogList", blogList);
        mav.addObject("page", pageBean.getPageNum());//当前页数
        mav.addObject("pages", pageBean.getPages());//总页数
        mav.addObject("rows", pageBean.getPageSize());//每页条数
        mav.addObject("total", pageBean.getTotal());//总条数
        mav.addObject("blog", blog);
        return mav;
    }

    /**
     * 后台根据主键查询一条数据
     *
     * @param blogId
     * @return
     */
    @ResponseBody
    @RequestMapping("blogEdit.emp")
    public ModelAndView blogEditEnd(Long blogId) {
        ModelAndView mav = new ModelAndView("backEnd/blogEdit");
        Blog blog = new Blog();
        if (null != blogId && 0 != blogId) {
            blog = blogService.selectByPrimaryKey(blogId);
        }
        mav.addObject("blog", blog);
        return mav;
    }

    /**
     * 后台根据博客作者查询一条数据
     *
     * @param blogWriter
     * @return
     */
    @ResponseBody
    @RequestMapping("selectByBlogWriter.emp")
    public ModelAndView selectByBlogWriter(Blog blogWriter) {
        ModelAndView mav = new ModelAndView("backEnd/blogEdit");
        Blog blog = new Blog();
        if (null != blogWriter) {
            blog = blogService.selectByBlogWriter(blogWriter);
        }
        mav.addObject("blog", blog);
        return mav;
    }

    /**
     * 前台根据主键查询一条数据
     *
     * @param blogId
     * @return
     */
    @ResponseBody
    @RequestMapping("blogEdit.do")
    public ModelAndView selectByBlogEdit(Long blogId) {
        ModelAndView mav = new ModelAndView("foreEnd/blogDiscuss");
        Blog blog = new Blog();
        if (null != blogId && 0 != blogId) {
            blog = blogService.selectByPrimaryKey(blogId);
        }
        mav.addObject("blog", blog);
        return mav;
    }
}
