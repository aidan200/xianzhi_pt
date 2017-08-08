package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzMsg;
import com.xzlcPT.service.XzMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
        PageBean<XzMsg> pageBean = msgService.selectByReceiveId(page,rows,xzLogin.getMember().getMemberId());
        mv.addObject("msgList",pageBean.getList());
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        return  mv;
    }

}
