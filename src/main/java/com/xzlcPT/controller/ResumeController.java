package com.xzlcPT.controller;

import com.xzlcPT.bean.XzField;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzResume;
import com.xzlcPT.bean.XzResumeSkill;
import com.xzlcPT.service.XzResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/10.
 */
@Controller
@RequestMapping("/Resume")
@SessionAttributes({"userLogin"})
public class ResumeController extends BaseController {

    @Autowired
    private XzResumeService resumeService;

    //个人编辑页查询个人简历
    @ResponseBody
    @RequestMapping("selResume.do")
    public Map<String,Object> selResume(@ModelAttribute("userLogin")XzLogin userLogin){
        Map<String,Object> map = new HashMap<>();
        XzResume resume = resumeService.selectByMemberId(userLogin.getMember().getMemberId());
        map.put("resume",resume);

        return map;
    }

    //基本资料修改
    @ResponseBody
    @RequestMapping("updateResume.do")
    public Map<String,Object> updateResume(@RequestBody XzResume resume){
        Map<String,Object> map = new HashMap<>();
        int i = resumeService.updateResumeByFore(resume);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }

    @RequestMapping("selResumeInformation")
    public ModelAndView selResumeInformation(Long resumeId){
        ModelAndView mv=new ModelAndView("/foreEnd3/resume");
        XzResume xzResume=resumeService.selResumeInformation(resumeId);
        mv.addObject("xzResume",xzResume);
        return mv;
    }


}
