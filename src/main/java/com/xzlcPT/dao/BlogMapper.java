package com.xzlcPT.dao;


import com.xzlcPT.bean.Blog;

import java.util.List;
import java.util.Map;

/**
 * 	博客dao
 *  Create by 王诗钰 2017/4/17
 */
public interface BlogMapper {

    /**前台博客目录*/
    List<Blog> BlogForIndex();
    /**前台博客排行*/
    List<Blog> selBlogTop();

    int deleteByPrimaryKey(Long blogId);

    int insert(Blog record);

    int insertSelective(Blog record);

    Blog selectByPrimaryKey(Long blogId);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKey(Blog record);


    /**根据博客作者查询一条数据*/
    Blog selectByBlogWriter(Blog blog);

    /**前台查询所有数据*/
    List<Blog> selectBlogAll(Blog blog);

    /**前台查询最近博客(3条)*/
    List<Blog> selectRecentBlog();

    /**后台根据条件查询数据*/
    List<Blog> selectBlogAllEnd(Map<String,Object> dateMap);
}
