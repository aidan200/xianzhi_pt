package com.xzlcPT.controller;

import com.xzlcPT.bean.XzProjectExp;
import com.xzlcPT.service.XzProjectExpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/10.
 */
@Controller
@RequestMapping("ProjectExp")
public class ProjectExpController extends BaseController{

    @Autowired
    private XzProjectExpService projectExpService;
    //按简历id查询项目经验
    @ResponseBody
    @RequestMapping("selByResumeId.do")
    public Map selByResumeId(Long resumeId){
        Map<String,Object> map = new HashMap<>();
        List<XzProjectExp> projectExpList = projectExpService.selectByResumeId(resumeId);
        map.put("projectExpList",projectExpList);
        return map;
    }
    //添加项目经验
    @ResponseBody
    @RequestMapping("insertProjectExp.do")
    public Map addProjectExp(XzProjectExp projectExp){
        Map<String,Object> map = new HashMap<>();
        int i = projectExpService.insertProjectExp(projectExp);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //修改项目经验
    @ResponseBody
    @RequestMapping("updateProjectExp.do")
    public Map updateProjectExp(XzProjectExp projectExp){
        Map<String,Object> map = new HashMap<>();
        int i = projectExpService.updateProjectExp(projectExp);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //删除项目经验
    @ResponseBody
    @RequestMapping("deleteProjectExp.do")
    public Map deleteProjectExp(Long projectExpId){
        Map<String,Object> map = new HashMap<>();
        int i = projectExpService.deleteProjectExpById(projectExpId);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }

}
