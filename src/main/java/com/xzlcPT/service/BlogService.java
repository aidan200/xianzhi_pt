package com.xzlcPT.service;


import com.util.PageBean;
import com.xzlcPT.bean.Blog;

import java.util.Date;
import java.util.List;

/**
 * 	博客service
 *  Create by 王诗钰 2017/4/17
 */
public interface BlogService {

    /**博客首页目录*/
    PageBean<Blog> selBlogLogin(int page,int rows);

    int deleteByPrimaryKey(Long blogId);

    int insert(Blog record);

    int insertSelective(Blog record);

    Blog selectByPrimaryKey(Long blogId);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKey(Blog record);

    /**根据博客作者查询一条数据*/
    Blog selectByBlogWriter(Blog blog);

    /**前台查询所有数据*/
    PageBean<Blog> selectBlogAll(Integer page, Integer rows, Blog blog);

    /**前台查询最近博客*/
    PageBean<Blog> selectRecentBlog(Integer page, Integer rows);

    /**后台根据条件查询数据*/
    PageBean<Blog> selectBlogAllEnd(Integer page, Integer rows, Blog blog, Date startTime, Date endTime);
}
