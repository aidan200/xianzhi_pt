package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzSKill;
import com.xzlcPT.service.SkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 建立 技能表 controller
 *
 * @author 王天岳
 * @create 2017-05-15 13:02
 **/
@Controller
@RequestMapping("skill")
@SessionAttributes("userLogin")
public class SkillController extends BaseController {
    @Autowired
    private SkillService skillService;

    /**
     * 跳转到添加技能信息页面
     *
     * @param xzLogin
     * @return
     */
    @RequestMapping("goInsertSkill.do")
    public ModelAndView goInsertSkill(@ModelAttribute("userLogin") XzLogin xzLogin) {
        ModelAndView mv = new ModelAndView("foreEnd/updateSkill");
        XzSKill xzSkill = new XzSKill();
        xzSkill.setLoginID(xzLogin.getLoginId());
        mv.addObject("xzSKill", xzSkill);
        return mv;
    }

    /**
     * 添加技能信息
     *
     * @param xzSKill
     * @return
     */
    @RequestMapping("insertSkill.do")
    public ModelAndView insertSkill(@ModelAttribute("userLogin") XzLogin xzLogin,XzSKill xzSKill) {
        ModelAndView mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
        if (xzSKill.getSkillName()==null ||"".equals(xzSKill.getSkillName())){

        }else{
            xzSKill.setLoginID(xzLogin.getLoginId());
            int a = skillService.insertSkill(xzSKill);
            if (a != 0) {
                System.out.println("skill添加成功");
            } else {
                System.out.println("skill添加失败");
            }
        }
        return mv;
    }

    /**
     * 跳转到修改技能信息页面
     *
     * @param skillID
     * @return
     */
    @RequestMapping("goUpdateSkill.do")
    public ModelAndView goUpdateSkill(Long skillID) {
        ModelAndView mv = new ModelAndView("foreEnd/updateSkill");
        XzSKill xzSKill1 = new XzSKill();
        xzSKill1.setSkillID(skillID);
        XzSKill xzSkill = skillService.selectSkillByID(xzSKill1);
        mv.addObject("xzSKill", xzSkill);
        return mv;
    }

    /**
     * ajax修改技能信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("updateSkill.do")
    public Map<String, Object> updateSkill(@RequestParam(value = "setSkill[]") Integer[] setSkill) {
        XzSKill xzSKill = new XzSKill();
        xzSKill.setSkillID(setSkill[0]);
        xzSKill.setSkillValue(setSkill[1]);
        System.out.println(xzSKill);
        int a = skillService.updateSkill(xzSKill);
        Map<String, Object> map = new HashMap<>();
        if (a != 0) {
            map.put("returnSkill", "SUCCESS");
        } else {
            map.put("returnSkill", "FAILED");
        }
        return map;
    }

    /**
     * 删除技能信息方法
     *
     * @param skillID
     * @return
     */
    @RequestMapping("deleteSkill.do")
    public ModelAndView deleteSkill(Long skillID) {
        ModelAndView mv = new ModelAndView("redirect:/UserInfo/goUserInfo.do");
        XzSKill xzSKill1 = new XzSKill();
        xzSKill1.setSkillID(skillID);
        XzSKill xzSKill = skillService.selectSkillByID(xzSKill1);
        xzSKill.setDeleteFalt(1);
        xzSKill.setDeleteSkillDate(new Date());
        int a = skillService.updateSkill(xzSKill);
        if (a != 0) {
            System.out.println("删除成功");
        } else {
            System.out.println("删除失败");
        }
        return mv;
    }

