package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.Discuss;
import com.xzlcPT.dao.BlogMapper;
import com.xzlcPT.dao.DiscussMapper;
import com.xzlcPT.service.DiscussService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 	评论serviceImpl
 *  Create by 王诗钰 2017/4/17
 */
@Service("discussService")
public class DiscussServiceImpl implements DiscussService {

    @Autowired
    private DiscussMapper discussMapper;

    @Autowired
    private BlogMapper blogMapper;

    /**(不带blogId)添加评论*/
    public int insertDiscuss(Discuss discuss){
        discussMapper.insertDiscuss(discuss);
        return 0;
    }

    /**(前台)添加评论*/
    public int insertDiscussInfo(Discuss discuss){
        return discussMapper.insertDiscussInfo(discuss);
    }

    /**同第一条，无区别*/
    public int saveDiscuss(Discuss discuss){
        return discussMapper.insertDiscuss(discuss);
    }

    /**(根据discussId)向xz_blog_discuss添加一条记录*/
    public int saveBlogDiscuss(Discuss blogDiscuss){
        return discussMapper.insertBlogDiscuss(blogDiscuss);
    }

    /**(NOW(),带replyId)前台添加回复*/
    public int insertReply(Discuss discuss){
        discussMapper.insertReply(discuss);
        return 0;
    }

    /**同上，无区别*/
    public int saveReply(Discuss discuss){
        return discussMapper.insertReply(discuss);
    }

    /**添加评论时修改博客表的if_exist*/
    /*public int updateIfExist(Long blogId){
        return blogMapper.updateIfExist(blogId);
    }*/

    /**删除评论*/
    @Override
    public int deleteDiscuss(Long discussId){
        int a = discussMapper.deleteDiscuss(discussId);
        return a;
    }

    /**删除博客评论关系表的数据(blogId,discussId)*/
    public int deleteBlogDiscuss(Long blogId,Long discussId){
        Discuss discuss = new Discuss();
        discuss.setBlogId(blogId);
        discuss.setDiscussId(discussId);
        return discussMapper.deleteBlogDiscuss(discuss);
    }

    /**(不带replyId)后台修改评论*/
    @Override
    public int updateDiscuss(Discuss discuss){
        return discussMapper.updateDiscuss(discuss);
    }

    /**(带replyId)查看单条评论*/
    @Override
    public Discuss selectByPrimaryKey(Long discussId){
        return discussMapper.selectByPrimaryKey(discussId);
    }

    /**(后台，带exist，带blogId)查询所有评论和回复*/
    public PageBean<Discuss> selectDiscussAndReplyAll(Integer page, Integer rows, Long discussId){
        PageHelper.startPage(page,rows);
        List<Discuss> discussList = discussMapper.selectDiscussAndReplyAll(discussId);
        return new PageBean<Discuss>(discussList);
    }

    /**(前台)根据blogId查看评论和回复*/
    public PageBean<Discuss> selectDiscussAndReply(Integer page,Integer rows,Long blogId){
        PageHelper.startPage(page,rows);
        List<Discuss> discussList = discussMapper.selectDiscussAndReply(blogId);
        return new PageBean<Discuss>(discussList);
    }

    /**查询新插入的评论的discussId和discussWriter*/
    @Override
     public Discuss selectDiscussId(String string){
        return discussMapper.selectDiscussId(string);
     }

    /**(返回List)根据replyId查询回复内容*/
    public PageBean<Discuss> selectReply(Integer page, Integer rows,Long replyId){
         PageHelper.startPage(page,rows);
         List<Discuss> replyList = discussMapper.selectReply(replyId);
         return new PageBean<Discuss>(replyList);
     }

    /**(在关系表中)根据discussId查询对应的blogId*/
    public Discuss selectBlogId(Long discussId){
        return discussMapper.selectBlogId(discussId);
    }

    /**(根据discussId)修改对应的blogId*/
    public int updateBlogId(Discuss discuss){
        return discussMapper.updateBlogId(discuss);
    }

