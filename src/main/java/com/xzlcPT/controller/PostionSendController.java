package com.xzlcPT.controller;

import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.bean.XzPostionSend;
import com.xzlcPT.bean.XzResume;
import com.xzlcPT.service.XzPostionSendService;
import com.xzlcPT.service.XzPostionService;
import com.xzlcPT.service.XzResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/26.
 */
@Controller
@RequestMapping("PostionSend")
@SessionAttributes({"userLogin"})
public class PostionSendController extends BaseController{
    @Autowired
    private XzPostionSendService postionSendService;
    @Autowired
    private XzResumeService xzResumeService;
    @Autowired
    private XzPostionService xzPostionService;

    //企业职位管理查询
    @ResponseBody
    @RequestMapping("count7.do")
    public Map count7(Long selId,Integer type,Integer day){
        Map map = new HashMap();
        Map serachMap = new HashMap();
        serachMap.put("cday",day);
        if(type==1){
            serachMap.put("companyId",selId);
        }else if (type==2){
            serachMap.put("resumeId",selId);
        }
        List<XzPostionSend> postionSend = postionSendService.selSendCountByCorRId(serachMap);
        map.put("theCount",postionSend);
        return map;
    }

    //简历投递
    @ResponseBody
    @RequestMapping("sendPostion.do")
    public Map sendPostion(@ModelAttribute("userLogin")XzLogin userLogin,Long postionId){
        XzResume resume = xzResumeService.selectByMemberId(userLogin.getMember().getMemberId());
        XzPostion postion=xzPostionService.selPostionInfo(postionId);
        Long companyId=postion.getCompanyId();
        Long resumeId=resume.getResumeId();
        Date sendTime=new Date();
        Map map = new HashMap();
        map.put("resumeId",resumeId);
        map.put("postionId",postionId);
        map.put("companyId",companyId);
        map.put("sendTime",sendTime);
        int i=postionSendService.insertSelective(map);
        map = new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }

    //查询是否投递
    @ResponseBody
    @RequestMapping("selisSend.do")
    public Map selisSend(@ModelAttribute("userLogin")XzLogin userLogin,Long postionId){
        XzResume resume = xzResumeService.selectByMemberId(userLogin.getMember().getMemberId());
        Map map = new HashMap();
        map.put("resumeId",resume.getResumeId());
        map.put("postionId",postionId);
        int i = postionSendService.selisSend(map);
        map = new HashMap();
        if(i>0){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //当天投递个数
    @ResponseBody
    @RequestMapping("selSendCount.do")
    public Map selSendCount(Long resumeId){
        int i=postionSendService.selSendCount(resumeId);
        Map map=new HashMap();
        map.put("i",i);
        return map;
    }
    @ResponseBody
    @RequestMapping("selByState.do")
    public Map selByState(@ModelAttribute("userLogin")XzLogin userLogin,Integer sendState){
        Map map=new HashMap();
        map.put("companyId",userLogin.getCompany().getCompanyId());
        map.put("sendState",sendState);
        List<XzResume> list=postionSendService.selByState(map);
        Map map1=new HashMap();
        map1.put("list",list);
        return map1;
    }
    @RequestMapping("selsta")
    public ModelAndView selsta(Long companyId,Integer sendState){
        ModelAndView mv=new ModelAndView("foreEnd3/test2");
        Map map=new HashMap();
        map.put("companyId",companyId);
        map.put("sendState",sendState);
        List<XzResume> list=postionSendService.selByState(map);
        mv.addObject("list",list);
        return mv;
    }
}
