package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.BlogService;
import com.xzlcPT.service.CompanyInfoService;
import com.xzlcPT.service.DiscussService;
import com.xzlcPT.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

/**
 * 评论controller
 * Create by 王诗钰 2017/4/17
 */
@Controller
@SessionAttributes("userLogin")
@RequestMapping("/Discuss")
public class DiscussController extends BaseController {

    @Autowired
    private DiscussService discussService;

    @Autowired
    private BlogService blogService;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private CompanyInfoService companyInfoService;

    /**
     * 添加评论(后台)
     *
     * @param discuss
     * @return
     */
    @RequestMapping("saveDiscuss.emp")
    public ModelAndView saveDiscussEnd(Discuss discuss) {
        Long blogId = discuss.getBlogId();
        discuss.setBlogId(null);
        ModelAndView mav = new ModelAndView("backEnd/discussEdit");
        try {
            //存入评论表
            discussService.insertDiscuss(discuss);
            //查出新存入的评论的id
            Discuss discuss2 = discussService.selectDiscussId(discuss.getDiscussWriter());
            discuss2.setBlogId(blogId);
            //存值：博客评论关系表
            discussService.saveBlogDiscuss(discuss2);
            //修改博客表的if_exist
            //discussService.updateIfExist(blogId);
            mav.addObject("msg", "添加成功");
        } catch (Exception ex) {
            ex.printStackTrace();
            mav.addObject("msg", "添加失败");
        }
        return mav;
    }

    /**
     * 添加评论(前台)
     *
     * @param comment
     * @param blogId
     * @return
     */
    @RequestMapping("interceptSaveDiscuss.do")
    public ModelAndView saveDiscuss(String comment, Long blogId, @ModelAttribute("userLogin") XzLogin userLogin,
                                    RedirectAttributes redirectAttributes) {
        ModelAndView mav;
        if (null != userLogin && 0 != userLogin.getLoginId() && !"".equals(comment) && null != comment) {
            try {
                Discuss discuss = new Discuss();
                mav = new ModelAndView("redirect:selectDiscussAndReply.do");

                if (userLogin.getLoginType() == 1){
                    XzMember xzMember = userInfoService.selectUserByID(userLogin.getLoginId());
                    discuss.setMemberID(xzMember.getLoginId());
                    discuss.setMemberPicture(xzMember.getMemberPicture());
                }else{
                    XzCompany xzCompany = companyInfoService.selectByLoginID(userLogin.getLoginId());
                    discuss.setMemberID(xzCompany.getLoginId());
                    discuss.setMemberPicture(xzCompany.getCompanyPicture());
                }

                //存值：评论人和评论内容
                discuss.setDiscussWriter(userLogin.getLoginCount());
                discuss.setDiscussArticle(comment);
                //存入评论表
                discussService.insertDiscussInfo(discuss);
                //查出新存入的评论的id
                Discuss discuss2 = discussService.selectDiscussId(userLogin.getLoginCount());
                discuss2.setBlogId(blogId);
                //存值：博客评论关系表
                discussService.saveBlogDiscuss(discuss2);
                //修改博客表的if_exist
                //discussService.updateIfExist(blogId);
                redirectAttributes.addAttribute("msg", "添加成功");
                redirectAttributes.addAttribute("blogId", blogId);
                return mav;
            } catch (Exception ex) {
                ex.printStackTrace();
                mav = new ModelAndView("redirect:selectDiscussAndReply.do");
                redirectAttributes.addAttribute("msg", "添加失败");
                redirectAttributes.addAttribute("blogId", blogId);
                System.out.println();
                return mav;
            }
        } else if ("".equals(comment) || null == comment) {
            mav = new ModelAndView("redirect:selectDiscussAndReply.do");
            redirectAttributes.addAttribute("blogId", blogId);
            System.out.println();
            return mav;
        } else {
            mav = new ModelAndView("redirect:/XzLogin/goLogin.do");
            return mav;
        }
    }

