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
    @RequestMapping("selByResumeId")
    public Map selByResumeId(Long resumeId){
        Map<String,Object> map = new HashMap<>();
        List<XzProjectExp> projectExpList = projectExpService.selectByResumeId(resumeId);
        map.put("projectExpList",projectExpList);
        return map;
    }


}
