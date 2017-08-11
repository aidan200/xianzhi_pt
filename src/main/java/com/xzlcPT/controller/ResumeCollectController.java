package com.xzlcPT.controller;/**
 * Created by Administrator on 2017/8/9.
 */

import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzResumeCollect;
import com.xzlcPT.service.XzResumeCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 甘汝雷
 * @create 2017-08-09 17:18
 **/
@Controller
@RequestMapping("/ResumeCollect")
@SessionAttributes({"userLogin"})
public class ResumeCollectController extends BaseController{

    @Autowired
    private XzResumeCollectService resumeCollectService;

    @RequestMapping("insertSelective.do")
    public ModelAndView insertSelective(@ModelAttribute("userLogin") XzLogin xzLogin,Long resumeId) {
        ModelAndView mv=new ModelAndView("foreEnd3/index");
        XzResumeCollect xzResumeCollect=new XzResumeCollect();
        Date date=new Date();
        xzResumeCollect.setCompanyId(xzLogin.getCompany().getCompanyId());
        xzResumeCollect.setResumeId(resumeId);
        xzResumeCollect.setCollectTime(date);
        int i = resumeCollectService.insertSelective(xzResumeCollect);
        mv.addObject("i",i);
        return mv;
    }
    @ResponseBody
    @RequestMapping("deleteByPrimaryKey.do")
    public Map deleteByPrimaryKey(Long collectId){
        int i=resumeCollectService.deleteByPrimaryKey(collectId);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","ok");
        }
        return map;
    }
}
