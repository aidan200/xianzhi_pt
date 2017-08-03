package com.xzlcPT.controller;/**
 * Created by Administrator on 2017/8/3.
 */

import com.amazonaws.services.dynamodbv2.xspec.M;
import com.xzlcPT.bean.XzResumeBrowse;
import com.xzlcPT.service.XzResumeBrowseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 甘汝雷
 * @create 2017-08-03 14:41
 **/
@Controller
@RequestMapping("/ResumeBrowse")
public class ResumeBrowseController extends BaseController{

    @Autowired
    private XzResumeBrowseService xzResumeBrowseService;
    //查看简历
    @ResponseBody
    @RequestMapping("insert")
    public Map insert(XzResumeBrowse xzResumeBrowse){
        Date date=new Date();
        xzResumeBrowse.setBrowseTime(date);
        int i=xzResumeBrowseService.insert(xzResumeBrowse);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //用户查看消息
    @ResponseBody
    @RequestMapping("update")
    public Map updateByPrimaryKey(Long browseId){
        int i=xzResumeBrowseService.updateByPrimaryKey(browseId);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //多少人看过我的简历
    @ResponseBody
    @RequestMapping("selCount")
    public Map selCountByResumeId(Long resumeId){
        int i=xzResumeBrowseService.selCountByResumeId(resumeId);
        Map map=new HashMap();
        map.put("i",i);
        return map;
    }

}
