package com.xzlcPT.controller;/**
 * Created by Administrator on 2017/7/17.
 */

import com.xzlcPT.bean.XzCompanyMien;
import com.xzlcPT.service.XzMienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 甘汝雷
 * @create 2017-07-17 20:40
 **/
@Controller
@RequestMapping("/Mien")
public class MienController extends BaseController {
    @Autowired
    private XzMienService xzMienService;

    @RequestMapping("insertMien")
    public ModelAndView insertMien(XzCompanyMien xzCompanyMien){
        ModelAndView mv=new ModelAndView("/foreEnd3/test2");
        int i=xzMienService.insertMien(xzCompanyMien);
        mv.addObject("i",i);
        return mv;
    }
    @RequestMapping("updateMien")
    public  ModelAndView updateMien(XzCompanyMien xzCompanyMien){
        ModelAndView mv=new ModelAndView("/foreEnd3/test2");
        int i=xzMienService.updateMien(xzCompanyMien);
        mv.addObject("i",i);
        return mv;
    }
}
