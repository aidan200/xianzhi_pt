package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.Discuss;
import com.xzlcPT.bean.VideoDiscuss;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.service.DiscussService;
import com.xzlcPT.service.VideoDiscussService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * 视频评论Controller
 *
 * @author 王诗钰
 * @create 2017-05-19 9:31
 **/
@Controller
@RequestMapping("/VideoDiscuss")
@SessionAttributes("userLogin")
public class VideoDiscussController {

    @Autowired
    private VideoDiscussService videoDiscussService;

    @Autowired
    private DiscussService discussService;

    /**
     * (前台)添加评论
     * @param videoId
     * @param comment
     * @return
     */
    @RequestMapping("insertVideoDiscuss.do")
    public ModelAndView insertVideoDiscuss(@ModelAttribute("userLogin") XzLogin userLogin,
                                           String comment, long videoId, RedirectAttributes redirectAttributes){
        ModelAndView mav = new ModelAndView("redirect:/XzVideo/playVideo.do");
        if(null != userLogin && 0 != userLogin.getLoginId() && !"".equals(comment) && null != comment){
            try{
                Discuss discuss = new Discuss();//存值：评论人和评论内容
                discuss.setDiscussWriter(userLogin.getLoginCount());
                discuss.setDiscussArticle(comment);
                discuss.setDiscussType("视频");
                discussService.insertDiscussInfo(discuss);//存入评论表
                //查出新存入的评论的id
                VideoDiscuss idAndWriter = videoDiscussService.selectDiscussId(userLogin.getLoginCount());
                idAndWriter.setVideoId(videoId);
                videoDiscussService.insertVDiscuss(idAndWriter);//添加视频评论关系数据
                videoDiscussService.updateInsertVideoDis(videoId);//新增评论时，修改该视频的video_dis
                redirectAttributes.addAttribute("msg", "添加成功");
            }catch (Exception ex){
                ex.printStackTrace();
                redirectAttributes.addAttribute("msg","添加失败");
            }
            redirectAttributes.addAttribute("videoID",videoId);
        }
        if("".equals(comment) || null == comment){
            redirectAttributes.addAttribute("videoID",videoId);
            return mav;
        }
        return mav;
    }

    /**(前台)添加回复*/
    @RequestMapping("insertVideoReply.do")
    public ModelAndView insertVideoReply(long videoId, String replyComment, Long discussId,
                                         RedirectAttributes redirectAttributes,
                                         @ModelAttribute("userLogin") XzLogin userLogin){
        ModelAndView mav = new ModelAndView("redirect:/XzVideo/playVideo.do");
        if(null != userLogin && 0 != userLogin.getLoginId() && !"".equals(replyComment) && null != replyComment){
            try {
                Discuss discuss = new Discuss();
                //存值：回复人、回复内容和上级评论编号
                discuss.setDiscussWriter(userLogin.getLoginCount());
                discuss.setDiscussArticle(replyComment);
                discuss.setDiscussId(discussId);
                discuss.setDiscussType("视频");
                //存入评论表
                discussService.saveReply(discuss);
                //修改exist(加1)
                discussService.saveExist(discussId);
                redirectAttributes.addAttribute("msg","添加成功");
            }catch (Exception ex){
                ex.printStackTrace();
                redirectAttributes.addAttribute("msg","添加失败");
            }
            redirectAttributes.addAttribute("videoID",videoId);
        }
        if("".equals(replyComment) || null == replyComment){
            redirectAttributes.addAttribute("videoID",videoId);
            return mav;
        }
        return mav;
    }
    /**
     * (前台)删除评论
     * @param discussId
     * @param videoId
     * @return
     */
    @RequestMapping("deleteVideoDiscuss.do")
    public ModelAndView deleteVideoDiscuss(Long discussId, long videoId, RedirectAttributes attr){
        ModelAndView mav = new ModelAndView("redirect:/XzVideo/playVideo.do");
        if(null != discussId && 0 != discussId && 0 != videoId) {
            try {
                videoDiscussService.deleteVideoDiscuss(discussId);//删除评论表中数据
                VideoDiscuss vDiscuss = new VideoDiscuss();
                vDiscuss.setDiscussId(discussId);
                vDiscuss.setVideoId(videoId);
                videoDiscussService.deleteVDiscuss(vDiscuss);//删除视频评论关系表中数据
                List<VideoDiscuss> videoDis = videoDiscussService.ifHaveDiscuss(videoId);//查询该视频是否还有评论
                if(null == videoDis || 0 == videoDis.size()){//如果没有评论，修改视频表中video_dis字段
                    videoDiscussService.updateVideoDis(videoId);}
                attr.addAttribute("msg","删除成功");
            }catch (Exception ex){
                ex.printStackTrace();
                attr.addAttribute("msg","删除失败");
            }
        }
        mav.addObject("videoID",videoId);
        return mav;
    }
    /**
     * (前台)删除回复
     * @param discussId
     * @param videoId
     * @return
     */
    @RequestMapping("deleteReply.do")
    public ModelAndView deleteReply(Long discussId, long videoId, RedirectAttributes attr){
        ModelAndView mav = new ModelAndView("redirect:/XzVideo/playVideo.do");
        try{
            Discuss discuss = discussService.selectReplyId(discussId);//查询该回复的评论编号(reply_id)
            if(null != discuss){
                Long replyId = discuss.getBlogId();
                videoDiscussService.deleteVideoDiscuss(discussId);//删除回复内容
                PageBean<Discuss> pageBean = discussService.selectReply(1, 10, replyId);
                List<Discuss> replyList = pageBean.getList();
                if (0 == replyList.size()) {//该评论是否还有回复
                    discussService.updateExist(replyId);//没有回复则修改exist
                }
                attr.addAttribute("msg","删除成功");
            }
        }catch (Exception ex){
            ex.printStackTrace();
            attr.addAttribute("msg","删除失败");
        }
        mav.addObject("videoID",videoId);
        return mav;
    }
}
