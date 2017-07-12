package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 建立招聘信息表Controller
 * (用户 - 企业)
 *
 * @author 王天岳
 * @create 2017-05-02 16:41
 **/
@Controller
@RequestMapping("XzRecruit")
@SessionAttributes("userLogin")
public class RecruitController extends BaseController {
    @Autowired
    private RecruitService recruitService;
    @Autowired
    private CompanyInfoService companyInfoService;
    @Autowired
    private UserInfoService userInfoService;
    /*@Autowired
    private ResumeService resumeService;
    @Autowired
    private SentResumeService sentResumeService;*/
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        //日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * 企业查询 已发布招聘信息 方法
     *
     * @param page
     * @param rows
     * @param xzRecruit
     * @return
     */
    @RequestMapping("selectRecruitC.do")
    public ModelAndView selectRecruitC(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                       XzRecruit xzRecruit, @ModelAttribute("userLogin") XzLogin userLogin) {
        ModelAndView mv = new ModelAndView("foreEnd/companyRecruit");
        XzCompany xzCompany = companyInfoService.selectByLoginID(userLogin.getLoginId());
        xzRecruit.setCompanyID(xzCompany.getCompanyId());
        xzRecruit.setCompanyName(xzCompany.getCompanyName());
        PageBean<XzRecruit> pageBean = recruitService.selectRecruit(page, rows, xzRecruit);
        List<XzRecruit> recruitList = pageBean.getList();
        mv.addObject("recruitList", recruitList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzRecruit);
        return mv;
    }

    /**
     * 用户查询 全部招聘信息方法
     *
     * @param page
     * @param rows
     * @param xzRecruit
     * @return
     */
    @RequestMapping("selectRecruit.do")
    public ModelAndView selectRecruit(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                      XzRecruit xzRecruit) {
        ModelAndView mv = new ModelAndView("foreEnd/recruit");
        PageBean<XzRecruit> pageBean = recruitService.selectRecruit(page, rows, xzRecruit);
        List<XzRecruit> recruitList = pageBean.getList();
        mv.addObject("recruitList", recruitList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzRecruit);
        return mv;
    }


    /**
     * 跳转到添加方法
     *
     * @param loginID
     * @return
     */
    @RequestMapping("goInsertRecruit.do")
    public ModelAndView goInsertRecruit(long loginID) {
        ModelAndView mv = new ModelAndView("foreEnd/insertRecruit");
        XzRecruit xzRecruit = new XzRecruit();
        XzCompany xzCompany = new XzCompany();
        if (loginID != 0) {
            xzCompany = companyInfoService.selByLoginIDEnd(loginID);
            System.out.println("goInsertRecruit.do1:" + xzCompany);
        }
        if (xzCompany != null) {
            xzRecruit.setCompanyID(xzCompany.getCompanyId());
            xzRecruit.setCompanyName(xzCompany.getCompanyName());
        }
        mv.addObject("xzRecruit", xzRecruit);
        return mv;
    }

    /**
     * 发布招聘信息
     *
     * @param xzRecruit
     * @param bindingResult
     * @return
     */
    @RequestMapping("insertRecruit.do")
    public ModelAndView insertRecruit(@Validated(XzRecruit.F1.class) XzRecruit xzRecruit, BindingResult bindingResult) {
        ModelAndView mv = new ModelAndView("redirect:selectRecruitC.do");
        /**
         * 非空判定
         */
        if (bindingResult.hasErrors()) {
            mv.setViewName("foreEnd/insertRecruit");
        } else {

            xzRecruit.setReleaseDate(new Date());
            System.out.println("insertRecruit.do" + xzRecruit);

            int a = recruitService.insertRecruit(xzRecruit);
            if (a != 0) {
                System.out.println("添加招聘信息成功");
            } else {
                System.out.println("添加招聘信息失败");
            }
        }
        return mv;
    }

    /**
     * 跳转到修改招聘信息方法
     *
     * @param recruitID
     * @return
     */
    @RequestMapping("goUpdateRecruit.do")
    public ModelAndView goUpdateRecruit(Long recruitID) {
        ModelAndView mv = new ModelAndView("foreEnd/insertRecruit");
        XzRecruit xzRecruit = new XzRecruit();
        if (recruitID != 0) {
            xzRecruit = recruitService.selectRecruitByID(recruitID);
        }
        if (xzRecruit != null) {
            mv.addObject("xzRecruit", xzRecruit);
        }
        return mv;
    }

    /**
     * 修改招聘信息方法
     *
     * @param xzRecruit
     * @param bindingResult
     * @return
     */
    @RequestMapping("updateRecruit.do")
    public ModelAndView updateRecruit(@Validated(XzRecruit.F1.class) XzRecruit xzRecruit, BindingResult bindingResult) {
        ModelAndView mv = new ModelAndView("redirect:selectRecruitC.do");
        if (bindingResult.hasErrors()) {
            mv.setViewName("foreEnd/insertRecruit");
        } else {
            xzRecruit.setReleaseDate(new Date());
            System.out.println(xzRecruit);
            int a = recruitService.updateRecruit(xzRecruit);
            if (a != 0) {
                System.out.println("修改招聘信息成功");
            } else {
                System.out.println("修改招聘信息失败");
            }
        }
        return mv;
    }

