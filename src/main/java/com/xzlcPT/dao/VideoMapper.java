package com.xzlcPT.dao;/**
 * Created by Administrator on 2017/4/23.
 */

import com.xzlcPT.bean.*;

import java.util.List;

/**
 * 建立视频表Mapper
 *
 * @author 王天岳
 * @create 2017-04-23 16:55
 **/
public interface VideoMapper {

//    前台部分

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
     * 条件搜索全部视频
     * @param xzVideo
     * @return
     */
    List<XzVideo> selectAllVideo(XzVideo xzVideo);

    /**
     * 上传视频
     *
     * @param xzVideo
     * @return
     */
    Long insertVideo(XzVideo xzVideo);

    /**
     * 根据条件查询视频
     *
     * @param xzVideo
     * @return
     */
    List<XzVideo> selectVideo(XzVideo xzVideo);

    /**
     * 查询购买记录
     * @param xzVideoRecord
     * @return
     */
    List<XzVideo> selectBoughtVideo(XzVideoRecord xzVideoRecord);

    /**
     * 查询观看历史
     * @param xzVideoRecord
     * @return
     */
    List<XzVideo> selectVideoHistory(XzVideoRecord xzVideoRecord);

    /**
     * 修改视频信息
     *
     * @param xzVideo
     * @return
     */
    int updateVideo(XzVideo xzVideo);

    /**
     * 根据视频ID查询
     * @param vid
     * @return
     */
    XzVideo selectVideoByID(Long vid);

    /**
     * 用户条件查询已上传视频
     * @param xzVideo
     * @return
     */
    List<XzVideo> selectVideoManage(XzVideo xzVideo);
    /**
     * 后台方法
     */
    /**
     * 条件查询视频信息
     * @param xzVideo
     * @return
     */
    List<XzVideo> selectVideoEnd(XzVideo xzVideo);

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
    List<RecentVideo> selectRecentVideo(RecentVideo recentVideo);
}
