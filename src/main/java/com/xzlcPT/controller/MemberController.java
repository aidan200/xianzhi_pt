package com.xzlcPT.controller;

import com.util.IntegerEditor;
import com.util.LongEditor;
import com.xzlcPT.bean.XzMember;
import com.xzlcPT.service.XzMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/13.
 */

@Controller
@RequestMapping("Member")
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


}