    /**(带discussTime，带replyId)后台添加回复*/
    public int insertReplyEnd(Discuss discuss){
        return discussMapper.insertReplyEnd(discuss);
    }

    /**(后台，带discussTime，带replyId)修改回复*/
    public int updateReply(Discuss discuss){
        return discussMapper.updateReply(discuss);
    }

    /**查询某条回复的上级评论编号*/
    public Discuss selectReplyId(Long discussId){
        return discussMapper.selectReplyId(discussId);
    }

    /**(后台)某条评论没有回复时，修改exist*/
    public int updateExist(Long discussId){
        return discussMapper.updateExist(discussId);
    }

    /**(后台)某条评论被添加回复时，修改exist*/
    public int saveExist(Long discussId){
        return discussMapper.saveExist(discussId);
    }

    /**(后台，带exist，带blogId)根据条件查询评论表中数据*/
    public PageBean<Discuss> selectDiscussSelective(Integer page, Integer rows, Discuss discuss, Date startTime, Date endTime){
        PageHelper.startPage(page,rows);
        Map<String,Object> dateMap = putDiscussMap(discuss);
        if(null != startTime){
            dateMap.put("startTime",startTime);
        }
        if(null != endTime){
            dateMap.put("endTime",endTime);
        }
        List<Discuss> discussesList = discussMapper.selectDiscussSelective(dateMap);
        return new PageBean<Discuss>(discussesList);
    }
    /**后台根据条件查询Map(discuss)*/
    private Map<String,Object> putDiscussMap(Discuss discuss){
        Map<String,Object> dateMap = new HashMap<>();
        dateMap.put("discussId",discuss.getDiscussId());
        dateMap.put("discussWriter",discuss.getDiscussWriter());
        dateMap.put("discussArticle",discuss.getDiscussArticle());
        dateMap.put("blogId",discuss.getBlogId());
        dateMap.put("exist",discuss.getExist());
        return dateMap;
    }
    /**(带replyId，后台)根据条件查询回复评论数据*/
    public PageBean<Discuss>selectReplySelective(Integer page, Integer rows, Discuss discuss,Date startTime,Date endTime){
        PageHelper.startPage(page,rows);
        Map<String,Object> dateMap = putReplyMap(discuss);
        if (null != startTime){
            dateMap.put("startTime",startTime);
        }
        if(null != endTime){
            dateMap.put("endTime",endTime);
        }
        List<Discuss> replyList = discussMapper.selectReplySelective(dateMap);
        return new PageBean<Discuss>(replyList);
    }
    /**后台根据条件查询Map(reply)*/
    private Map<String,Object> putReplyMap(Discuss discuss){
        Map<String,Object> dateMap = new HashMap<>();
        dateMap.put("discussId",discuss.getDiscussId());
        dateMap.put("blogId",discuss.getBlogId());
        dateMap.put("discussWriter",discuss.getDiscussWriter());
        dateMap.put("discussArticle",discuss.getDiscussArticle());
        return dateMap;
    }

    /**查看某条博客是否有评论*/
    public PageBean<Discuss> selectIfExist(Integer page, Integer rows, Long blogId){
        PageHelper.startPage(page,rows);
        List<Discuss> ifExist = discussMapper.selectIfExist(blogId);
        return new PageBean<Discuss>(ifExist);
    }

    /**根据blogId查看相应评论(后台，只有评论和exist，没有回复内容)*/
    public PageBean<Discuss> selectOnlyDiscuss(Integer page, Integer rows, Long blogId){
        PageHelper.startPage(page,rows);
        List<Discuss> discussList = discussMapper.selectOnlyDiscuss(blogId);
        return new PageBean<Discuss>(discussList);
    }

    /**
     * 修改 评论头像
     * @param discuss
     * @return
     */
    @Override
    public int updateMemberPicture(Discuss discuss) {
        return discussMapper.updateMemberPicture(discuss);
    }
}
