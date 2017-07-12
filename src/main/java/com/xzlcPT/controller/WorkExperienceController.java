package com.xzlcPT.controller;

import com.util.ComPareDate;
import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzWorkExperience;
import com.xzlcPT.service.WorkExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Controller 层 WorkExperienceController
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Controller
@RequestMapping("/WorkE")
public class WorkExperienceController extends BaseController {
    @Autowired
    private WorkExperienceService workExperienceService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        //日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    //    跳转到添加学历信息页面
    @RequestMapping("goAddWorkE.do")
    public ModelAndView goAddWorkE(HttpSession httpSession) {
        ModelAndView mv = new ModelAndView("foreEnd/addWorkExperience");
        XzLogin newXz = (XzLogin) httpSession.getAttribute("userLogin");
        XzWorkExperience xzWorkExperience = new XzWorkExperience();
        xzWorkExperience.setLoginID(newXz.getLoginId());
        mv.addObject("xzWorkExperience", xzWorkExperience);
        return mv;
    }

    @RequestMapping("addWorkE.do")
    public ModelAndView addWorkE(@Validated({XzWorkExperience.F1.class}) XzWorkExperience xzWorkExperience, BindingResult result) {
        ModelAndView mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
        boolean b1 = true;
        if (xzWorkExperience.getEntryDate() != null && xzWorkExperience.getDimissionDate() != null) {
            b1 = ComPareDate.comPareDate(xzWorkExperience.getEntryDate(), xzWorkExperience.getDimissionDate());
        } else {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {
            mv.setViewName("foreEnd/addWorkExperience");
        } else {
            xzWorkExperience.setDeleteFalt(1);
            int a = workExperienceService.addWorkExperience(xzWorkExperience);
            if (a != 0) {
                System.out.println("添加工作经验成功!");
            } else {
                System.out.println("添加工作经验失败!");
            }
        }
        return mv;
    }

    @RequestMapping("goUpdateWorkE.do")
    public ModelAndView goUpdateWorkE(Long workID) {
        ModelAndView mv = new ModelAndView("foreEnd/addWorkExperience");
        XzWorkExperience xzWorkExperience1 = new XzWorkExperience();
        if (workID != 0) {
            xzWorkExperience1 = workExperienceService.selectWorkEByWID(workID);
        }
        mv.addObject("xzWorkExperience", xzWorkExperience1);
        return mv;
    }

    @RequestMapping("updateWorkE.do")
    public ModelAndView updateWorkE(@Validated({XzWorkExperience.F1.class}) XzWorkExperience xzWorkExperience, BindingResult result) {
        ModelAndView mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
        boolean b1 = true;
        if (xzWorkExperience.getEntryDate() != null && xzWorkExperience.getDimissionDate() != null) {
            b1 = ComPareDate.comPareDate(xzWorkExperience.getEntryDate(), xzWorkExperience.getDimissionDate());
        } else {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {
            mv.setViewName("foreEnd/addWorkExperience");
        } else {
            int a = workExperienceService.updateWorkE(xzWorkExperience);
            if (a != 0) {
                System.out.println("修改工作经验成功!");
            } else {
                System.out.println("修改工作经验失败!");
            }
        }
        return mv;
    }

    @RequestMapping("deleteWorkE.do")
    public ModelAndView deleteWorkE(long wID) {
        ModelAndView mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
        XzWorkExperience xzWorkExperience = workExperienceService.selectWorkEByWID(wID);
        xzWorkExperience.setDeleteFalt(1);
        xzWorkExperience.setDeleteWorkDate(new Date());
        int a = workExperienceService.updateWorkE(xzWorkExperience);
        if (a != 0) {
            System.out.println("删除工作经验成功!");
        } else {
            System.out.println("删除工作经验失败!");
        }
        return mv;
    }

    //    后台
//    跳转到工作经验页面
    @RequestMapping("goWorkEEnd1.emp")
    public ModelAndView goWorkEEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                   XzWorkExperience xzWorkExperience, long loginID) {
        ModelAndView mv = new ModelAndView("backEnd/workExperienceEnd");
        if (loginID != 0) {
            xzWorkExperience.setLoginID(loginID);
        }
        PageBean<XzWorkExperience> pageBean = workExperienceService.selAllWorkEEnd(page, rows, xzWorkExperience);
        List<XzWorkExperience> workList = pageBean.getList();
        mv.addObject("wList", workList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzWorkExperience);
        return mv;
    }

    @RequestMapping("goWorkEEnd.emp")
    public ModelAndView goWorkEEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                   XzWorkExperience xzWorkExperience) {
        ModelAndView mv = new ModelAndView("backEnd/workExperienceEnd");
        PageBean<XzWorkExperience> pageBean = workExperienceService.selAllWorkEEnd(page, rows, xzWorkExperience);
        List<XzWorkExperience> workList = pageBean.getList();
        mv.addObject("wList", workList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzWorkExperience);
        return mv;
    }

