package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.ws.RequestWrapper;
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
        Date date=new Date();
        XzPostionSend xzPostionSend=new XzPostionSend();
        xzPostionSend.setResumeId(resumeId);
        xzPostionSend.setPostionId(postionId);
        xzPostionSend.setCompanyId(companyId);
        xzPostionSend.setSendTime(date);
        xzPostionSend.setCreateTime(date);
        xzPostionSend.setSendTime1(date);
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
    //修改查看状态
    @ResponseBody
    @RequestMapping("updateType.do")
    public Map updateType(Long pmsgId,String pmsgName,String filed3){
        XzPostionSendMsg xzPostionSendMsg=new XzPostionSendMsg();
        xzPostionSendMsg.setPmsgId(pmsgId);
        xzPostionSendMsg.setPmsgName(pmsgName);
        xzPostionSendMsg.setFiled3(filed3);
        Map map=new HashMap();
        int i=xzPostionSendMsgService.updateType(xzPostionSendMsg);
        if (i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    //--------------------------------以下为公司操作--------------------------------------------
    //按投递状态查询简历
    @ResponseBody
    @RequestMapping("selByState.do")
    public Map selByState(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "4") Integer rows,@ModelAttribute("userLogin")XzLogin userLogin,Integer sendState,
                          String resumeName,String resumePostion,String zw){
        Map map=new HashMap();
        map.put("companyId",userLogin.getCompany().getCompanyId());
        map.put("sendState",sendState);
        map.put("resumeName",resumeName);
        map.put("resumePostion",resumePostion);
        map.put("zw",zw);
        List<XzPostion> postionList=xzPostionService.selectByComId(userLogin.getCompany().getCompanyId());
        PageBean<XzPostionSend> list=postionSendService.selByState(page,rows,map);
        Map map1=new HashMap();
        map1.put("list",list.getList());
        map1.put("pages",list.getPages());
        map1.put("total",list.getTotal());
        map1.put("page",list.getPageNum());
        map1.put("postionList",postionList);
        return map1;
    }
    //公司主动下载的简历
    @ResponseBody
    @RequestMapping("selByType.do")
    public Map selByType(@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "4") Integer rows,@ModelAttribute("userLogin")XzLogin userLogin,
                        String resumeName,String resumePostion,String zw){
       Map map1=new HashMap();
        map1.put("companyId",userLogin.getCompany().getCompanyId());
        map1.put("resumeName",resumeName);
        map1.put("resumePostion",resumePostion);
        map1.put("zw",zw);
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
                             String resumeName,String resumePostion,String zw){
        Map map1=new HashMap();
        map1.put("companyId",xzLogin.getCompany().getCompanyId());
        map1.put("resumeName",resumeName);
        map1.put("resumePostion",resumePostion);
        map1.put("zw",zw);
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
                           Date interviewTime,String filed1,String filed2,Long sendId,Long postionId){
        Map map1=new HashMap();
        map1.put("sendId",sendId);
        map1.put("postionId",postionId);
        int i=postionSendService.updateState(map1);
        XzPostionSendMsg xzPostionSendMsg=new XzPostionSendMsg();
        xzPostionSendMsg.setSendId(sendId);
        xzPostionSendMsg.setInterviewTime(interviewTime);
        xzPostionSendMsg.setFiled1(filed1);
        xzPostionSendMsg.setFiled2(filed2);
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
    //收藏简历
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
    //下载简历
    @RequestMapping("downResume.do")
    public ModelAndView downResume(@ModelAttribute("userLogin")XzLogin xzLogin,Long resumeId){
        ModelAndView mv=new ModelAndView("foreEnd3/index");
        XzPostionSend xzPostionSend=new XzPostionSend();
        xzPostionSend.setResumeId(resumeId);
        xzPostionSend.setCompanyId(xzLogin.getCompany().getCompanyId());
        Date date=new Date();
        xzPostionSend.setSendTime(date);
        xzPostionSend.setSendType(1);
        xzPostionSend.setCreateTime(date);
        xzPostionSend.setSendState(4);
        int i=postionSendService.insertSelective(xzPostionSend);
        mv.addObject("i",i);
        return mv;
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
        xzPostionSendMsg.setFiled2(filed2);
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
                               String resumePostion,String zw){
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
        map.put("zw",zw);
        PageBean list=postionSendService.selByConditions(page,rows,map);
        List<XzPostion> postionList=xzPostionService.selectByComId(xzLogin.getCompany().getCompanyId());
        Map map1=new HashMap();
        map1.put("list",list.getList());
        map1.put("pages",list.getPages());
        map1.put("total",list.getTotal());
        map1.put("page",list.getPageNum());
        map1.put("postionList",postionList);
        return map1;
    }

}
