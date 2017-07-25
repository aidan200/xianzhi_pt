package com.xzlcPT.controller;/**
 * Created by Administrator on 2017/7/20.
 */

import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzShield;
import com.xzlcPT.service.XzCompanyService;
import com.xzlcPT.service.XzShieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 甘汝雷
 * @create 2017-07-20 13:28
 **/
@Controller
@RequestMapping("/Shield")
public class ShieldController  extends BaseController{
    @Autowired
    private XzShieldService xzShieldService;

    @Autowired
    private XzCompanyService xzCompanyService;

    @ResponseBody
    @RequestMapping("selByResumeId")
    private Map selByResumeId(Long resumeId){
        Map map=new HashMap();
        List<XzShield> xzShield=xzShieldService.selByResumeId(resumeId);
        List<Long> companyIdList=new ArrayList<>();
        for (int i=0;i<xzShield.size();i++){
            companyIdList.add(xzShield.get(i).getCompanyId());
        }
        List<XzCompany> clist =xzCompanyService.selByCompanyIdList(companyIdList);
        map.put("clist",clist);
        return map;
    }
    @ResponseBody
    @RequestMapping("insertShield")
    private int insertShield(@RequestBody XzShield xzShield){
        int i=xzShieldService.insertShield(xzShield);
        return i;
    }
    @ResponseBody
    @RequestMapping("deleteByShieldId")
    private  int deleteByShieldId(@RequestBody Long shieldId){
        int i=xzShieldService.deleteByShieldId(shieldId);
        return i;
    }


}
