package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzCompanyFollow;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.service.XzCompanyFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/8.
 */
@Controller
@RequestMapping("Follow")
@SessionAttributes({"userLogin"})
public class CompanyFollowController {
    @Autowired
    private XzCompanyFollowService companyFollowService;


    //查询关注的企业
    @ResponseBody
    @RequestMapping("selFollowByMember.do")
    public Map selFollowByMember(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows, @ModelAttribute("userLogin")XzLogin login){
        Map map = new HashMap();
        PageBean<XzCompanyFollow> pageBean = companyFollowService.selCompanyFollowByMemberId(page,rows,login.getMember().getMemberId());
        map.put("companyFollowList",pageBean.getList());
        map.put("page", pageBean.getPageNum());
        map.put("pages", pageBean.getPages());
        map.put("rows", pageBean.getPageSize());
        map.put("total", pageBean.getTotal());
        return map;
    }


}