    /**
     * 添加回复(前台)
     *
     * @param blogId
     * @param replyComment
     * @param discussId
     * @return
     */
    @RequestMapping("interceptSaveReply.do")
    public ModelAndView saveReply(Long blogId, String replyComment, Long discussId,
                                  @ModelAttribute("userLogin") XzLogin userLogin, RedirectAttributes redirectAttributes) {
        ModelAndView mav;
        if (null != userLogin && 0 != userLogin.getLoginId() && !"".equals(replyComment) && null != replyComment) {
            try {
                Discuss discuss = new Discuss();
                mav = new ModelAndView("redirect:selectDiscussAndReply.do");
                //存值：回复人、回复内容和上级评论编号
                discuss.setDiscussWriter(userLogin.getLoginCount());
                discuss.setDiscussArticle(replyComment);
                discuss.setDiscussId(discussId);
                //存入评论表
                discussService.saveReply(discuss);
                //修改exist(加1)
                discussService.saveExist(discussId);
                redirectAttributes.addAttribute("msg", "添加成功");
                redirectAttributes.addAttribute("blogId", blogId);
                return mav;
            } catch (Exception ex) {
                ex.printStackTrace();
                mav = new ModelAndView("redirect:selectDiscussAndReply.do");
                redirectAttributes.addAttribute("msg", "添加失败");
                redirectAttributes.addAttribute("blogId", blogId);
                return mav;
            }
        } else if ("".equals(replyComment) || null == replyComment) {
            mav = new ModelAndView("redirect:selectDiscussAndReply.do");
            redirectAttributes.addAttribute("blogId", blogId);
            return mav;
        } else {
            mav = new ModelAndView("redirect:/XzLogin/goLogin.do");
            return mav;
        }
    }

    /**
     * 添加回复(后台)
     *
     * @param discuss
     * @return
     */
    @RequestMapping("saveReply.emp")
    public ModelAndView saveReplyEnd(@Validated(Discuss.F1.class) Discuss discuss, BindingResult bindingResult) {
        ModelAndView mav = new ModelAndView("backEnd/replyEdit");
        if (bindingResult.hasErrors()) {

        } else {
            try {
                //将discuss存入评论表中
                discussService.insertReplyEnd(discuss);
                //修改exist(加1)
                discussService.saveExist(discuss.getBlogId());
                mav.addObject("msg", "添加成功");
            } catch (Exception ex) {
                ex.printStackTrace();
                mav.addObject("msg", "添加失败");
            }
        }
        return mav;
    }

    /**
     * 删除评论(后台)
     *
     * @param discussId
     * @return
     */
    @RequestMapping("deleteDiscuss.emp")
    public ModelAndView deleteDiscussEnd(Long blogId, Long discussId, RedirectAttributes attr) {
        ModelAndView mav = new ModelAndView("redirect:selectDiscussAndReply.emp");
        try {
            //评论表删除内容
            discussService.deleteDiscuss(discussId);
            //博客评论表删除记录
            if (0 != blogId && 0 != discussId) {
                discussService.deleteBlogDiscuss(blogId, discussId);
            }
            //查询某条博客是否还有评论
            PageBean<Discuss> pageBean = discussService.selectIfExist(1, 10, blogId);
            List<Discuss> ifExist = pageBean.getList();
            //(如果该条博客已经没有评论)博客表修改ifExist
            if (0 == ifExist.size()) {
                blogService.deleteByPrimaryKey(blogId);
            }
            attr.addAttribute("msg", "删除成功");
        } catch (Exception ex) {
            ex.printStackTrace();
            attr.addAttribute("msg", "删除失败");
        }
        return mav;
    }

