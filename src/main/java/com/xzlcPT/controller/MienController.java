package com.xzlcPT.controller;/**
 * Created by Administrator on 2017/7/17.
 */

import com.xzlcPT.bean.XzCompanyMien;
import com.xzlcPT.service.XzMienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @RequestMapping("selectByMienId")
    public ModelAndView selectByMienId(Long mienId){
        ModelAndView mv=new ModelAndView("/foreEnd3/test2");
        XzCompanyMien xzCompanyMien=xzMienService.selectByMienId(mienId);
        mv.addObject("xzCompanyMien",xzCompanyMien);
        return mv;
    }
    @ResponseBody
    @RequestMapping("selectByCompanyId")
    public Map selectByCompanyId(Long companyId){
        Map map=new HashMap();
        List<XzCompanyMien> MienList=xzMienService.selectByCompanyId(companyId);
        for (int i=0;i<MienList.size();i++) {
         XzCompanyMien xzCompanyMien=MienList.get(i);
            map.put("xzCompanyMien", xzCompanyMien);
        }
        return map;
    }
}
