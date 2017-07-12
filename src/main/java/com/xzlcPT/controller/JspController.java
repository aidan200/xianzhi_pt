package com.xzlcPT.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 页面跳转controller，避免jsp直接访问
 */
@Controller
@RequestMapping("/")
public class JspController {

    @RequestMapping("/view/{htmlPath}/{htmlName}.html")
    public ModelAndView go(@PathVariable("htmlName") String htmlName, @PathVariable("htmlPath") String htmlPath, String msg
            , String redirectUrl) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName(htmlPath + "/" + htmlName);
        if (msg != null && !msg.equals("")) {
            mv.addObject("msg", msg);
        }
        mv.addObject("htmlName", htmlName);
		if(redirectUrl != null){
		    mv.addObject("redirectUrl",redirectUrl);
        }
        return mv;
    }
}
