package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzCompanyFollow;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.service.XzCompanyFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
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
    //关注企业
    @ResponseBody
    @RequestMapping("insertSelective.do")
    public Map insertSelective(@ModelAttribute("userLogin")XzLogin xzLogin,Long companyId){
        XzCompanyFollow xzCompanyFollow=new XzCompanyFollow();
        xzCompanyFollow.setCompanyId(companyId);
        xzCompanyFollow.setMemberId(xzLogin.getMember().getMemberId());
        Date date=new Date();
        xzCompanyFollow.setFollowTime(date);
        int i=companyFollowService.insertSelective(xzCompanyFollow);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    //取消关注
    @ResponseBody
    @RequestMapping("deleteByPrimaryKey.do")
    public Map deleteByPrimaryKey(Long followId){
        int i=companyFollowService.deleteByPrimaryKey(followId);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    //查看关注状态
    @ResponseBody
    @RequestMapping("selFollowState.do")
    public Map selFollowState(@ModelAttribute("userLogin")XzLogin xzLogin,Long companyId){
        Map map1=new HashMap();
        map1.put("companyId",companyId);
        map1.put("memberId",xzLogin.getMember().getMemberId());
        int i=companyFollowService.selFollowState(map1);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
}
