package com.xzlcPT.controller;

import com.util.ComPareDate;
import com.util.PageBean;
import com.xzlcPT.bean.XzEducation;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzResumeEducation;
import com.xzlcPT.service.EducationService;
import com.xzlcPT.service.XzResumeEducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Controller 层 EducationController
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Controller
@RequestMapping("/Education")
@SessionAttributes("userLogin")
public class EducationController extends BaseController {
    @Autowired
    private XzResumeEducationService resumeEducationService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        //日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @ResponseBody
    @RequestMapping("selEducationByResumeId.do")
    public Map<String,Object> selEducationByResumeId(Long resumeId){
        Map<String,Object> map = new HashMap<>();
        List<XzResumeEducation> list = resumeEducationService.selectByResumeId(resumeId);
        map.put("educationList",list);
        return map;
    }

    @ResponseBody
    @RequestMapping("selEducationById.do")
    public Map<String,Object> selEducationById(Long educationId){
        Map<String,Object> map = new HashMap<>();
        XzResumeEducation education = resumeEducationService.selectById(educationId);
        map.put("education",education);
        return map;
    }

    @ResponseBody
    @RequestMapping("addEducation.do")
    public Map<String,Object> addEducation(XzResumeEducation education){
        Map<String,Object> map = new HashMap<>();
        int i = resumeEducationService.insertEducation(education);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("updateEducation.do")
    public Map<String,Object> updateEducation(XzResumeEducation education){
        Map<String,Object> map = new HashMap<>();
        int i = resumeEducationService.updateEducation(education);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("deleteEducation.do")
    public Map<String,Object> deleteEducation(Long educationId){
        Map<String,Object> map = new HashMap<>();
        int i = resumeEducationService.deleteEducation(educationId);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }

    /*
    //按memberId查询
    @ResponseBody
    @RequestMapping("selEducationByMemberId")
    public Map<String,Object> selEducationByMemberId(Long memberId){
        Map<String,Object> map = new HashMap<>();
        List<XzEducation> list = educationService.selectMemberId(memberId);
        map.put("educationList",list);
        return map;
    }

    @ResponseBody
    @RequestMapping("addEducation.do")
    public Map<String,Object> addEducation(XzEducation education){
        Map<String,Object> map = new HashMap();


        return map;
    }


    //    跳转到添加学历信息页面
    @RequestMapping("goAddEducation.do")
    public ModelAndView goAddEducation(@ModelAttribute("userLogin") XzLogin userLogin) {
        ModelAndView mv = new ModelAndView("foreEnd/addEducation");
        XzEducation newEd = new XzEducation();
        newEd.setLoginID(userLogin.getLoginId());
        mv.addObject("xzEducation", newEd);
        return mv;
    }

    *//**
     * 添加学历信息方法
     *
     * @param xzEducation
     * @param result
     * @return
     *//*
    @RequestMapping("AddEducation.do")
    public ModelAndView addEducation(@Validated({XzEducation.F1.class}) XzEducation xzEducation, BindingResult result) {
        ModelAndView mv = new ModelAndView("foreEnd/addEducation");
        System.out.println("AddEducation" + xzEducation);
        boolean b1;
        if (xzEducation.getEnrollmentDate() == null || xzEducation.getGraduateDate() == null) {
            b1 = true;
        } else {
            b1 = ComPareDate.comPareDate(xzEducation.getEnrollmentDate(), xzEducation.getGraduateDate());
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {
////            输出错误信息
//            List<FieldError> ff = result.getFieldErrors();
//            for (FieldError fieldError : ff) {
//                System.out.println(fieldError.getField() + ":" + fieldError.getDefaultMessage());
//            }
//            System.out.println(xzEducation);
//            mv.setViewName("backEnd/addEducation");
//            mv.addObject("newEducation",newEducation);
        } else {
            mv.setViewName("redirect:/UserInfo/goUserInfo.do");
            int a = 0;
            a = educationService.addUserInfo(xzEducation);
            if (a == 1) {
                System.out.println("添加学历成功!");
            } else {
                System.out.println("添加学历失败!");
            }
        }


        return mv;
    }

    *//**
     * 跳转到修改学历信息页面
     *
     * @param educationID
     * @return
     *//*
    @RequestMapping("goUpdateEducation.do")
    public ModelAndView goUpdateEducation(Long educationID) {
        ModelAndView mv = new ModelAndView("foreEnd/addEducation");
        XzEducation xzEducation1 = new XzEducation();
        if (educationID != 0) {
            xzEducation1 = educationService.selectEducationByEID(educationID);
        }
        mv.addObject("xzEducation", xzEducation1);
        return mv;
    }

    *//**
     * 修改学历信息
     *
     * @param xzEducation
     * @param result
     * @return
     *//*
    @RequestMapping("updateEducation.do")
    public ModelAndView updateEducation(@Validated({XzEducation.F1.class}) XzEducation xzEducation, BindingResult result) {
        ModelAndView mv = new ModelAndView("foreEnd/addEducation");
        System.out.println(xzEducation.getGraduateDate());
        boolean b1;
        if (xzEducation.getEnrollmentDate() == null || xzEducation.getGraduateDate() == null) {
            b1 = true;
        } else {
            b1 = ComPareDate.comPareDate(xzEducation.getEnrollmentDate(), xzEducation.getGraduateDate());
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {
            System.out.println("updateEducation:" + xzEducation.getEducationID());
        } else {
            mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
            int a = educationService.updateEducation(xzEducation);
            if (a != 0) {
                System.out.println("修改成功!");
            } else {
                System.out.println("修改失败!");
            }
        }
        return mv;
    }

    *//**
     * 删除学历信息
     *
     * @param edID
     * @return
     *//*
    @RequestMapping("deleteEducation.do")
    public ModelAndView deleteEducation(long edID) {
        ModelAndView mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
        XzEducation xzEducation = educationService.selectEducationByEID(edID);
        xzEducation.setDeleteFalt(1);
        xzEducation.setDeleteEducationDate(new Date());
        int a = educationService.updateEducation(xzEducation);
        if (a != 0) {
            System.out.println("删除成功!");
        } else {
            System.out.println("删除失败!");
        }
        return mv;
    }

    //    后台
//    跳转到学历信息页面
    @RequestMapping("goEducationEnd1.emp")

    public ModelAndView goEducationEnd(@RequestParam(defaultValue = "1") Integer page,
                                       @RequestParam(defaultValue = "5") Integer rows, XzEducation xzEducation, long loginID) {
        ModelAndView mv = new ModelAndView("backEnd/educationEnd");
        System.out.println(loginID);
        if (loginID != 0) {
            xzEducation.setLoginID(loginID);
        }
        PageBean<XzEducation> pageBean = educationService.selAllEducationEnd(page, rows, xzEducation);
        List<XzEducation> edList = pageBean.getList();
        mv.addObject("edList", edList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzEducation);
        return mv;
    }

    @RequestMapping("goEducationEnd.emp")
    public ModelAndView goEducationEnd(@RequestParam(defaultValue = "1") Integer page,
                                       @RequestParam(defaultValue = "5") Integer rows, XzEducation xzEducation) {
        ModelAndView mv = new ModelAndView("backEnd/educationEnd");
        PageBean<XzEducation> pageBean = educationService.selAllEducationEnd(page, rows, xzEducation);
        List<XzEducation> edList = pageBean.getList();
        mv.addObject("edList", edList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzEducation);
        return mv;
    }

    *//**
     * 跳转到添加工作经验方法
     *
     * @param loginID
     * @return
     *//*
    @RequestMapping("goAddEducationEnd.emp")
    public ModelAndView goAddEducationEnd(long loginID) {
        System.out.println("goAddEducationEnd.emp" + loginID);
        ModelAndView mv = new ModelAndView("backEnd/updateEducationEnd");
        XzEducation xzEducation = new XzEducation();
        xzEducation.setLoginID(loginID);
        mv.addObject("xzEducation", xzEducation);
        return mv;
    }

    @RequestMapping("addEducationEnd.emp")
    public ModelAndView addEducationEnd(@Validated({XzEducation.F1.class}) XzEducation xzEducation, BindingResult result,
                                        @RequestParam(defaultValue = "1") Integer page,
                                        @RequestParam(defaultValue = "5") Integer rows) {
        System.out.println("addEducationEnd.emp" + xzEducation);
        ModelAndView mv = new ModelAndView("backEnd/updateEducationEnd");
        int a = 0;
        boolean b1 = true;
        if (xzEducation.getEnrollmentDate() != null && xzEducation.getGraduateDate() != null) {
            b1 = ComPareDate.comPareDate(xzEducation.getEnrollmentDate(), xzEducation.getGraduateDate());
        }
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {

        } else {
            a = educationService.addEducationEnd(xzEducation);
            if (a != 0) {
                mv.setViewName("backEnd/educationEnd");
                System.out.println("添加成功");
                XzEducation xzEducationS = new XzEducation();
                xzEducationS.setLoginID(xzEducation.getLoginID());
                mv = goEducationEnd(page, rows, xzEducationS);
                mv.addObject("xzEducation", xzEducationS);
            } else {
                System.out.println("添加失败");
                mv.setViewName("backEnd/updateEducationEnd");
            }
        }
        return mv;
    }

    //    跳转到修改学历信息页面
    @RequestMapping("goUpdateEducationEnd.emp")
    public ModelAndView goUpdateEducationEnd(long eid) {
        ModelAndView mv = new ModelAndView("backEnd/updateEducationEnd");
        XzEducation xzEducation = new XzEducation();
        xzEducation = educationService.selByLoginIDEnd(eid);
        System.out.println(xzEducation);
        mv.addObject("xzEducation", xzEducation);
        return mv;
    }

    //    修改学历信息方法
    @RequestMapping("updateEducationEnd.emp")
    public ModelAndView updateEducationEnd(@Validated({XzEducation.F1.class}) XzEducation xzEducation, BindingResult result,
                                           @RequestParam(defaultValue = "1") Integer page,
                                           @RequestParam(defaultValue = "5") Integer rows) {
        ModelAndView mv = new ModelAndView("backEnd/updateEducationEnd");
        boolean b1 = ComPareDate.comPareDate(xzEducation.getEnrollmentDate(), xzEducation.getGraduateDate());
        if (b1) {
            mv.addObject("compareDateSpan", "日期有误");
        }
        if (result.hasErrors() || b1) {

        } else {
            XzEducation xzEducation1 = new XzEducation();
            xzEducation1 = educationService.selByLoginIDEnd(xzEducation.getEducationID());
            if (xzEducation.getDeleteFalt() == 1 && xzEducation.getDeleteFalt() != xzEducation1.getDeleteFalt()) {
                xzEducation.setDeleteEducationDate(new Date());
            }
            mv.setViewName("redirect:goEducationEnd.emp");
            int a = educationService.updateEducationEnd(xzEducation);
            if (a != 0) {

                XzEducation xzEducationS = new XzEducation();
                xzEducationS.setLoginID(xzEducation.getLoginID());
                mv = goEducationEnd(page, rows, xzEducationS);
                mv.addObject("xzEducation", xzEducationS);
                System.out.println("修改成功");
            } else {
                System.out.println("修改失败");
            }
        }
        return mv;
    }

    //  删除学历信息方法
    @RequestMapping("deleteEducationEnd.emp")
    public ModelAndView deleteEducationEnd(long eid, @RequestParam(defaultValue = "1") Integer page,
                                           @RequestParam(defaultValue = "5") Integer rows) {
        ModelAndView mv = new ModelAndView("redirect:goEducationEnd.emp");
        XzEducation xzEducation = new XzEducation();
        xzEducation.setEducationID(eid);
        xzEducation.setDeleteFalt(1);
        xzEducation.setDeleteEducationDate(new Date());
        int a = educationService.updateEducationEnd(xzEducation);
        xzEducation = educationService.selectEducationByEID(eid);
        System.out.println(xzEducation);
        if (a != 0) {
            XzEducation xzEducationS = new XzEducation();
            xzEducationS.setLoginID(xzEducation.getLoginID());
            mv = goEducationEnd(page, rows, xzEducationS);
            mv.addObject("xzEducation", xzEducationS);
            System.out.println("删除成功!");
        } else {
            System.out.println("删除失败!");
        }
        return mv;
    }

*/
}
