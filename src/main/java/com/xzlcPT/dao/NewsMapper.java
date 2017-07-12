package com.xzlcPT.dao;


import com.xzlcPT.bean.News;

import java.util.List;
import java.util.Map;

/**
 * 	行业动态dao
 *  Create by 王诗钰 2017/4/17
 */
public interface NewsMapper {

    /**插入一条数据*/
    int insert(News news);

    /**删除一条数据*/
    int deleteByPrimaryKey(Long newsId);

    /**修改一条数据*/
    int updateByPrimaryKey(News news);

    /**根据主键查询一条数据*/
    News selectByPrimaryKey(Long newsId);

    /**查询所有数据*/
    List<News> selectNewsAll(News news);

    /**后台条件查询数据*/
    List<News> selectNewsAllEnd(Map<String,Object> dateMap);
}
