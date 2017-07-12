package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.Teacher;
import com.xzlcPT.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 	师资controller
 *  Create by 王诗钰 2017/4/17
 */
@Controller
@RequestMapping("/Teacher")
public class TeacherController extends BaseController{

    @Autowired
    private TeacherService teacherService;

    /**
     * 插入一条数据
     * @param teacher
     * @return
     */
    @RequestMapping("saveTeacher.emp")
    public ModelAndView saveTeacher(@Validated(Teacher.F1.class)Teacher teacher,BindingResult bindingResult){
        ModelAndView mav = new ModelAndView("backEnd/teacherEdit");
        if (bindingResult.hasErrors()){

        }else{
            try {
                teacherService.saveTeacher(teacher);
                mav.addObject("msg", "添加成功");
            } catch (Exception ex) {
                ex.printStackTrace();
                mav.addObject("msg", "添加失败");
            }
        }
        return mav;
    }
    /**
     * 删除一条数据
     * @param tea
     * @return
     */
    @RequestMapping("deleteTeacher.emp")
    public ModelAndView deleteTeacher(Teacher tea, RedirectAttributes attr){
        ModelAndView mav = new ModelAndView("redirect:selectTeacherAll.emp");
        try{
            teacherService.deleteTeacher(tea);
            attr.addAttribute("msg","删除成功");
        }catch (Exception ex){
            ex.printStackTrace();
            attr.addAttribute("msg","删除失败");
        }
        return mav;
    }
    /**
     * 修改一条数据
     * @param tea
     * @return
     */
    @RequestMapping("updateTeacher.emp")
    public ModelAndView updateTeacher(@Validated(Teacher.F1.class)Teacher tea, BindingResult bindingResult){
        ModelAndView mav = new ModelAndView("backEnd/teacherEdit");
        if (bindingResult.hasErrors()){

        }else{
            try{
                teacherService.updateTeacher(tea);
                mav.addObject("msg","修改成功");
            }catch (Exception ex){
                ex.printStackTrace();
                mav.addObject("msg","修改失败");
            }
        }
        return mav;
    }
    /**
     * 后台分页查询所有数据
     * @param tea
     * @param page
     * @return
     */
    @RequestMapping("selectTeacherAll.emp")
    public ModelAndView selectTeacherAllEnd(@RequestParam(defaultValue="1")Integer page,
                                      @RequestParam(defaultValue="10")Integer rows,Teacher tea){
        ModelAndView mav = new ModelAndView("backEnd/teacherShow");
        PageBean<Teacher> pageBean = teacherService.selectTeacherAllEnd(page,rows,tea);
        List<Teacher> teaList = pageBean.getList();
        mav.addObject("teaList",teaList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页条数
        mav.addObject("total",pageBean.getTotal());//总条数
        mav.addObject("teacher",tea);
        return mav;
    }
    /**
     * 前台分页查询所有数据
     * @param tea
     * @param page
     * @return
     */
    @RequestMapping("selectTeacherAll.do")
    public ModelAndView selectTeacherAll(@RequestParam(defaultValue="1")Integer page,
                                            @RequestParam(defaultValue="12")Integer rows,Teacher tea){
        ModelAndView mav = new ModelAndView("foreEnd/teacher");
        PageBean<Teacher> pageBean = teacherService.selectTeacherAll(page,rows,tea);
        List<Teacher> teaList = pageBean.getList();
        mav.addObject("teaList",teaList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页条数
        mav.addObject("total",pageBean.getTotal());//总条数
        mav.addObject("teacher",tea);
        return mav;
    }
    /**
     * 后台根据主键查询一条数据
     * @param teacherId
     * @return
     */
    @ResponseBody
    @RequestMapping("teacherEdit.emp")
    public ModelAndView selectByTeacherIdEdit(Long teacherId){
        ModelAndView mav = new ModelAndView("backEnd/teacherEdit");
        Teacher tea = new Teacher();
        if(null != teacherId && 0 != teacherId){
            tea = teacherService.selectByPrimaryKey(teacherId);
        }
        mav.addObject("teacher",tea);
        return mav;
    }
    /**
     * 后台根据主键查询一条数据(ajax)
     * @param teacherId
     * @return
     */
    @ResponseBody
    @RequestMapping("selectByTeacherId")
    public Map<String,Object> selectByTeacherId(Long teacherId){
        Map<String,Object> map = new HashMap<>();
        Teacher tea = teacherService.selectByPrimaryKey(teacherId);
        map.put("teacher",tea);
        return map;
    }
    @RequestMapping("backEndIndex")
    public ModelAndView backEndIndex(){
        ModelAndView mav = new ModelAndView("backEnd/backEndIndex");
        return mav;
    }
}
