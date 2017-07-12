package com.xzlcPT.dao;

import com.xzlcPT.bean.VideoDiscuss;

import java.util.List;

/**
 * 视频评论dao
 * Create by 王诗钰 2017/5/19
 */
public interface VideoDiscussMapper {

    /**添加视频评论关系数据*/
    int insertVDiscuss(VideoDiscuss videoDiscuss);

    /**(前台)查看视频评论*/
    List<VideoDiscuss> selectVideoDiscuss(Long videoId);

    /**(前台)删除视频评论*/
    int deleteVideoDiscuss(Long discussId);

    /**新增评论时，修改该视频的video_dis*/
    int updateInsertVideoDis(Long videoId);

    /**(前台)当某视频全部评论都被删除时，修改该视频的video_dis*/
    int updateVideoDis(Long videoId);

    /**(前台)查询某视频是否有评论*/
    List<VideoDiscuss> ifHaveDiscuss(Long videoId);

    /**查询新插入的评论的discussId*/
    VideoDiscuss selectDiscussId(String discussWriter);

    /**(前台)视频评论关系表删除记录*/
    int deleteVDiscuss(VideoDiscuss videoDiscuss);
}
