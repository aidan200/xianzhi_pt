package com.xzlcPT.service;/**
 * Created by Administrator on 2017/4/23.
 */

import com.util.PageBean;
import com.xzlcPT.bean.RecentVideo;
import com.xzlcPT.bean.VideoDiscuss;
import com.xzlcPT.bean.XzVideo;
import com.xzlcPT.bean.XzVideoRecord;

import java.util.List;

/**
 * 建立视频Service
 *
 * @author 王天岳
 * @create 2017-04-23 18:58
 **/
public interface VideoService {
    /**
     * 根据登录表ID查询 视频ID最大的记录
     * @param loginID
     * @return
     */
    XzVideo selectMaxID(Long loginID);

    /**
     * 修改视频地址
     * @param xzVideo
     * @return
     */
    int updateVideoAddress(XzVideo xzVideo);

    /**
     * 条件查询全部视频
     * @param page
     * @param rows
     * @param xzVideo
     * @return
     */
    PageBean<XzVideo> selectAllVideo(Integer page, Integer rows, XzVideo xzVideo);


    /**
     * 用户查询 已购视频
     * @param page
     * @param rows
     * @param xzVideoRecord
     * @return
     */
    PageBean<XzVideo> selectBoughtVideo(Integer page, Integer rows, XzVideoRecord xzVideoRecord);

    /**
     * 用户查询 历史记录
     * @param page
     * @param rows
     * @param xzVideoRecord
     * @return
     */
    PageBean<XzVideo> selectVideoHistory(Integer page, Integer rows, XzVideoRecord xzVideoRecord);

    /**
     * 上传视频
     * @param xzVideo
     * @return
     */
    Long insertVideo(XzVideo xzVideo);

    /**
     * 根据条件查询视频
     * @param xzVideo
     * @return
     */
    PageBean<XzVideo> selectVideo(Integer page, Integer rows, XzVideo xzVideo);

    /**
     * 根据视频ID查询
     * @param videoID
     * @return
     */
    XzVideo selectVideoByID(Long videoID);

    /**
     * 修改 视频信息
     * @param xzVideo
     * @return
     */
    int updateVideo(XzVideo xzVideo);

    /**
     * 用户 查询已上传视频
     * @param xzVideo
     * @return
     */
    PageBean<XzVideo> selectVideoManage(Integer page, Integer rows, XzVideo xzVideo);
    /**
     * 后台
     */
    /**
     * 根据条件查询视频信息
     * @param xzVideo
     * @return
     */
    PageBean<XzVideo> selectVideoEnd(Integer page, Integer rows, XzVideo xzVideo);

    /**
     * 添加视频
     * @param xzVideo
     * @return
     */
    int insertVideoEnd(XzVideo xzVideo);

    /**
     * 修改视频信息
     * @param xzVideo
     * @return
     */
    int updateVideoEnd(XzVideo xzVideo);

    /**
     * 根据ID查询视频信息
     * @param videoID
     * @return
     */
    XzVideo selectVideoByIDEnd(Long videoID);

    /**
     * 查询最新发布的视频(前台)
     * @param recentVideo
     * @return
     */
    PageBean<RecentVideo> selectRecentVideo(Integer page, Integer rows, RecentVideo recentVideo);
}
