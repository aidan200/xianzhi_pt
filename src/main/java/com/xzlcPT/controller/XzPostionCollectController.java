package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzPostionCollect;
import com.xzlcPT.service.XzPostionCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/8.
 */
@Controller
@RequestMapping("PostionCollect")
public class XzPostionCollectController {
    @Autowired
    private XzPostionCollectService postionCollectService;

    //我关注的职位
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

}
