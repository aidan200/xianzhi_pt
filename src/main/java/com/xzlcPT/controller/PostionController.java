package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.service.XzPostionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/6.
 */
@Controller
@RequestMapping("/Postion")
public class PostionController extends BaseController{

    @Autowired
    private XzPostionService postionService;


    @RequestMapping("/addPostion.do")
    public ModelAndView addPostion(String[] filed2){
        ModelAndView mv = new ModelAndView();


        return mv;
    }
    @RequestMapping("/selPostionIndex.do")
    public ModelAndView selPostionIndex(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                                        String[] fields,String min,String max,String fDate,String scale,String nature){
        System.out.println(fields);
        System.out.println(min);
        System.out.println(max);
        System.out.println(fDate);
        System.out.println(scale);
        System.out.println(nature);
        Map map = new HashMap();
        map.put("nature",nature);
        map.put("fields",fields);
        ModelAndView mv = new ModelAndView("foreEnd3/zp_gslb");
        PageBean<XzPostion> pageBean = postionService.selPostionIndex(page,rows,map);
        /*List<XzPostion> pp = pageBean.getList();
        System.out.println(pp);
        mv.addObject("postionList",pageBean.getList());
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("queryPostion",postion);*/
        return mv;
    }

}