    /**
     * 删除回复(前台)
     *
     * @param discussId
     * @return
     */
    @RequestMapping("interceptDeleteReply.do")
    public ModelAndView deleteReply(Long discussId, RedirectAttributes attr) {
        ModelAndView mav = new ModelAndView("forward:selectDiscussAndReply.do");
        try {
            Discuss discuss = discussService.selectReplyId(discussId);//查询该回复的评论编号(reply_id)
            if (null != discuss) {
                Long replyId = discuss.getBlogId();
                discussService.deleteDiscuss(discussId);//删除回复内容
                PageBean<Discuss> pageBean = discussService.selectReply(1, 10, replyId);
                List<Discuss> replyList = pageBean.getList();
                if (0 == replyList.size()) {//该评论是否还有回复
                    discussService.updateExist(replyId);//没有回复则修改字段
                }
                attr.addAttribute("msg", "删除成功");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            attr.addAttribute("msg", "删除失败");
        }
        return mav;
    }

    /**
     * 删除回复(后台)
     *
     * @param discussId
     * @return
     */
    @RequestMapping("deleteReply.emp")
    public ModelAndView deleteReplyEnd(Long discussId, RedirectAttributes attr) {
        ModelAndView mav = new ModelAndView("redirect:selectDiscussAndReply.emp");
        try {
            Long replyId = discussService.selectReplyId(discussId).getBlogId();//查询该回复的上级评论编号
            discussService.deleteDiscuss(discussId);//删除该回复
            PageBean<Discuss> pageBean = discussService.selectReply(1, 10, replyId);
            List<Discuss> replyList = pageBean.getList();
            if (0 == replyList.size()) {
                discussService.updateExist(replyId);
            }
            attr.addAttribute("msg", "删除成功");
        } catch (Exception ex) {
            ex.printStackTrace();
            attr.addAttribute("msg", "删除失败");
        }
        return mav;
    }

    /**
     * 删除评论(前台)
     *
     * @param discussId
     * @param blogId
     * @return
     */
    @RequestMapping("interceptDeleteDiscuss.do")
    public ModelAndView deleteDiscuss(Long discussId, Long blogId, RedirectAttributes attr) {
        ModelAndView mav = new ModelAndView("forward:selectDiscussAndReply.do");
        try {
            discussService.deleteDiscuss(discussId);//删除评论表记录
            //博客评论表删除记录
            if (0 != blogId) {
                discussService.deleteBlogDiscuss(blogId, discussId);
            }
            //查询某条博客是否有评论
            PageBean<Discuss> pageBean = discussService.selectIfExist(1, 10, blogId);
            List<Discuss> ifExist = pageBean.getList();
            //(如果该条博客已经没有评论)博客表修改ifExist
            if (0 == ifExist.size()) {
                blogService.deleteByPrimaryKey(blogId);
            }
            attr.addAttribute("msg", "删除成功");
            mav.addObject("blogId", blogId);
        } catch (Exception ex) {
            ex.printStackTrace();
            attr.addAttribute("msg", "删除失败");
            mav.addObject("blogId", blogId);
        }
        return mav;
    }

    /**
     * 修改评论(后台)
     *
     * @param discuss
     * @return
     */
    @RequestMapping("updateDiscuss.emp")
    public ModelAndView updateDiscuss(@Validated(Discuss.F1.class) Discuss discuss, BindingResult bindingResult) {
        ModelAndView mav = new ModelAndView("backEnd/discussEdit");
        if (bindingResult.hasErrors()) {

        } else {
            Long blogId = discuss.getBlogId();
            discuss.setBlogId(null);
            try {
                discussService.updateDiscuss(discuss);
                if (null != blogId && 0 != blogId) {
                    Discuss d2 = new Discuss();
                    d2.setBlogId(blogId);
                    d2.setDiscussId(discuss.getDiscussId());
                    discussService.updateBlogId(d2);
                }
                mav.addObject("msg", "修改成功");
            } catch (Exception ex) {
                ex.printStackTrace();
                mav.addObject("msg", "修改失败");
            }
        }

        return mav;
    }

    /**
     * 查看评论(后台，所有博客)
     *
     * @param discuss
     * @return
     */
    @RequestMapping("selectDiscussAndReply.emp")
    public ModelAndView selectDiscussAndReplyAll(@RequestParam(defaultValue = "1") Integer page,
                                                 @RequestParam(defaultValue = "10") Integer rows, Discuss discuss) {
        ModelAndView mav = new ModelAndView("backEnd/discussShow");
        PageBean<Discuss> pageBean = discussService.selectDiscussAndReplyAll(page, rows, discuss.getDiscussId());
        List<Discuss> discussList = pageBean.getList();
        mav.addObject("discussList", discussList);
        mav.addObject("page", pageBean.getPageNum());//当前页数
        mav.addObject("pages", pageBean.getPages());//总页数
        mav.addObject("rows", pageBean.getPageSize());//每页条数
        mav.addObject("total", pageBean.getTotal());//总条数
        mav.addObject("discuss", discuss);
        return mav;
    }

    /**
     * 查看单条评论(后台)
     *
     * @param replyId
     * @return
     */
    @ResponseBody
    @RequestMapping("replyEdit.emp")
    public ModelAndView selectByReplyEdit(Long replyId, Long addDiscussId) {
        ModelAndView mav = new ModelAndView("backEnd/replyEdit");
        Discuss discuss = new Discuss();
        //修改
        if (null != replyId && 0 != replyId && 0 == addDiscussId) {
            discuss = discussService.selectByPrimaryKey(replyId);
            discuss.setBlogId(null);
//            //查询上级评论Id
//            Long discussId = discussService.selectReplyId(replyId).getBlogId();
//            discuss.setBlogId(discussId);
        } else {//添加
            discuss.setBlogId(addDiscussId);
        }
        mav.addObject("discuss", discuss);
        return mav;
    }

    /**
     * 带replyId的单条评论查询(后台)
     *
     * @param discussId
     * @return
     */
    @RequestMapping("discussEdit.emp")
    public ModelAndView selectReplyId(Long discussId, Long blogId) {
        ModelAndView mav = new ModelAndView("backEnd/discussEdit");
        Discuss discuss = new Discuss();
        if (null != discussId && 0 != discussId) {
            discuss = discussService.selectReplyId(discussId);
            discuss.setBlogId(null);
        } else {
            discuss.setBlogId(blogId);
        }
        mav.addObject("discuss", discuss);
        return mav;
    }

    /**
     * 查看评论和回复(前台，单条博客)
     *
     * @param blogId
     * @return
     */
    @RequestMapping("selectDiscussAndReply.do")
    public ModelAndView selectDiscussAndReply(@RequestParam(defaultValue = "1") Integer page,
                                              @RequestParam(defaultValue = "5") Integer rows, Long blogId,
                                              @RequestParam(defaultValue = "1") Integer page2,
                                              @RequestParam(defaultValue = "3") Integer rows2) {
        ModelAndView mav = new ModelAndView("foreEnd/blogDiscuss");
        Blog blog = new Blog();
        if (null != blogId && 0 != blogId) {
            blog = blogService.selectByPrimaryKey(blogId);
        }
        PageBean<Discuss> pageBean = discussService.selectDiscussAndReply(page, rows, blogId);
        List<Discuss> discussList = pageBean.getList();
        //查询最近博客
        PageBean<Blog> pageBean2 = blogService.selectRecentBlog(page2, rows2);
        List<Blog> recentList = pageBean2.getList();
        mav.addObject("recentList", recentList);

        mav.addObject("blog", blog);
        mav.addObject("discussList", discussList);
        mav.addObject("page", pageBean.getPageNum());//当前页数
        mav.addObject("pages", pageBean.getPages());//总页数
        mav.addObject("rows", pageBean.getPageSize());//每页条数
        mav.addObject("total", pageBean.getTotal());//总条数
        return mav;
    }

    /**
     * 根据评论编号查回复内容(后台)
     *
     * @param replyId
     * @return
     */
    @RequestMapping("selectReply.emp")
    public ModelAndView selectReply(@RequestParam(defaultValue = "1") Integer page,
                                    @RequestParam(defaultValue = "10") Integer rows, Long replyId) {
        ModelAndView mav = new ModelAndView("backEnd/replyShow");
        if (null != replyId && 0 != replyId) {
            PageBean<Discuss> pageBean = discussService.selectReply(page, rows, replyId);
            List<Discuss> replyList = pageBean.getList();
            mav.addObject("replyList", replyList);
            mav.addObject("replyId", replyId);
            mav.addObject("page", pageBean.getPageNum());//当前页数
            mav.addObject("pages", pageBean.getPages());//总页数
            mav.addObject("rows", pageBean.getPageSize());//每页条数
            mav.addObject("total", pageBean.getTotal());//总条数
        }
        return mav;
    }

    /**
     * 修改回复(后台)
     *
     * @param discuss
     * @return
     */
    @RequestMapping("updateReply.emp")
    public ModelAndView updateReplyEnd(@Validated(Discuss.F1.class) Discuss discuss, BindingResult bindingResult) {
        ModelAndView mav = new ModelAndView("backEnd/replyEdit");
        if (bindingResult.hasErrors()) {

        } else {
            try {
                discussService.updateReply(discuss);
                mav.addObject("msg", "修改成功");
            } catch (Exception ex) {
                ex.printStackTrace();
                mav.addObject("msg", "修改失败");
            }
        }
        return mav;
    }

    /**
     * (后台，带exist，带blogId)根据条件查询评论表中数据
     *
     * @param discuss
     * @return
     */
    @ResponseBody
    @RequestMapping("selectDiscussSelective.emp")
    public ModelAndView selectDiscussSelective(@RequestParam(defaultValue = "1") Integer page,
                                               @RequestParam(defaultValue = "10") Integer rows,
                                               Date startTime, Date endTime, Discuss discuss) {
        ModelAndView mav = new ModelAndView("backEnd/discussShow");
        PageBean<Discuss> pageBean = discussService.selectDiscussSelective(page, rows, discuss, startTime, endTime);
        List<Discuss> discussList = pageBean.getList();
        mav.addObject("discussList", discussList);
        mav.addObject("discuss", discuss);
        mav.addObject("page", pageBean.getPageNum());//当前页数
        mav.addObject("pages", pageBean.getPages());//总页数
        mav.addObject("rows", pageBean.getPageSize());//每页条数
        mav.addObject("total", pageBean.getTotal());//总条数
        mav.addObject("startTime", startTime);
        mav.addObject("endTime", endTime);
        return mav;
    }

    /**
     * (带replyId，后台)根据条件查询回复评论数据
     *
     * @param discuss
     * @return
     */
    @ResponseBody
    @RequestMapping("selectReplySelective.emp")
    public ModelAndView selectReplySelective(@RequestParam(defaultValue = "1") Integer page,
                                             @RequestParam(defaultValue = "10") Integer rows,
                                             Date startTime, Date endTime, Discuss discuss) {
        ModelAndView mav = new ModelAndView("backEnd/replyShow");
        PageBean<Discuss> pageBean = discussService.selectReplySelective(page, rows, discuss, startTime, endTime);
        List<Discuss> replyList = pageBean.getList();
        mav.addObject("replyList", replyList);
        mav.addObject("discuss", discuss);
        mav.addObject("startTime", startTime);
        mav.addObject("endTime", endTime);
        mav.addObject("page", pageBean.getPageNum());//当前页数
        mav.addObject("pages", pageBean.getPages());//总页数
        mav.addObject("rows", pageBean.getPageSize());//每页条数
        mav.addObject("total", pageBean.getTotal());//总条数
        return mav;
    }

    /**
     * (后台)根据blogId单条查询相关评论内容
     */
    @RequestMapping("selectOnlyDiscuss.emp")
    public ModelAndView selectOnlyDiscuss(@RequestParam(defaultValue = "1") Integer page,
                                          @RequestParam(defaultValue = "10") Integer rows, Long blogId) {
        ModelAndView mav = new ModelAndView("backEnd/discussShow");
        Blog blog = new Blog();
        if (null != blogId && 0 != blogId) {
            blog = blogService.selectByPrimaryKey(blogId);
        }
        PageBean<Discuss> pageBean = discussService.selectOnlyDiscuss(page, rows, blogId);
        List<Discuss> discussList = pageBean.getList();
        mav.addObject("blog", blog);
        mav.addObject("discussList", discussList);
        mav.addObject("page", pageBean.getPageNum());//当前页数
        mav.addObject("pages", pageBean.getPages());//总页数
        mav.addObject("rows", pageBean.getPageSize());//每页条数
        mav.addObject("total", pageBean.getTotal());//总条数
        return mav;
    }
}
