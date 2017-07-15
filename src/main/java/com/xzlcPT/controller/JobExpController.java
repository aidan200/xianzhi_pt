package com.xzlcPT.controller;

import com.xzlcPT.bean.XzJobExp;
import com.xzlcPT.service.XzJobExpService;
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
@RequestMapping("JobExp")
public class JobExpController extends BaseController{

    @Autowired
    private XzJobExpService jobExpService;
    ///按简历id查询工作经验
    @ResponseBody
    @RequestMapping("selByResumeId.do")
    public Map selByResumeId(Long resumeId){
        Map<String,Object> map = new HashMap<>();
        List<XzJobExp> jobExpList = jobExpService.selectByResumeId(resumeId);
        map.put("jobExpList",jobExpList);
        return map;
    }
    //添加工作经验
    @ResponseBody
    @RequestMapping("insertJobExp.do")
    public Map addJobExp(XzJobExp jobExp){
        Map<String,Object> map = new HashMap<>();
        int i = jobExpService.insertJobExp(jobExp);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //修改工作经验
    @ResponseBody
    @RequestMapping("uodateJobExp.do")
    public Map updateJobExp(XzJobExp jobExp){
        Map<String,Object> map = new HashMap<>();
        int i = jobExpService.updateJobExp(jobExp);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //删除工作经验
    @ResponseBody
    @RequestMapping("deleteJobExp.do")
    public Map addJobExp(Long jobExpId){
        Map<String,Object> map = new HashMap<>();
        int i = jobExpService.deleteJobExpById(jobExpId);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
}
