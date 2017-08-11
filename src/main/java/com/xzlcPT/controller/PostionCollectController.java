package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.bean.XzPostionCollect;
import com.xzlcPT.service.XzPostionCollectService;
import com.xzlcPT.service.XzPostionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("PostionCollect")
@SessionAttributes({"userLogin"})
public class PostionCollectController {
    @Autowired
    private XzPostionCollectService postionCollectService;

    @Autowired
    private XzPostionService postionService;

    //我收藏的职位
    @ResponseBody
    @RequestMapping("selCollectByMemberId.do")
    public Map selCollectByMemberId(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows, @ModelAttribute("userLogin")XzLogin login){
        Map map = new HashMap();
        PageBean<XzPostionCollect> pageBean = postionCollectService.selCollectByMemberId(page,rows,login.getMember().getMemberId());
        map.put("postionCollectList",pageBean.getList());
        map.put("page", pageBean.getPageNum());
        map.put("pages", pageBean.getPages());
        map.put("rows", pageBean.getPageSize());
        map.put("total", pageBean.getTotal());
        return map;
    }
    //查询是否收藏
    @ResponseBody
    @RequestMapping("selCollectState.do")
    public Map selCollectState(@ModelAttribute("userLogin") XzLogin userLogin,Long postionId){
        Map map=new HashMap();
        map.put("memberId",userLogin.getMember().getMemberId());
        map.put("postionId",postionId);
        int i=postionCollectService.selCollectState(map);
        Map map1=new HashMap();
        if(i==1){
            map1.put("msg","ok");
        }else {
            map1.put("msg","err");
        }
        return map1;
    }

}
