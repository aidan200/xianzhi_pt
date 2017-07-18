package com.xzlcPT.controller;

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
    //职位列表查询
    @RequestMapping("/selPostionIndex.do")
    public ModelAndView selPostionIndex( @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
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

        List<XzPostion> pp = pageBean.getList();
        //System.out.println(pp);
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

        /*map.put("salary",salary);
        map.put("fadate",fadate);
        map.put("company_scale",company_scale);
        map.put("company_nature",company_nature);*/
        map.put("alist",alist);
        mv.addObject("queryPostion",map);
        return mv;
    }

}
