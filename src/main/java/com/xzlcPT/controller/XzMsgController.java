package com.xzlcPT.controller;

import com.xzlcPT.bean.XzLogin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2017/8/8.
 */
@Controller
@RequestMapping("xzMsg")
@SessionAttributes("userLogin")
public class XzMsgController {

    @RequestMapping("selMsgAll.do")
    public ModelAndView selMsgAll(@ModelAttribute("userLogin") XzLogin xzLogin){
        ModelAndView mv = new ModelAndView("foreEnd3/zp_news");
        

        return  mv;
    }

}
