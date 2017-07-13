package com.xzlcPT.controller;

import com.xzlcPT.bean.XzMember;
import com.xzlcPT.service.XzMemberService;
import com.xzlcPT.service.XzResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/13.
 */

@Controller
@RequestMapping("Member")
public class MemberController {
    @Autowired
    private XzMemberService memberService;

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
