package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzVideoClass;
import com.xzlcPT.service.VideoClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * 建立 视频类别 Controller
 *
 * @author 王天岳
 * @create 2017-05-11 10:50
 **/
@Controller
@RequestMapping("videoClass")
public class VideoClassController extends BaseController {
    @Autowired
    private VideoClassService videoClassService;
    /**
     * 后台
     * 查询视频类别
     *
     * @return
     */
    @RequestMapping("selectVideoClass.emp")
    public ModelAndView selectVideoClassEnd(@RequestParam(defaultValue = "1") Integer page,
                                            @RequestParam(defaultValue = "5") Integer rows) {
        ModelAndView mv = new ModelAndView("backEnd/videoClassEnd");
        XzVideoClass xzVideoClass = new XzVideoClass();
        PageBean<XzVideoClass> pageBean = videoClassService.selectVideoClassEnd(page, rows, xzVideoClass);
        List<XzVideoClass> videoClassList = pageBean.getList();
        mv.addObject("videoClassList", videoClassList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzVideoClass);
        return mv;
    }

    /**
     * 跳转到添加视频类别方法
     * @return
     */
    @RequestMapping("goInsertVideoClass.emp")
    public ModelAndView goInsertVideoClassEnd(){
        ModelAndView mv = new ModelAndView("backEnd/updateVideoClassEnd");
        mv.addObject("xzVideoClass",new XzVideoClass());
        return mv;
    }
    /**
     * 添加方法
     * @param xzVideoClass
     * @param bindingResult
     * @return
     */
    @RequestMapping("insertVideoClass.emp")
    public ModelAndView insertVideoClassEnd(@Validated(XzVideoClass.F1.class)XzVideoClass xzVideoClass,
                                            BindingResult bindingResult){
        ModelAndView mv = new ModelAndView("redirect:selectVideoClass.emp");
            if(bindingResult.hasErrors()){
                mv.setViewName("backEnd/updateVideoClassEnd");
            }else{
                int a = videoClassService.insertVideoClassEnd(xzVideoClass);
                if(a!=0){
                    System.out.println("添加成功!");
                }
            }
        return mv;
    }

    /**
     * 跳转到修改视频类别页面
     * @param vclassID
     * @return
     */
    @RequestMapping("goUpdateVideoClass.emp")
    public ModelAndView goUpdateVideoClassEnd(Long vclassID){
        ModelAndView mv = new ModelAndView("backEnd/updateVideoClassEnd");
        XzVideoClass xzVideoClass = videoClassService.selectVideoClassByIDEnd(vclassID);
        mv.addObject("xzVideoClass",xzVideoClass);
        return mv;
    }

    /**
     * 修改视频类别
     * @param xzVideoClass
     * @return
     */
    @RequestMapping("updateVideoClass.emp")
    public ModelAndView updateVideoClassEnd(@Validated(XzVideoClass.F1.class) XzVideoClass xzVideoClass, BindingResult bindingResult ){
        ModelAndView mv = new ModelAndView("redirect:selectVideoClass.emp");
        if (bindingResult.hasErrors()){
            mv.setViewName("backEnd/updateVideoClassEnd");
        }else{
            int a = videoClassService.updateVideoClassEnd(xzVideoClass);
            if(a!=0){
                System.out.println("修改成功!");
            }else{
                System.out.println("修改失败!");
            }
        }
        return mv;
    }

    /**
     * 删除方法
     * @param vclassID
     * @return
     */
    @RequestMapping("deleteVideoClass.emp")
    public ModelAndView deleteVideoClassEnd(Long vclassID){
        ModelAndView mv = new ModelAndView("redirect:selectVideoClass.emp");
        XzVideoClass xzVideoClass = videoClassService.selectVideoClassByIDEnd(vclassID);
        if(xzVideoClass.getVclassID()!=0){
            xzVideoClass.setDeleteFalt(1);
            xzVideoClass.setDeleteVclassDate(new Date());
            int a = videoClassService.updateVideoClassEnd(xzVideoClass);
            if(a!=0){
                System.out.println("删除成功");
            }
        }else{
            System.out.println("删除失败");
        }
        return mv;
    }


}
