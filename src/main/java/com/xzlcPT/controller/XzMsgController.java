package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzMsg;
import com.xzlcPT.service.XzMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/8.
 */
@Controller
@RequestMapping("xzMsg")
@SessionAttributes("userLogin")
public class XzMsgController {
    @Autowired
    private XzMsgService msgService;

    @RequestMapping("selMsgAll.do")
    public ModelAndView selMsgAll(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows, @ModelAttribute("userLogin") XzLogin xzLogin){
        ModelAndView mv = new ModelAndView("foreEnd3/messages");
        PageBean<XzMsg> pageBean = null;
        if(xzLogin.getLoginType()==0){
            pageBean = msgService.selectByReceiveId(page,rows,xzLogin.getMember().getMemberId());
        }else if (xzLogin.getLoginType()==1){
            pageBean = msgService.selectByReceiveId(page,rows,xzLogin.getCompany().getCompanyId());
        }
        mv.addObject("msgList",pageBean.getList());
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        return  mv;
    }
    @RequestMapping("deleteById.do")
    public ModelAndView deleteById(Long msgId){
        ModelAndView mv = new ModelAndView("redirect:selMsgAll.do");
        msgService.deleteById(msgId);
        return mv;
    }
    @RequestMapping("selMsgById.do")
    public ModelAndView selMsgById(Long msgId){
        ModelAndView mv = new ModelAndView("foreEnd3/message_info");
        XzMsg xzMsg = msgService.updateToReadById(msgId);
        mv.addObject("xzMsg",xzMsg);
        return mv;
    }
    @ResponseBody
    @RequestMapping("deleteAll.do")
    public Map deleteAll(Long [] ids){
        Map map = new HashMap();
        int i = msgService.deleteAll(ids);
        map.put("i",i);
        return map;
    }
    @ResponseBody
    @RequestMapping("noRaadCount.do")
    public Map conut(@ModelAttribute("userLogin") XzLogin xzLogin){
        Map map = new HashMap();
        int i = 0;
        if(xzLogin.getLoginType()==0){
            i = msgService.noReadCount(xzLogin.getMember().getMemberId());
        }else if(xzLogin.getLoginType()==1){
            i = msgService.noReadCount(xzLogin.getCompany().getCompanyId());
        }
        map.put("count",i);
        return map;
    }


}
