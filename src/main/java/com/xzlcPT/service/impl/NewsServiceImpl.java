package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.News;
import com.xzlcPT.dao.NewsMapper;
import com.xzlcPT.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 	行业动态serviceImpl
 *  Create by 王诗钰 2017/4/17
 */
@Service("newsService")
public class NewsServiceImpl implements NewsService{

    @Autowired
    private NewsMapper newsMapper;

    /**插入一条数据*/
    public int insert(News news){
        newsMapper.insert(news);
        return 0;
    }

    /**同上，无区别*/
    public int saveNews(News news){
        int a = newsMapper.insert(news);
        return a;
    }

    /**删除一条数据*/
    @Override
    public int deleteByPrimaryKey(Long newsId){
        newsMapper.deleteByPrimaryKey(newsId);
        return 0;
    }

    /**同上，无区别*/
    public int deleteNews(Long newsId){
        int a = newsMapper.deleteByPrimaryKey(newsId);
        return a;
    }

    /**修改一条数据*/
    @Override
    public int updateNews(News news){
        int a = newsMapper.updateByPrimaryKey(news);
        return a;
    }

    /**根据主键查询一条数据*/
    @Override
    public News selectByPrimaryKey(Long newsId){
        return newsMapper.selectByPrimaryKey(newsId);
    }

    /**查询所有数据*/
    public PageBean<News> selectNewsAll(Integer page, Integer rows, News news){
        PageHelper.startPage(page,rows);
        List<News> newsList = newsMapper.selectNewsAll(news);
        return new PageBean<News>(newsList);
    }

    /**(后台)条件查询数据*/
    public PageBean<News> selectNewsAllEnd(Integer page, Integer rows, News news, Date startDate, Date endDate){
        PageHelper.startPage(page,rows);
        Map<String,Object> dateMap = putNewsMap(news);
        if(null != startDate){
            dateMap.put("startDate",startDate);
        }
        if(null != endDate){
            dateMap.put("endDate",endDate);
        }
        List<News> newsList = newsMapper.selectNewsAllEnd(dateMap);
        return new PageBean<News>(newsList);
    }
    /**后台条件查询Map*/
    private Map<String,Object> putNewsMap(News news){
        Map<String,Object> dateMap = new HashMap<>();
        dateMap.put("newsId",news.getNewsId());
        dateMap.put("newsWriter",news.getNewsWriter());
        dateMap.put("newsTitle",news.getNewsTitle());
        dateMap.put("newsArticle",news.getNewsArticle());
        return dateMap;
    }
}