    /**
     * 跳转到添加工作经验
     *
     * @param loginID
     * @return
     */
    @RequestMapping("goAddWorkEnd.emp")
    public ModelAndView goAddWorkEnd(long loginID) {
        ModelAndView mv = new ModelAndView("backEnd/updateWorkEEnd");
        XzWorkExperience xzWorkExperience = new XzWorkExperience();
        xzWorkExperience.setLoginID(loginID);
        mv.addObject("xzWorkExperience", xzWorkExperience);
        return mv;
    }

    @RequestMapping("addWorkEnd.emp")
    public ModelAndView addWorkEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                   @Validated({XzWorkExperience.F1.class}) XzWorkExperience xzWorkExperience, BindingResult result) {
        ModelAndView mv = new ModelAndView("backEnd/updateWorkEEnd");
        int a = 0;
        boolean b1 = true;
        if (xzWorkExperience.getEntryDate() != null && xzWorkExperience.getDimissionDate() != null) {
            b1 = ComPareDate.comPareDate(xzWorkExperience.getEntryDate(), xzWorkExperience.getDimissionDate());
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {

        } else {
            a = workExperienceService.addWorkEnd(xzWorkExperience);
            if (a != 0) {
                System.out.println("添加成功");
                XzWorkExperience xzWorkExperienceS = new XzWorkExperience();
                xzWorkExperienceS.setLoginID(xzWorkExperience.getLoginID());
                mv = goWorkEEnd(page, rows, xzWorkExperienceS);
                mv.addObject("xzWorkExperience", xzWorkExperienceS);
            } else {
                System.out.println("添加失败");
                mv.setViewName("backEnd/updateWorkEEnd");
                mv.addObject("xzWorkExperience", xzWorkExperience);
            }
        }

        return mv;
    }

    //    跳转到修改工作经验页面
    @RequestMapping("goUpdateWorkEEnd.emp")
    public ModelAndView goUpdateWorkEEnd(long wid) {
        ModelAndView mv = new ModelAndView("backEnd/updateWorkEEnd");
        XzWorkExperience xzWorkExperience = new XzWorkExperience();
        xzWorkExperience = workExperienceService.selByLoginIDEnd(wid);
        mv.addObject("xzWorkExperience", xzWorkExperience);
        return mv;
    }

    //    修改工作经验方法
    @RequestMapping("updateWorkEEnd.emp")
    public ModelAndView updateWorkEEnd(@Validated({XzWorkExperience.F1.class}) XzWorkExperience xzWorkExperience, BindingResult result,
                                       @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows) {
        ModelAndView mv = new ModelAndView("backEnd/updateWorkEEnd");
        boolean b1 = ComPareDate.comPareDate(xzWorkExperience.getEntryDate(), xzWorkExperience.getDimissionDate());
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {

        } else {
            XzWorkExperience xzWorkExperience1 = new XzWorkExperience();
            xzWorkExperience1 = workExperienceService.selByLoginIDEnd(xzWorkExperience.getWorkExperienceID());
            if (xzWorkExperience.getDeleteFalt() == 1 && xzWorkExperience.getDeleteFalt() != xzWorkExperience1.getDeleteFalt()) {
                xzWorkExperience.setDeleteWorkDate(new Date());
            }
            int a = workExperienceService.updateWorkEEnd(xzWorkExperience);
            if (a != 0) {
                System.out.println("修改成功!");
                XzWorkExperience xzWorkExperienceS = new XzWorkExperience();
                xzWorkExperienceS.setLoginID(xzWorkExperience.getLoginID());
                mv = goWorkEEnd(page, rows, xzWorkExperienceS);
                mv.addObject("xzWorkExperience", xzWorkExperienceS);
            } else {
                System.out.println("修改失败!");
            }
        }
        return mv;
    }

    //  删除工作经验方法
    @RequestMapping("deleteWorkEEnd.emp")
    public ModelAndView deleteWorkEEnd(long wid, Long loginID,@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows) {
        ModelAndView mv = new ModelAndView("redirect:goWorkEEnd.emp");
        XzWorkExperience xzWorkExperience = new XzWorkExperience();
        xzWorkExperience.setWorkExperienceID(wid);
        xzWorkExperience.setDeleteFalt(1);
        xzWorkExperience.setDeleteWorkDate(new Date());
        int a = workExperienceService.updateWorkEEnd(xzWorkExperience);
        xzWorkExperience = workExperienceService.selectWorkEByWID(wid);
        if (a != 0) {
            System.out.println("删除成功!");
            if(loginID!=null &&loginID!=0){
                XzWorkExperience xzWorkExperienceS = new XzWorkExperience();
                xzWorkExperienceS.setLoginID(xzWorkExperience.getLoginID());
                mv = goWorkEEnd(page, rows, xzWorkExperienceS);
                mv.addObject("xzWorkExperience", xzWorkExperienceS);
            }
        } else {
            System.out.println("删除失败!");
        }
        return mv;
    }

}
