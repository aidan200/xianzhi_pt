package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.RecentVideo;
import com.xzlcPT.bean.VideoDiscuss;
import com.xzlcPT.bean.XzVideo;
import com.xzlcPT.bean.XzVideoRecord;
import com.xzlcPT.dao.VideoMapper;
import com.xzlcPT.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 建立视频Service实现类
 *
 * @author 王天岳
 * @create 2017-04-23 19:00
 **/
@Service("videoService")
public class VideoServiceImpl implements VideoService{
    @Autowired
    private VideoMapper videoMapper;

    /**
     * 根据登录表ID查询 视频ID最大的记录
     * @param loginID
     * @return
     */
    @Override
    public XzVideo selectMaxID(Long loginID) {
        return videoMapper.selectMaxID(loginID);
    }

    @Override
    public int updateVideoAddress(XzVideo xzVideo) {
        return videoMapper.updateVideoAddress(xzVideo);
    }

    /**
     * 条件查询全部视频
     * @param page
     * @param rows
     * @param xzVideo
     * @return
     */
    @Override
    public PageBean<XzVideo> selectAllVideo(Integer page, Integer rows, XzVideo xzVideo) {
        PageHelper.startPage(page,rows);
        List<XzVideo> list = videoMapper.selectAllVideo(xzVideo);
        return new PageBean<XzVideo>(list);
    }

    /**
     * 用户查看 已购视频
     * @param page
     * @param rows
     * @param xzVideoRecord
     * @return
     */
    @Override
    public PageBean<XzVideo> selectBoughtVideo(Integer page, Integer rows, XzVideoRecord xzVideoRecord) {
        PageHelper.startPage(page,rows);
        List<XzVideo> list = videoMapper.selectBoughtVideo(xzVideoRecord);
        return new PageBean<XzVideo>(list);
    }

    /**
     * 用户查看 历史记录
     * @param page
     * @param rows
     * @param xzVideoRecord
     * @return
     */
    @Override
    public PageBean<XzVideo> selectVideoHistory(Integer page, Integer rows, XzVideoRecord xzVideoRecord) {
        PageHelper.startPage(page,rows);
        List<XzVideo> list = videoMapper.selectVideoHistory(xzVideoRecord);
        return new PageBean<XzVideo>(list);
    }

    /**
     * 上传视频
     * @param xzVideo
     * @return
     */
    @Override
    public Long insertVideo(XzVideo xzVideo) {
        Long a = 0L;
        if(xzVideo != null){
            a = videoMapper.insertVideo(xzVideo);
        }
        return a;
    }

    /**
     * 根据条件查询视频
     * @param xzVideo
     * @return
     */
    @Override
    public PageBean<XzVideo> selectVideo(Integer page, Integer rows, XzVideo xzVideo) {
        PageHelper.startPage(page,rows);
        List<XzVideo> list = videoMapper.selectVideo(xzVideo);
        return new PageBean<XzVideo>(list);
    }

    /**
     * 根据ID查询
     * @param videoID
     * @return
     */
    @Override
    public XzVideo selectVideoByID(Long videoID) {
        XzVideo xzVideo = videoMapper.selectVideoByID(videoID);
        return xzVideo;
    }

    /**+
     * 用户修改已上传视频信息
     * @param xzVideo
     * @return
     */
    @Override
    public int updateVideo(XzVideo xzVideo) {
        int a = 0;
        if(xzVideo.getVideoID()!=0){
            a = videoMapper.updateVideo(xzVideo);
        }
        return a;
    }

    /**
     * 用户查询已上传视频信息
     * @param page
     * @param rows
     * @param xzVideo
     * @return
     */
    @Override
    public PageBean<XzVideo> selectVideoManage(Integer page, Integer rows, XzVideo xzVideo) {
        PageHelper.startPage(page,rows);
        List<XzVideo> list = videoMapper.selectVideoManage(xzVideo);
        return new PageBean<XzVideo>(list);
    }


    /**
     * 添加视频信息
     * @param xzVideo
     * @return
     */
    @Override
    public int insertVideoEnd(XzVideo xzVideo) {
        int a = 0;
        a = videoMapper.insertVideoEnd(xzVideo);
        return a;
    }

    /**
     * 根据条件查询视频信息
     * @param page
     * @param rows
     * @param xzVideo
     * @return
     */
    @Override
    public PageBean<XzVideo> selectVideoEnd(Integer page, Integer rows, XzVideo xzVideo) {
        PageHelper.startPage(page,rows);
        List<XzVideo> list = videoMapper.selectVideoEnd(xzVideo);
        return new PageBean<XzVideo>(list);
    }

    /**
     * 修改视频信息
     * @param xzVideo
     * @return
     */
    @Override
    public int updateVideoEnd(XzVideo xzVideo) {
        int a = 0;
        a = videoMapper.updateVideoEnd(xzVideo);
        return a;
    }

    /**
     * 根据ID查询视频信息
     * @param videoID
     * @return
     */
    @Override
    public XzVideo selectVideoByIDEnd(Long videoID) {
        XzVideo xzVideo = new XzVideo();
        xzVideo = videoMapper.selectVideoByIDEnd(videoID);
        return xzVideo;
    }

    /**
     * 查询最新发布的视频(前台)
     * @param page
     * @param rows
     * @param recentVideo
     * @return
     */
    @Override
    public PageBean<RecentVideo> selectRecentVideo(Integer page, Integer rows, RecentVideo recentVideo){
        PageHelper.startPage(page,rows);
        List<RecentVideo> list = videoMapper.selectRecentVideo(recentVideo);
        return new PageBean<RecentVideo>(list);
    }
}
