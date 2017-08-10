package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.XzPostionSendService;
import com.xzlcPT.service.XzPostionService;
import com.xzlcPT.service.XzResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
    //按投递状态查询简历
    @ResponseBody
    @RequestMapping("selByState.do")
    public Map selByState(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4") Integer rows,@ModelAttribute("userLogin")XzLogin userLogin,Integer sendState){
        Map map=new HashMap();
        map.put("companyId",userLogin.getCompany().getCompanyId());
        map.put("sendState",sendState);
        PageBean<XzPostionSend> list=postionSendService.selByState(page,rows,map);
        Map map1=new HashMap();
        map1.put("list",list.getList());
        map1.put("pages",list.getPages());
        map1.put("total",list.getTotal());
        map1.put("page",list.getPageNum());
        return map1;
    }
    //公司主动下载的简历
    @ResponseBody
    @RequestMapping("selByType.do")
    public Map selByType(@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "4") Integer rows,@ModelAttribute("userLogin")XzLogin userLogin){
       PageBean<XzPostionSend> list=postionSendService.selByType(page,rows,userLogin.getCompany().getCompanyId());
       Map map=new HashMap();
       map.put("list",list.getList());
       map.put("pages",list.getPages());
       map.put("total",list.getTotal());
       map.put("page",list.getPageNum());
       return map;
    }
    //公司收藏的简历
    @ResponseBody
    @RequestMapping("selComCollect.do")
    public Map selComCollect(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4") Integer rows,@ModelAttribute("userLogin")XzLogin userLogin){
        PageBean<XzResume> list=postionSendService.selComCollect(page,rows,userLogin.getCompany().getCompanyId());
        Map map=new HashMap();
        map.put("list",list.getList());
        map.put("pages",list.getPages());
        map.put("total",list.getTotal());
        map.put("page",list.getPageNum());
        return map;
    }
    //按sendId删除
    @ResponseBody
    @RequestMapping("deleteByPrimaryKey.do")
    public Map deleteByPrimaryKey(Long sendId){
        int i=postionSendService.deleteByPrimaryKey(sendId);
        Map map=new HashMap();
        if (i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    //邀请面试
    @ResponseBody
    @RequestMapping("updateState.do")
    public Map updateState(Long sendId){
        int i=postionSendService.updateState(sendId);
            Map map=new HashMap();
            if (i==1){
                map.put("msg","ok");
            }else {
                map.put("msg","err");
            }
            return map;
    }
    //意向沟通
    @ResponseBody
    @RequestMapping("updateState1.do")
    public Map updateState1(Long sendId){
        int i=postionSendService.updateState1(sendId);
        Map map=new HashMap();
        if (i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    //查询所有简历
    @ResponseBody
    @RequestMapping("selAll.do")
    public Map selAll(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4") Integer rows,@ModelAttribute("userLogin")XzLogin userLogin){
        PageBean<XzPostionSend> list=postionSendService.selAll(page,rows,userLogin.getCompany().getCompanyId());
        Map map1=new HashMap();
        map1.put("list",list.getList());
        map1.put("pages",list.getPages());
        map1.put("total",list.getTotal());
        map1.put("page",list.getPageNum());
        return map1;
    }
    @ResponseBody
    @RequestMapping("insertSelective.do")
    public Map insertSelective(@ModelAttribute("userLogin")XzLogin xzLogin,Long postionId,Long resumeId){
        Map map=new HashMap();
        map.put("postionId",postionId);
        map.put("resumeId",resumeId);
        map.put("companyId",xzLogin.getCompany().getCompanyId());
        Date date=new Date();
        map.put("sendTime",date);
        map.put("sendState",2);
        map.put("sendType",0);
        int i=postionSendService.insertSelective(map);
        Map map1=new HashMap();
        if (i==1){
            map1.put("msg","ok");
        }else {
            map1.put("msg","err");
        }
        return map1;
    }
    @RequestMapping("insert.do")
    public ModelAndView insert(Long companyId,Long postionId,Long resumeId){
        ModelAndView mv=new ModelAndView("foreEnd3/test2");
        Map map=new HashMap();
        map.put("postionId",postionId);
        map.put("resumeId",resumeId);
        map.put("companyId",companyId);
        Date date=new Date();
        map.put("sendTime",date);
        map.put("sendState",2);
        map.put("sendType",0);
        int i=postionSendService.insertSelective(map);
        mv.addObject("i",i);
        return mv;
    }
    @ResponseBody
    @RequestMapping("comInsert.do")
    public Map comInsert(@ModelAttribute("userLogin")XzLogin xzLogin,Long resumeId){
        Map map=new HashMap();
        map.put("resumeId",resumeId);
        map.put("companyId",xzLogin.getCompany().getCompanyId());
        Date date=new Date();
        map.put("sendTime",date);
        map.put("sendType",1);
        int i=postionSendService.insertSelective(map);
        Map map1=new HashMap();
        if (i==1){
            map1.put("msg","ok");
        }else {
            map1.put("msg","err");
        }
        return map;
    }
}
