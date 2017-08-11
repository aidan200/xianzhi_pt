package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
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
    @Autowired
    private XzResumeCollectService xzResumeCollectService;
    @Autowired
    private XzPostionSendMsgService xzPostionSendMsgService;

    //个人简历投递查询
    @ResponseBody
    @RequestMapping("selSendByMember.do")
    public Map selSendByMember(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,@ModelAttribute("userLogin")XzLogin userLogin,Integer type){
        Map map = new HashMap();
        XzResume resume = xzResumeService.selectByMemberId(userLogin.getMember().getMemberId());
        PageBean<XzPostionSend> pageBean = postionSendService.selSendByRIdAndType(page,rows,resume.getResumeId(),type);
        map.put("postionSendList",pageBean.getList());
        map.put("page",pageBean.getPageNum());
        map.put("pages",pageBean.getPages());
        map.put("total",pageBean.getTotal());
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
        XzPostionSend xzPostionSend=new XzPostionSend();
        xzPostionSend.setResumeId(resumeId);
        xzPostionSend.setPostionId(postionId);
        xzPostionSend.setCompanyId(companyId);
        xzPostionSend.setSendTime(sendTime);
        int i=postionSendService.insertSelective(xzPostionSend);
        Map map = new HashMap();
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
    //--------------------------------以下为公司操作--------------------------------------------
    //按投递状态查询简历
    @ResponseBody
    @RequestMapping("selByState.do")
    public Map selByState(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4") Integer rows,@ModelAttribute("userLogin")XzLogin userLogin,Integer sendState,
                          String resumeName,String resumePostion){
        Map map=new HashMap();
        map.put("companyId",userLogin.getCompany().getCompanyId());
        map.put("sendState",sendState);
        map.put("resumeName",resumeName);
        map.put("resumePostion",resumePostion);
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
    public Map selByType(@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "4") Integer rows,@ModelAttribute("userLogin")XzLogin userLogin,
                        String resumeName,String resumePostion){
       Map map1=new HashMap();
        map1.put("companyId",userLogin.getCompany().getCompanyId());
        map1.put("resumeName",resumeName);
        map1.put("resumePostion",resumePostion);
        PageBean<XzPostionSend> list=postionSendService.selByType(page,rows,map1);
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
    public Map selComCollect(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4") Integer rows,@ModelAttribute("userLogin")XzLogin xzLogin,
                             String resumeName,String resumePostion){
        Map map1=new HashMap();
        map1.put("companyId",xzLogin.getCompany().getCompanyId());
        map1.put("resumeName",resumeName);
        map1.put("resumePostion",resumePostion);
        PageBean<XzResume> list=postionSendService.selComCollect(page,rows,map1);
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
    public Map updateState(@ModelAttribute("userLogin")XzLogin xzLogin,String pmsgValue,
                           Date interviewTime,String filed1,String filed2,Long sendId){
        int i=postionSendService.updateState(sendId);
        XzPostionSendMsg xzPostionSendMsg=new XzPostionSendMsg();
        xzPostionSendMsg.setSendId(sendId);
        xzPostionSendMsg.setInterviewTime(interviewTime);
        xzPostionSendMsg.setFiled1(filed1);
        xzPostionSendMsg.setFiled1(filed2);
        xzPostionSendMsg.setPmsgValue(pmsgValue);
        int j=xzPostionSendMsgService.insertSelective(xzPostionSendMsg);
        Map map=new HashMap();
        if (j==1){
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
    //
    @ResponseBody
    @RequestMapping("insertSelective.do")
    public Map insertSelective(@ModelAttribute("userLogin")XzLogin xzLogin,Long postionId,Long resumeId){
        XzPostionSend xzPostionSend=new XzPostionSend();
        xzPostionSend.setPostionId(postionId);
        xzPostionSend.setResumeId(resumeId);
        xzPostionSend.setCompanyId(xzLogin.getCompany().getCompanyId());
        Date date=new Date();
        xzPostionSend.setSendTime(date);
        xzPostionSend.setSendState(2);
        xzPostionSend.setSendType(0);
        int i=postionSendService.insertSelective(xzPostionSend);
        Map map=new HashMap();
        if (i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    //收藏→邀请面试
    @ResponseBody
    @RequestMapping("comInsert.do")
    public Map comInsert(@ModelAttribute("userLogin")XzLogin xzLogin,Long collectId,String pmsgValue,
                        Date interviewTime,Long postionId,String filed1,String filed2){
        XzResumeCollect xzResumeCollect=xzResumeCollectService.selectByPrimaryKey(collectId);
        XzPostionSend xzPostionSend=new XzPostionSend();
        xzPostionSend.setResumeId(xzResumeCollect.getResumeId());
        xzPostionSend.setCompanyId(xzLogin.getCompany().getCompanyId());
        Date date=new Date();
        xzPostionSend.setSendTime(date);
        xzPostionSend.setSendState(2);
        xzPostionSend.setPostionId(postionId);
        int i=postionSendService.insertSelective(xzPostionSend);
        XzPostionSendMsg xzPostionSendMsg=new XzPostionSendMsg();
        xzPostionSendMsg.setSendId(xzPostionSend.getSendId());
        xzPostionSendMsg.setInterviewTime(interviewTime);
        xzPostionSendMsg.setFiled1(filed1);
        xzPostionSendMsg.setFiled1(filed2);
        xzPostionSendMsg.setPmsgValue(pmsgValue);
        int j=xzPostionSendMsgService.insertSelective(xzPostionSendMsg);
        Map map=new HashMap();
        if (j==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
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
    //按条件查询简历
    @ResponseBody
    @RequestMapping("selByConditions.do")
    public Map selByConditions(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4") Integer rows,
                               @ModelAttribute("userLogin")XzLogin xzLogin,Long postionId,String educationLevel,
                                Integer resumeSex,String resumeName,String resumeWorkspace,Integer birthMin,Integer birthMax,
                               String resumePostion){
        Map map=new HashMap();
        map.put("companyId",xzLogin.getCompany().getCompanyId());
        map.put("postionId",postionId);
        map.put("educationLevel",educationLevel);
        map.put("resumeSex",resumeSex);
        map.put("resumeName",resumeName);
        map.put("resumeWorkspace",resumeWorkspace);
        map.put("birthMin",birthMin);
        map.put("birthMax",birthMax);
        map.put("resumePostion",resumePostion);
        Date now=new Date();
        map.put("now",now);
        PageBean list=postionSendService.selByConditions(page,rows,map);
        map.put("list",list);
        return map;
    }
}
