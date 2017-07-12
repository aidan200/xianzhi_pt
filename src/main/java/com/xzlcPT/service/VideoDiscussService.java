package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.VideoDiscuss;

import java.util.List;

/**
 * 	视频评论service
 *  Create by 王诗钰 2017/4/17
 */
public interface VideoDiscussService {

    /**添加视频评论关系数据*/
    int insertVDiscuss(VideoDiscuss videoDiscuss);

    /**前台删除视频评论*/
    int deleteVideoDiscuss(Long discussId);

    /**(前台)视频评论关系表删除记录*/
    int deleteVDiscuss(VideoDiscuss videoDiscuss);

    /**新增评论时，修改该视频的video_dis*/
    int updateInsertVideoDis(Long videoId);

    /**(前台)当某视频全部评论都被删除时，修改该视频的video_dis*/
    int updateVideoDis(Long videoId);

    /**查询某视频是否有评论*/
    List<VideoDiscuss> ifHaveDiscuss(Long videoId);

    /**查询新插入的评论的discussId*/
    VideoDiscuss selectDiscussId(String discussWriter);

    /**查看视频评论*/
    PageBean<VideoDiscuss> selectVideoDiscuss(Integer page, Integer rows, Long videoId);
}
