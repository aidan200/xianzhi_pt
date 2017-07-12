package com.xzlcPT.controller;

import com.util.ComPareDate;
import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzProjectExperience;
import com.xzlcPT.service.ProjectExperienceService;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Controller 层 ProjectExperienceController
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Controller
@RequestMapping("/ProjectE")
public class ProjectExperienceController extends BaseController {
    @Autowired
    private ProjectExperienceService projectExperienceService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        //日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping("goAddProjectE.do")
    public ModelAndView goAddProjectEnd(HttpSession httpSession) {
        ModelAndView mv = new ModelAndView("foreEnd/addProject");
        XzLogin newXz = (XzLogin) httpSession.getAttribute("userLogin");
        XzProjectExperience xzProjectExperience = new XzProjectExperience();
        xzProjectExperience.setLoginID(newXz.getLoginId());
        mv.addObject("xzProjectExperience", xzProjectExperience);
        return mv;
    }

    @RequestMapping("addProjectE.do")
    public ModelAndView addProjectEnd(@Validated({XzProjectExperience.F1.class}) XzProjectExperience xzProjectExperience, BindingResult result) {
        ModelAndView mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
        boolean b1 = true;
        if (xzProjectExperience.getStartDate() != null && xzProjectExperience.getEndDate() != null) {
            b1 = ComPareDate.comPareDate(xzProjectExperience.getStartDate(), xzProjectExperience.getEndDate());
        } else {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {
            mv.setViewName("foreEnd/addProject");
        } else {
            xzProjectExperience.setDeleteFalt(1);
            int a = projectExperienceService.addProjectExperience(xzProjectExperience);
            if (a != 0) {
                System.out.println("添加项目经验成功!");
            } else {
                System.out.println("添加项目经验失败!");
            }
        }


        return mv;
    }

    @RequestMapping("goUpdateProjectE.do")
    public ModelAndView goUpdateWorkEEnd(Long projectID) {
        ModelAndView mv = new ModelAndView("foreEnd/addProject");
        XzProjectExperience xzProjectExperience1 = new XzProjectExperience();
        if (projectID != 0) {
            xzProjectExperience1 = projectExperienceService.selectProjectByPID(projectID);
        }
        mv.addObject("xzProjectExperience", xzProjectExperience1);
        return mv;
    }

    @RequestMapping("updateProjectE.do")
    public ModelAndView updateProjectEnd(@Validated({XzProjectExperience.F1.class}) XzProjectExperience xzProjectExperience, BindingResult result) {
        ModelAndView mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
        boolean b1 = true;
        if (xzProjectExperience.getStartDate() != null && xzProjectExperience.getEndDate() != null) {
            b1 = ComPareDate.comPareDate(xzProjectExperience.getStartDate(), xzProjectExperience.getEndDate());
        } else {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {
            mv.setViewName("foreEnd/addProject");
        } else {
            xzProjectExperience.setDeleteFalt(0);
            int a = projectExperienceService.updateProject(xzProjectExperience);
            if (a != 0) {
                System.out.println("修改项目经验成功!");
            } else {
                System.out.println("修改项目经验失败!");
            }
        }


        return mv;
    }

    @RequestMapping("deleteProjectE.do")
    public ModelAndView deleteProjectE(long pID) {
        ModelAndView mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
        XzProjectExperience xzProjectExperience = projectExperienceService.selectProjectByPID(pID);
        xzProjectExperience.setDeleteFalt(1);
        xzProjectExperience.setDeleteProjectDate(new Date());
        int a = projectExperienceService.updateProject(xzProjectExperience);

        if (a != 0) {
            System.out.println("删除项目经验成功!");
        } else {
            System.out.println("删除项目经验失败!");
        }
        return mv;
    }

    //    后台
//    跳转到项目经验页面
    @RequestMapping("goProjectEEnd1.emp")
    public ModelAndView goProjectEEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                      XzProjectExperience xzProjectExperience, long loginID) {
        ModelAndView mv = new ModelAndView("backEnd/projectExperienceEnd");
        if (loginID != 0) {
            xzProjectExperience.setLoginID(loginID);
        }
        PageBean<XzProjectExperience> pageBean = projectExperienceService.selAllProjectEEnd(page, rows, xzProjectExperience);
        List<XzProjectExperience> projectList = pageBean.getList();
        mv.addObject("projectList", projectList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzProjectExperience);
        return mv;
    }

    @RequestMapping("goProjectEEnd.emp")
    public ModelAndView goProjectEEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                      XzProjectExperience xzProjectExperience) {
        ModelAndView mv = new ModelAndView("backEnd/projectExperienceEnd");

        PageBean<XzProjectExperience> pageBean = projectExperienceService.selAllProjectEEnd(page, rows, xzProjectExperience);
        List<XzProjectExperience> projectList = pageBean.getList();
        mv.addObject("projectList", projectList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzProjectExperience);
        return mv;
    }