    /**
     * 后台方法
     */
    /**
     * 后台查询个人技能信息
     *
     * @param page
     * @param rows
     * @param xzSKill
     * @return
     */
    @RequestMapping("selectAllSkillA.emp")
    public ModelAndView selectAllSkillAEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                           XzSKill xzSKill, Long loginID) {
        if (xzSKill.getLoginID() == 0) {
            xzSKill.setLoginID(loginID);
        }
        ModelAndView mv = new ModelAndView("backEnd/skillEnd");
        PageBean<XzSKill> pageBean = skillService.selectAllSkillEnd(page, rows, xzSKill);
        List<XzSKill> skillList = pageBean.getList();
        mv.addObject("skillList", skillList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("xzSKill", xzSKill);
        return mv;
    }

    /**
     * 后台查询技能信息
     *
     * @param page
     * @param rows
     * @param xzSKill
     * @return
     */
    @RequestMapping("selectAllSkill.emp")
    public ModelAndView selectAllSkillEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                          XzSKill xzSKill) {
        ModelAndView mv = new ModelAndView("backEnd/skillEnd");
        PageBean<XzSKill> pageBean = skillService.selectAllSkillEnd(page, rows, xzSKill);
        List<XzSKill> skillList = pageBean.getList();
        mv.addObject("skillList", skillList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("xzSKill", xzSKill);
        return mv;
    }

    /**
     * 跳转到添加技能页面
     *
     * @param loginID
     * @return
     */
    @RequestMapping("goInsertSkill.emp")
    public ModelAndView goInsertSkillEnd(Long loginID) {
        ModelAndView mv = new ModelAndView("backEnd/updateSkill");
        XzSKill xzSKill = new XzSKill();
        xzSKill.setLoginID(loginID);
        mv.addObject("xzSKill", xzSKill);
        return mv;
    }

    /**
     * 跳转到添加技能信息页面
     *
     * @param xzSKill
     * @param bindingResult
     * @return
     */
    @RequestMapping("insertSkill.emp")
    public ModelAndView insertSkillEnd(@Validated(XzSKill.F1.class) XzSKill xzSKill, BindingResult bindingResult) {
        ModelAndView mv = new ModelAndView("redirect:selectAllSkillA.emp");
        if (bindingResult.hasErrors()) {
            mv.setViewName("backEnd/updateSkill");
        } else {
            int a = skillService.insertSkillEnd(xzSKill);
            mv.addObject("loginID", xzSKill.getLoginID());
            if (a != 0) {
                System.out.println("添加技能成功");
            } else {
                System.out.println("添加技能失败");
            }
        }
        return mv;
    }

    /**
     * 跳转到修改技能信息页面
     *
     * @param skillID
     * @return
     */
    @RequestMapping("goUpdateSkill.emp")
    public ModelAndView goUpdateSkillEnd(Long skillID) {
        ModelAndView mv = new ModelAndView("backEnd/updateSkill");
        XzSKill xzSKill = new XzSKill();
        XzSKill xzSKill1 = new XzSKill();
        xzSKill1.setSkillID(skillID);
        xzSKill = skillService.selectSkillByIDEnd(xzSKill1);
        mv.addObject("xzSKill", xzSKill);
        return mv;
    }

    /**
     * 修改技能信息
     *
     * @param xzSKill
     * @param bindingResult
     * @return
     */
    @RequestMapping("updateSkill.emp")
    public ModelAndView updateSkillEnd(@Validated(XzSKill.F1.class) XzSKill xzSKill, BindingResult bindingResult) {
        ModelAndView mv = new ModelAndView("redirect:selectAllSkillA.emp");
        if (bindingResult.hasErrors()) {
            mv.setViewName("backEnd/updateSkill");
        } else {
            int a = skillService.updateSkillEnd(xzSKill);
            mv.addObject("loginID", xzSKill.getLoginID());
            if (a != 0) {
                System.out.println("修改成功");
            } else {
                System.out.println("修改失败");
            }
        }
        return mv;
    }

    /**
     * 删除技能信息
     *
     * @param skillID
     * @return
     */
    @RequestMapping("deleteSkill.emp")
    public ModelAndView deleteSkillEnd(Long skillID) {
        ModelAndView mv = new ModelAndView("redirect:selectAllSkillA.emp");
        XzSKill xzSKill = new XzSKill();
        if (skillID != 0) {
            XzSKill xzSKill1 = new XzSKill();
            xzSKill1.setSkillID(skillID);
            xzSKill = skillService.selectSkillByIDEnd(xzSKill1);
        }
        xzSKill.setDeleteFalt(1);
        xzSKill.setDeleteSkillDate(new Date());
        int a = skillService.updateSkillEnd(xzSKill);
        mv.addObject("loginID", xzSKill.getLoginID());
        if (a != 0) {
            System.out.println("删除成功");
        } else {
            System.out.println("删除失败");
        }
        return mv;
    }
}
