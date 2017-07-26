package com.xzlcPT.controller;

import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller 层 LoginController
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/

@Controller
@RequestMapping("/")
@SessionAttributes({"userLogin","resumeId"})
public class GoIndexController extends BaseController {

    @Autowired
    private XzResumeService xzResumeService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private EventService eventService;

    @Autowired
    private ItemService itemService;

    //    跳转到主页
    @RequestMapping("/")
    public ModelAndView getIndex(@RequestParam(defaultValue = "1")Integer page,
                                 @RequestParam(defaultValue = "4")Integer rows, News news,
                                 @RequestParam(defaultValue = "1")Integer page1,
                                 @RequestParam(defaultValue = "3")Integer rows1, Event event,
                                 @RequestParam(defaultValue = "1")Integer page2,
                                 @RequestParam(defaultValue = "6")Integer rows2, Item item) {
        ModelAndView mv = new ModelAndView("foreEnd3/index");

        return mv;
    }
    @RequestMapping("zp_index")
    public ModelAndView goZpIndex(@ModelAttribute("userLogin") XzLogin userLogin){
        ModelAndView mv = new ModelAndView();
        if(userLogin.getLoginType()==0){
            mv.setViewName("foreEnd3/zp_index");
            XzResume resume = xzResumeService.selectByMemberId(userLogin.getMember().getMemberId());
            Integer completion = resume.getResumeCompletion();
            if(null!=completion&&completion>=60){

            }else{
                //简历完善程度低
            }
            mv.addObject("resumeId",resume.getResumeId());
            mv.addObject("resume",resume);
        }else{
            mv.setViewName("foreEnd3/zpc_company_home");
        }
        return mv;
    }

}