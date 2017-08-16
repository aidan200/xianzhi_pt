package com.xzlcPT.controller;

import com.util.IntegerEditor;
import com.util.LongEditor;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzMember;
import com.xzlcPT.service.XzMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/13.
 */

@Controller
@RequestMapping("Member")
@SessionAttributes("userLogin")
public class MemberController extends BaseController{
    @Autowired
    private XzMemberService memberService;

    @InitBinder
    public void initBinder(WebDataBinder binder){
        //日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat, true));
    }

    @ResponseBody
    @RequestMapping("updateMember.do")
    public Map updateMember(@RequestBody XzMember member){
        Map<String,Object> map = new HashMap();
        int i = memberService.updateMember(member);
        if (i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }

    //按个人id查询个人详情
    @RequestMapping("selMemberInfo.do")
    public ModelAndView selMemberInfo(@ModelAttribute("userLogin") XzLogin userLogin){
        ModelAndView mv = new ModelAndView("foreEnd3/personalinformation");
        System.out.println(userLogin.getMember().getMemberId());
        XzMember xzMember = memberService.selXzMemberInf(userLogin.getMember().getMemberId());
        System.out.println(xzMember);
        mv.addObject("member",xzMember);
        return mv;
    }

    @RequestMapping("updateMemberInfo.do")
    public ModelAndView updateMemberInfo(@ModelAttribute("userLogin") XzLogin xzLogin, XzMember member){
        ModelAndView mv = new ModelAndView("foreEnd3/index");
        Map<String,Object> map = new HashMap();
        member.setLoginId(xzLogin.getLoginId());
        int i = memberService.updateByPrimaryKeySelective(member);
        if (i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        XzMember xzMember = memberService.selXzMemberInf(member.getMemberId());
        mv.addObject("map",map);
        mv.addObject("member",xzMember);
        return mv;
    }

}
