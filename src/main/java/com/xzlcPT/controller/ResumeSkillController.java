package com.xzlcPT.controller;

import com.xzlcPT.bean.XzResumeSkill;
import com.xzlcPT.service.XzResumeSkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/17.
 */
@Controller
@RequestMapping("Skill")
public class ResumeSkillController {
    @Autowired
    private XzResumeSkillService resumeSkillService;
    //个人技能查询
    @ResponseBody
    @RequestMapping("selSkillByResumeId.do")
    public Map selSkillByResumeId(Long resumeId){
        Map map = new HashMap();
        List<XzResumeSkill> skills = resumeSkillService.selSkillByResumeId(resumeId);
        map.put("skills",skills);
        return map;
    }
    //添加个人技能
    @ResponseBody
    @RequestMapping("updateSkillByResume.do")
    public Map addSkillByResume(@RequestBody List<XzResumeSkill> resumeSkills){
        Map map = new HashMap();
        int i = resumeSkillService.insertSkillByResume(resumeSkills);
        if(i>0){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }

}
