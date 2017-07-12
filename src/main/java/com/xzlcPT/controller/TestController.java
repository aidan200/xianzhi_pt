package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.Test;
import com.xzlcPT.service.TestService;
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


@Controller
@RequestMapping("/Test")
public class TestController  extends BaseController{

    @Autowired
    private TestService testService;

    @RequestMapping("/A")
    public ModelAndView TestA(String gg){
        ModelAndView mv = new ModelAndView("index");
        System.out.printf("gg");
        System.out.println(gg);
        return  mv;
    }

    @ResponseBody
    @RequestMapping("/B")
    public Map<String,Object> getJson(){
        Map<String,Object> map = new HashMap<>();
            map.put("123","abcv");
            map.put("456","hhh");
        return map;
    }

    //添加
    @RequestMapping("addTest")
    public ModelAndView addTest(@Validated({Test.F1.class}) Test test, BindingResult result){
        ModelAndView mv = new ModelAndView("testEdit");
        if(result.hasErrors()){
            //验证失败
        }else{
            try {
                testService.insert(test);
                mv.addObject("msg","添加成功");
            }catch (Exception e){
                e.printStackTrace();
                mv.addObject("msg","添加失败");
            }
        }
        return mv;
    }
    //修改
    @RequestMapping("updateTest")
    public ModelAndView updateTest(@Validated({Test.F2.class}) Test test, BindingResult result){
        ModelAndView  mv = new ModelAndView("testEdit");
        if(result.hasErrors()){
            //验证失败
        }else{
            try {
                testService.updateTest(test);
                mv.addObject("msg","修改成功");
            }catch (Exception e){
                e.printStackTrace();
                mv.addObject("msg","修改失败");
            }
        }
        return  mv;
    }
    //删除
    @RequestMapping("delTest")
    public ModelAndView deleteTest(Long id,RedirectAttributes attr){
        ModelAndView mv = new ModelAndView("redirect:selTestAll");
        try {
            testService.deleteTest(id);
            attr.addAttribute("msg","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            attr.addAttribute("msg","删除失败");
        }
        return  mv;
    }
    //按id查询 ajax方式
    @ResponseBody
    @RequestMapping("selById")
    public Map<String,Object> selById(Long id){
        Map<String,Object> map = new HashMap<>();
        Test test = testService.selTestById(id);
        map.put("test",test);
        return  map;
    }

    //编辑Test(按id查询)
    @ResponseBody
    @RequestMapping("testEdit")
    public ModelAndView selByIdEdit(Long id){
        ModelAndView mv = new ModelAndView("testEdit");
        Test test = new Test();
        if(id!=null&&id!=0){
            test = testService.selTestById(id);
        }
        mv.addObject("test",test);
        return  mv;
    }

    //分页条件查询
    @RequestMapping("selTestAll")
    public ModelAndView selTestAll(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="5")Integer rows,Test test){
        ModelAndView mv = new ModelAndView("testShow");
        PageBean<Test> pageBean = testService.selTestAll(page,rows,test);
        List<Test> tlist = pageBean.getList();
        //tlist.stream().forEach(System.out::println);
        mv.addObject("tlist",tlist);
        mv.addObject("page",pageBean.getPageNum());
        mv.addObject("pages",pageBean.getPages());
        mv.addObject("rows",pageBean.getPageSize());
        mv.addObject("total",pageBean.getTotal());
        mv.addObject("test",test);
        return  mv;
    }

    @RequestMapping("headerTest")
    public ModelAndView tiaozhuan(){
        ModelAndView mv = new ModelAndView("/foreEnd/index");
        return mv;
    }
}
