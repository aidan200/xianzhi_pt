package com.xzlcPT.controller;

import com.amazonaws.services.dynamodbv2.xspec.M;
import com.util.PageBean;
import com.xzlcPT.bean.XzAccessPostion;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.service.XzAccessPostionService;
import com.xzlcPT.service.XzPostionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Created by Administrator on 2017/7/6.
 */
@Controller
@RequestMapping("/Postion")
@SessionAttributes({"userLogin"})
public class PostionController extends BaseController{

    @Autowired
    private XzPostionService postionService;
    @Autowired
    private XzAccessPostionService accessPostionService;


    @RequestMapping("/addPostion.do")
    public ModelAndView addPostion(String[] filed2){
        ModelAndView mv = new ModelAndView();


        return mv;
    }

    //公司发布职位查询
    @ResponseBody
    @RequestMapping("/selPostionSend.do")
    public Map selPostionSend(Long companyId){
        Map map = new HashMap();
        List<XzPostion> postions = postionService.selPostionSendList(companyId);
        map.put("postionList",postions);
        return map;
    }

    //职位列表查询
    @RequestMapping("/selPostionIndex.do")
    public ModelAndView selPostionIndex( @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                                        String[] fields, String salary, String fadate, String company_scale, String company_nature, String workspace,String likeStr){
        /*System.out.println(fields);
        System.out.println(salary);
        System.out.println(fadate);
        System.out.println(company_scale);
        System.out.println(company_nature);
        System.out.println(workspace);
        System.out.println(likeStr);*/
        Map map = new HashMap();
        if(workspace!=null&&!workspace.equals("全国")){
            map.put("workspace",workspace);
        }
        map.put("likeStr",likeStr);
        map.put("fields",fields);
        List<String> alist = new ArrayList<>();
        if(salary!=null){
            alist.add(salary);
            String [] ss = salary.split("_");
            if(!ss[1].equals("x")){
                map.put("salaryMin",Integer.parseInt(ss[1]));
            }
            if(!ss[2].equals("x")){
                map.put("salaryMax",Integer.parseInt(ss[2]));
            }
        }
        if(fadate!=null&&!fadate.equals("")){
            alist.add(fadate);
            map.put("fadate",Integer.parseInt(fadate.split("_")[1]));
        }
        if(company_scale!=null){
            alist.add(company_scale);
            map.put("companyScale",company_scale.split("_")[1]);
        }
        if(company_nature!=null){
            alist.add(company_nature);
            map.put("companyNature",Integer.parseInt(company_nature.split("_")[1]));
        }

        ModelAndView mv = new ModelAndView("foreEnd3/zp_gslb");
        PageBean<XzPostion> pageBean = postionService.selPostionIndex(page,rows,map);

        mv.addObject("postionList",pageBean.getList());
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());


        if(fields!=null){
            for (String field : fields) {
                alist.add(field);
            }
        }

        map.put("alist",alist);
        mv.addObject("queryPostion",map);
        return mv;
    }

    //类表查询异步
    @ResponseBody
    @RequestMapping("selPostionIndexAjax.do")
    public Map selPostionIndexAjax(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "2") Integer rows,
                                            String workspace, String likeStr){
        Map map = new HashMap();
        if(workspace!=null&&!workspace.equals("全国")){
            map.put("workspace",workspace);
        }
        if(likeStr!=null&&!likeStr.equals("")){
            map.put("likeStr",likeStr);
        }
        PageBean<XzPostion> pageBean = postionService.selPostionIndex(page,rows,map);
        map.put("postionList",pageBean.getList());
        map.put("page", pageBean.getPageNum());
        map.put("pages", pageBean.getPages());
        return map;
    }

    //按职位id查询详情
    @RequestMapping("selPostionById.do")
    public ModelAndView selPostionById(Long postionId){
        ModelAndView mv = new ModelAndView();
        return mv;
    }
    //职位详情
    @RequestMapping("selPostionInfo.do")
    public ModelAndView selPostionInfo(Long postionId){
        ModelAndView mv=new ModelAndView("/foreEnd3/zp_zwxq");
        XzPostion xzPostion=postionService.selPostionInfo(postionId);
        List<XzPostion> plist=postionService.selInfoByName(xzPostion.getPostionName());//可能感兴趣的职位
        List<XzPostion> cplist=postionService.selInfoByComId(xzPostion);//该公司相似职位
        mv.addObject("cplist",cplist);
        mv.addObject("plist",plist);
        mv.addObject("xzPostion",xzPostion);
        return mv;
    }
    //按职位名模糊查询
    @RequestMapping("selPostionByname.do")
    public ModelAndView selPostionByname(String postionName){
        ModelAndView mv=new ModelAndView("/foreEnd3/test2");
        List<XzPostion> plist=postionService.selInfoByName(postionName);
        mv.addObject("plist",plist);
        return mv;
    }
}
