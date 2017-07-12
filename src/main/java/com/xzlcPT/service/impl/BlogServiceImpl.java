package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.Blog;

import com.xzlcPT.dao.BlogMapper;

import com.xzlcPT.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 	博客serviceImpl
 *  Create by 王诗钰 2017/4/17
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService{

    @Autowired
    private BlogMapper blogMapper;

    @Override
    public PageBean<Blog> selBlogLogin(int page,int rows) {
        PageHelper.startPage(page,rows);
        List<Blog> blogList = blogMapper.BlogForIndex();
        return new PageBean<Blog>(blogList);
    }

    @Override
    public int deleteByPrimaryKey(Long blogId) {
        return 0;
    }

    @Override
    public int insert(Blog record) {
        return blogMapper.insert(record);
    }

    @Override
    public int insertSelective(Blog record) {
        return 0;
    }

    @Override
    public Blog selectByPrimaryKey(Long blogId) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Blog record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Blog record) {
        return 0;
    }

    /*    *//**插入一条数据*//*
    public int insert(Blog blog){
        blogMapper.insert(blog);
        return 0;
    }

    *//**同上，无区别*//*
    public int saveBlog(Blog blog){
        int a = blogMapper.insert(blog);
        return a;
    }

    *//**删除一条数据*//*
    @Override
    public int deleteByPrimaryKey(Blog blog){
        blogMapper.deleteByPrimaryKey(blog);
        return 0;
    }

    *//**同上，无区别*//*
    public int deleteBlog(Blog blog){
        int a = blogMapper.deleteByPrimaryKey(blog);
        return a;
    }

    *//**删除评论时修改博客表的if_exist*//*
    public int deleteIfExist(Long blogId){
        return blogMapper.deleteIfExist(blogId);
    }

    *//**修改一条数据*//*
    @Override
    public int updateBlog(Blog blog){
        int a = blogMapper.updateByPrimaryKey(blog);
        return a;
    }

    *//**根据主键查询一条数据*//*
    @Override
    public Blog selectByPrimaryKey(Long blogId){
        return blogMapper.selectByPrimaryKey(blogId);
    }*/

    /**根据博客作者查询一条数据*/
    @Override
    public Blog selectByBlogWriter(Blog blogWriter){
        return blogMapper.selectByBlogWriter(blogWriter);
    }

    /**前台查询所有数据*/
    public PageBean<Blog> selectBlogAll(Integer page, Integer rows, Blog blog){
        PageHelper.startPage(page,rows);
        List<Blog> blogList = blogMapper.selectBlogAll(blog);
        return new PageBean<Blog>(blogList);
    }

    /**前台查询最近博客*/
    public PageBean<Blog> selectRecentBlog(Integer page, Integer rows){
        PageHelper.startPage(page,rows);
        List<Blog> blogList = blogMapper.selectRecentBlog();
        return new PageBean<Blog>(blogList);
    }

    /**后台根据条件查询数据*/
    public PageBean<Blog> selectBlogAllEnd(Integer page, Integer rows, Blog blog, Date startTime, Date endTime){
        PageHelper.startPage(page,rows);
        Map<String,Object> dateMap = putBlogMap(blog);
        if(null != startTime){
            dateMap.put("startTime",startTime);
        }
        if(null != endTime){
            dateMap.put("endTime",endTime);
        }
        List<Blog> blogList = blogMapper.selectBlogAllEnd(dateMap);
        return new PageBean<Blog>(blogList);
    }
    /**后台条件查询Map*/
    private Map<String,Object> putBlogMap(Blog blog){
        Map<String,Object> dateMap = new HashMap<>();
        dateMap.put("blogId",blog.getBlogId());
        //dateMap.put("blogWriter",blog.getBlogWriter());
        dateMap.put("blogTitle",blog.getBlogTitle());
        dateMap.put("blogArticle",blog.getBlogArticle());
        return dateMap;
    }
}
