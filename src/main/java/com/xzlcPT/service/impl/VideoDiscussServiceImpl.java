package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.VideoDiscuss;
import com.xzlcPT.dao.VideoDiscussMapper;
import com.xzlcPT.service.VideoDiscussService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 视频评论ServiceImpl
 *
 * @author 王诗钰
 * @create 2017-05-19 13:28
 **/
@Service("videoDiscussService")
public class VideoDiscussServiceImpl implements VideoDiscussService{

    @Autowired
    private VideoDiscussMapper videoDiscussMapper;

    /**添加视频评论关系数据*/
    public int insertVDiscuss(VideoDiscuss videoDiscuss){
        return videoDiscussMapper.insertVDiscuss(videoDiscuss);
    }

    /**前台删除视频评论*/
    public int deleteVideoDiscuss(Long discussId){
        return videoDiscussMapper.deleteVideoDiscuss(discussId);
    }

    /**(前台)视频评论关系表删除记录*/
    public int deleteVDiscuss(VideoDiscuss videoDiscuss){
        return videoDiscussMapper.deleteVDiscuss(videoDiscuss);
    }

    /**新增评论时，修改该视频的video_dis*/
    public int updateInsertVideoDis(Long videoId){
        return videoDiscussMapper.updateInsertVideoDis(videoId);
    }

    /**(前台)当某视频全部评论都被删除时，修改该视频的video_dis*/
    public int updateVideoDis(Long videoId){
        return videoDiscussMapper.updateVideoDis(videoId);
    }

    /**查询某视频是否有评论*/
    public List<VideoDiscuss> ifHaveDiscuss(Long videoId){
        return videoDiscussMapper.ifHaveDiscuss(videoId);
    }

    /**查询新插入的评论的discussId*/
    public VideoDiscuss selectDiscussId(String discussWriter){
        return videoDiscussMapper.selectDiscussId(discussWriter);
    }

    /**查看视频评论*/
    @Override
    public PageBean<VideoDiscuss> selectVideoDiscuss(Integer page, Integer rows, Long videoId){
        PageHelper.startPage(page,rows);
        List<VideoDiscuss> vdList = videoDiscussMapper.selectVideoDiscuss(videoId);
        return new PageBean<VideoDiscuss>(vdList);
    }
}
