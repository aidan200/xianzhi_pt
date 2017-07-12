package com.xzlcPT.dao;


import com.xzlcPT.bean.Discuss;

import java.util.List;
import java.util.Map;

/**
 * 	评论dao
 *  Create by 王诗钰 2017/4/17
 */
public interface DiscussMapper {

    //(不带blogId，后台)添加评论
    int insertDiscuss(Discuss discuss);

    //(前台)添加评论
    int insertDiscussInfo(Discuss discuss);

    //(根据discussId)向xz_blog_discuss添加一条记录
    int insertBlogDiscuss(Discuss blogDiscuss);

    //(NOW(),带replyId)前台添加回复
    int insertReply(Discuss discuss);

    //(带discussTime，带replyId)后台添加回复
    int insertReplyEnd(Discuss discuss);

    //删除评论
    int deleteDiscuss(Long discussId);

    //删除博客评论关系表的数据(blogId,discussId)
    int deleteBlogDiscuss(Discuss discuss);

    //(不带replyId)后台修改评论
    int updateDiscuss(Discuss discuss);

    //(根据discussId)修改对应的blogId
    int updateBlogId(Discuss discuss);

    //(后台，带discussTime，带replyId)修改回复
    int updateReply(Discuss discuss);

    //(后台)某条评论没有回复时，修改exist
    int updateExist(Long discussId);

    //(后台)某条评论被添加回复时，修改exist
    int saveExist(Long discussId);

    //(后台，带exist，带blogId)查询所有评论和回复
    List<Discuss> selectDiscussAndReplyAll(Long discussId);

    //(带replyId)查看单条评论
    Discuss selectByPrimaryKey(Long discussId);

    //(前台)根据blogId查看评论和回复
    List<Discuss> selectDiscussAndReply(Long blogId);

    //查询新插入的评论的discussId和discussWriter
    Discuss selectDiscussId(String string);

    //(返回List)根据replyId查询回复内容
    List<Discuss> selectReply(Long replyId);

    //(在关系表中)根据discussId查询对应的blogId
    Discuss selectBlogId(Long discussId);

    //查询某条回复的上级评论编号
    Discuss selectReplyId(Long discussId);

    //(后台，带exist，带blogId)根据条件查询评论表中数据
    List<Discuss> selectDiscussSelective(Map<String,Object> dateMap);

    //(带replyId，后台)根据条件查询回复评论数据
    List<Discuss>selectReplySelective(Map<String,Object> dateMap);

    //查看某条博客是否有评论
    List<Discuss> selectIfExist(Long blogId);

    //根据blogId查看相应评论(后台，只有评论和exist，没有回复内容)
    List<Discuss> selectOnlyDiscuss(Long blogId);

    /**
     * 修改 评论头像
     * @param discuss
     * @return
     */
    int updateMemberPicture(Discuss discuss);
}