    /**
     * 跳转到添加项目经验
     *
     * @param loginID
     * @return
     */
    @RequestMapping("goAddProjectEnd.emp")
    public ModelAndView goAddProjectEnd(long loginID) {
        ModelAndView mv = new ModelAndView("backEnd/updateProjectEEnd");
        XzProjectExperience xzProjectExperience = new XzProjectExperience();
        xzProjectExperience.setLoginID(loginID);
        mv.addObject("xzProjectExperience", xzProjectExperience);
        return mv;
    }

    @RequestMapping("addProjectEnd.emp")
    public ModelAndView addProjectEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                      @Validated({XzProjectExperience.F1.class}) XzProjectExperience xzProjectExperience, BindingResult result) {
        ModelAndView mv = new ModelAndView("backEnd/updateProjectEEnd");
        boolean b1 = true;
        if (xzProjectExperience.getStartDate() != null && xzProjectExperience.getEndDate() != null) {
            b1 = ComPareDate.comPareDate(xzProjectExperience.getStartDate(), xzProjectExperience.getEndDate());
        } else {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {

        } else {
            int a = 0;
            a = projectExperienceService.addProjectEnd(xzProjectExperience);
            if (a != 0 && !b1) {
                mv.setViewName("backEnd/projectExperienceEnd");
                System.out.println("添加成功");
                XzProjectExperience xzProjectExperienceS = new XzProjectExperience();
                xzProjectExperienceS.setLoginID(xzProjectExperience.getLoginID());
                mv = goProjectEEnd(page, rows, xzProjectExperienceS);
                mv.addObject("xzProjectExperience", xzProjectExperienceS);
            } else {
                System.out.println("添加失败");
                mv.setViewName("backEnd/updateProjectEEnd");
                mv.addObject("xzProjectExperience", xzProjectExperience);
            }
        }

        return mv;
    }

    //    跳转到修改项目经验页面
    @RequestMapping("goUpdateProjectEEnd.emp")
    public ModelAndView goUpdateProjectEEnd(long pid) {
        System.out.println("goUpdateProjectEEnd.emp");
        ModelAndView mv = new ModelAndView("backEnd/updateProjectEEnd");
        XzProjectExperience xzProjectExperience = new XzProjectExperience();
        xzProjectExperience = projectExperienceService.selByLoginIDEnd(pid);
        mv.addObject("xzProjectExperience", xzProjectExperience);
        return mv;
    }

    //    修改项目经验方法
    @RequestMapping("updateProjectEEnd.emp")
    public ModelAndView updateProjectEEnd(@Validated({XzProjectExperience.F1.class}) XzProjectExperience xzProjectExperience, BindingResult result,
                                          @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows) {
        ModelAndView mv = new ModelAndView("backEnd/updateProjectEEnd");
        boolean b1 = true;
        if (xzProjectExperience.getStartDate() != null && xzProjectExperience.getEndDate() != null) {
            b1 = ComPareDate.comPareDate(xzProjectExperience.getStartDate(), xzProjectExperience.getEndDate());
        } else {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {

        } else {
            XzProjectExperience xzProjectExperience1 = projectExperienceService.selByLoginIDEnd(xzProjectExperience.getProjectID());
            if (xzProjectExperience.getDeleteFalt() == 1 && xzProjectExperience.getDeleteFalt() != xzProjectExperience1.getDeleteFalt()) {
                xzProjectExperience.setDeleteProjectDate(new Date());
            }
            int a = projectExperienceService.updateProjectEEnd(xzProjectExperience);
            if (a != 0) {
                XzProjectExperience xzProjectExperienceS = new XzProjectExperience();
                xzProjectExperienceS.setLoginID(xzProjectExperience.getLoginID());
                mv = goProjectEEnd(page, rows, xzProjectExperienceS);
                mv.addObject("xzProjectExperience", xzProjectExperienceS);
                System.out.println("修改成功!");
            } else {
                System.out.println("修改失败!");
            }
        }
        return mv;
    }

    //  删除项目经验方法
    @RequestMapping("deleteProjectEEnd.emp")
    public ModelAndView deleteProjectEEnd(long pid,Long loginID, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows) {
        ModelAndView mv = new ModelAndView("redirect:goProjectEEnd.emp");
        XzProjectExperience xzProjectExperience = new XzProjectExperience();
        xzProjectExperience.setProjectID(pid);
        xzProjectExperience.setDeleteFalt(1);
        xzProjectExperience.setDeleteProjectDate(new Date());
        int a = projectExperienceService.updateProjectEEnd(xzProjectExperience);
        xzProjectExperience = projectExperienceService.selectProjectByPID(pid);
        System.out.println(xzProjectExperience);
        if (a != 0) {
            if(loginID != null){
                XzProjectExperience xzProjectExperienceS = new XzProjectExperience();
                xzProjectExperienceS.setLoginID(xzProjectExperience.getLoginID());
                mv = goProjectEEnd(page, rows, xzProjectExperienceS);
                mv.addObject("xzProjectExperience", xzProjectExperienceS);
            }
            System.out.println("删除成功!");
        } else {
            System.out.println("删除失败!");
        }
        return mv;
    }


}
