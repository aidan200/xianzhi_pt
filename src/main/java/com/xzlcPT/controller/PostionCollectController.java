package com.xzlcPT.controller;/**
 * Created by Administrator on 2017/8/8.
 */

import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzPostionCollect;
import com.xzlcPT.service.XzPostionCollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 甘汝雷
 * @create 2017-08-08 14:58
 **/
@Controller
@RequestMapping("PCollect")
@SessionAttributes({"userLogin"})
public class PostionCollectController extends BaseController{
    @Autowired
    private XzPostionCollectService xzPostionCollectService;


    //添加收藏
    @ResponseBody
    @RequestMapping("insertSelective.do")
    public Map insertSelective(@ModelAttribute("userLogin")XzLogin xzLogin,Long postionId){
        XzPostionCollect xzPostionCollect=new XzPostionCollect();
        Date date=new Date();
        xzPostionCollect.setPostionId(postionId);
        xzPostionCollect.setMemberId(xzLogin.getMember().getMemberId());
        xzPostionCollect.setCollectTime(date);
        int i=xzPostionCollectService.insertSelective(xzPostionCollect);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    //查看收藏状态
    @ResponseBody
    @RequestMapping("selCollectState.do")
    public Map selCollectState(@ModelAttribute("userLogin")XzLogin xzLogin,Long postionId){
        XzPostionCollect xzPostionCollect=new XzPostionCollect();
        xzPostionCollect.setPostionId(postionId);
        xzPostionCollect.setMemberId(xzLogin.getMember().getMemberId());
        Date date=new Date();
        xzPostionCollect.setCollectTime(date);
        int i=xzPostionCollectService.selCollectState(xzPostionCollect);
        Map map=new HashMap();
        if (i == 1) {
        map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    //取消收藏
    @ResponseBody
    @RequestMapping("deleteCollect.do")
    public Map deleteCollect(Long collectId){
        Map map=new HashMap();
        int i=xzPostionCollectService.deleteCollect(collectId);
        if (i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
    return map;
    }
}