    /**
     * 删除招聘信息方法
     *
     * @param recruitID
     * @return
     */
    @RequestMapping("deleteRecruit.do")
    public ModelAndView deleteRecruit(Long recruitID) {
        ModelAndView mv = new ModelAndView("redirect:selectRecruitC.do");
        int a = recruitService.deleteRecruit(recruitID);
        if (a != 0) {
            System.out.println("删除招聘信息成功");
        } else {
            System.out.println("删除招聘信息失败");
        }
        return mv;
    }

    /**
     * 跳转到查看招聘信息详情页
     *
     * @param recruitID
     * @return
     */
    /*@RequestMapping("goRecruitDetails.do")
    public ModelAndView goRecruitDetails(long recruitID, @ModelAttribute("userLogin") XzLogin userLogin) {
        ModelAndView mv = new ModelAndView("foreEnd/recruitInfo");
        boolean sendButton = false;//判定投递按钮  能点击false 无法点击true
        XzRecruit xzRecruit = recruitService.selectRecruitByID(recruitID);
        XzCompany xzCompany = companyInfoService.selectByCompanyID(xzRecruit.getCompanyID());
        if (userLogin.getLoginID()!=0){
            XzMember xzMember = userInfoService.selByLoginIDEnd(userLogin.getLoginID());
            Resume resume = resumeService.selectPersonalResume(xzMember.getMemberID());
            System.out.println(resume);
            if(resume!=null){
                XzResumeSend xzResumeSend = new XzResumeSend();
                xzResumeSend.setResumeID(resume.getResumeId());
                xzResumeSend.setRecruitID(recruitID);
                XzResumeSend xzResumeSend1 = sentResumeService.selectUserSend(xzResumeSend);
                System.out.println("goRecruitDetails.do555:"+xzResumeSend1);
                if(xzResumeSend1!=null){
                    long millionSeconds = xzResumeSend1.getSendDate().getTime();//毫秒
                    long s1 = System.currentTimeMillis() - millionSeconds;
                    if (s1 >= (long)86400000*30){
                        sendButton = true;
                    }else{
                        sendButton = false;
                    }
                }else{
                    sendButton = true;
                }
            }else{
                sendButton = true;
            }

        }else {
            sendButton = true;
        }
        System.out.println(sendButton);
        mv.addObject("sendButton",sendButton);
        mv.addObject("xzCompany", xzCompany);
        mv.addObject("xzRecruit", xzRecruit);
        return mv;
    }*/

    /**
     * 后台方法
     */
    /**
     * 根据条件查询招聘信息
     *
     * @param page
     * @param rows
     * @param xzRecruit
     * @return
     */
    @RequestMapping("selectRecruit.emp")
    public ModelAndView selectRecruitEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                         XzRecruit xzRecruit) {
        ModelAndView mv = new ModelAndView("backEnd/recruitEnd");
        PageBean<XzRecruit> pageBean = recruitService.selectRecruit(page, rows, xzRecruit);
        List<XzRecruit> recruitList = pageBean.getList();
        mv.addObject("recruitList", recruitList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzRecruit);
        return mv;
    }

    /**
     * 跳转到修改页面
     *
     * @param recruitID
     * @return
     */
    @RequestMapping("goUpdateRecruit.emp")
    public ModelAndView goUpdateRecruitEnd(Long recruitID) {
        ModelAndView mv = new ModelAndView("backEnd/updateRecruitEnd");
        XzRecruit xzRecruit = new XzRecruit();
        if (recruitID != 0) {
            xzRecruit = recruitService.selectRecruitByIDEnd(recruitID);
        }
        mv.addObject("xzRecruit", xzRecruit);
        return mv;
    }

    /**
     * 修改招聘信息方法
     *
     * @param xzRecruit
     * @return
     */
    @RequestMapping("updateRecruit.emp")
    public ModelAndView updateRecruitEnd(@Validated(XzRecruit.F1.class) XzRecruit xzRecruit, BindingResult bindingResult) {
        ModelAndView mv = new ModelAndView("backEnd/updateRecruitEnd");
        System.out.println(xzRecruit);
        if (bindingResult.hasErrors()) {

        } else {
            mv.setViewName("redirect:selectRecruit.emp");
            int a = 0;
            if (xzRecruit.getRecruitID() != 0) {
                xzRecruit.setReleaseDate(new Date());
                a = recruitService.updateRecruitEnd(xzRecruit);
            }
            if (a != 0) {
                System.out.println("修改成功");
            } else {
                System.out.println("修改失败");
            }
        }
        return mv;
    }

    /**
     * 删除方法
     *
     * @param recruitID
     * @return
     */
    @RequestMapping("deleteRecruit.emp")
    public ModelAndView deleteRecruitEnd(Long recruitID) {
        ModelAndView mv = new ModelAndView("redirect:selectRecruit.emp");
        XzRecruit xzRecruit = new XzRecruit();
        if (recruitID != 0) {
            xzRecruit = recruitService.selectRecruitByIDEnd(recruitID);
            System.out.println("deleteRecruit.emp:" + xzRecruit);
        }
        int a = 0;
        if (xzRecruit != null) {
            xzRecruit.setDeleteFalt(1);
            xzRecruit.setDeleteRecruitDate(new Date());
            a = recruitService.updateRecruitEnd(xzRecruit);
        }
        if (a != 0) {
            System.out.println("删除成功");
        } else {
            System.out.println("删除失败");
        }
        return mv;
    }
}
