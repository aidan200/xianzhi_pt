package com.xzlcPT.controller;

import com.xzlcPT.bean.XzPostionSend;
import com.xzlcPT.service.XzPostionSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/26.
 */
@Controller
@RequestMapping("PostionSend")
public class PostionSendController extends BaseController{
    @Autowired
    private XzPostionSendService postionSendService;

    //企业职位管理查询
    @ResponseBody
    @RequestMapping("count7.do")
    public Map count7(Long selId,Integer type){
        Map map = new HashMap();
        Map serachMap = new HashMap();
        if(type==1){
            serachMap.put("companyId",selId);
        }else if (type==2){
            serachMap.put("resumeId",selId);
        }
        List<XzPostionSend> postionSend = postionSendService.selSendCountByCorRId(serachMap);
        map.put("theCount",postionSend);
        return map;
    }

    //简历投递
    @ResponseBody
    @RequestMapping("sendPostion.do")
    public Map sendPostion(Long postionId){
        Map map = new HashMap();


        return map;
    }
}
