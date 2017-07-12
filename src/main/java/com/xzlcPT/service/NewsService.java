package com.xzlcPT.service;


import com.util.PageBean;
import com.xzlcPT.bean.News;

import java.util.Date;

/**
 * 	行业动态service
 *  Create by 王诗钰 2017/4/17
 */
public interface NewsService {

    /**插入一条数据*/
    int insert (News news);

    /**同上，无区别*/
    int saveNews(News news);

    /**删除一条数据*/
    int deleteByPrimaryKey(Long newsId);

    /**同上，无区别*/
    int deleteNews(Long newsId);

    /**修改一条数据*/
    int updateNews(News news);

    /**根据主键查询一条数据*/
    News selectByPrimaryKey(Long newsId);

    /**查询所有数据*/
    PageBean<News> selectNewsAll(Integer page,Integer rows,News news);

    /**(后台)条件查询数据*/
    PageBean<News> selectNewsAllEnd(Integer page, Integer rows, News news, Date startDate, Date endDate);
}
