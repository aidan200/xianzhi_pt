package com.xzlcPT.controller;

import com.amazonaws.services.dynamodbv2.xspec.L;
import com.util.MailUtil;
import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzPostion;
import com.xzlcPT.bean.XzPostionBrowse;
import com.xzlcPT.service.XzPostionBrowseService;
import com.xzlcPT.service.XzPostionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
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
    private XzPostionBrowseService postionBrowseService;

    @RequestMapping("/addPostion.do")
    public ModelAndView addPostion(String[] filed2){
        ModelAndView mv = new ModelAndView();


        return mv;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder){
        //日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat, true));
    }

    //公司发布职位查询
    @ResponseBody
    @RequestMapping("/selPostionSend.do")
    public Map selPostionSend(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                              Long companyId,String postionName,String postionSpace,String postionWelfare,Date beginDate,Date endDate){
        Map searchMap = new HashMap();
        searchMap.put("companyId",companyId);
        searchMap.put("postionName",postionName);
        searchMap.put("postionSpace",postionSpace);
        searchMap.put("postionWelfare",postionWelfare);
        searchMap.put("beginDate",beginDate);
        searchMap.put("endDate",endDate);
        Map map = new HashMap();
        PageBean<XzPostion> pb = postionService.selPostionSendList(searchMap,page,rows);
        map.put("postionList",pb.getList());
        map.put("searchMap",searchMap);
        map.put("page",pb.getPageNum());
        map.put("pages",pb.getPages());
        map.put("total",pb.getTotal());
        map.put("size",pb.getSize());
        return map;
    }

    //职位列表查询
    @RequestMapping("/selPostionIndex.do")
    public ModelAndView selPostionIndex( @ModelAttribute("userLogin") XzLogin userLogin,@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                                        String[] fields, String salary, String fadate, String company_scale, String company_nature, String workspace,String likeStr){
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
        List<XzPostionBrowse> postionBrowses = postionBrowseService.selPostionBrowse(userLogin.getMember().getMemberId());//查询浏览记录

        mv.addObject("postionList",pageBean.getList());
        mv.addObject("postionBrowses",postionBrowses);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
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
    public Map selPostionIndexAjax(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "6") Integer rows,
                                            String workspace, String likeStr){
        Map map = new HashMap();
        if(workspace!=null&&!workspace.equals("全国")){
            map.put("workspace",workspace);
        }
        if(likeStr!=null&&!likeStr.equals("")){
            map.put("likeStr",likeStr);
        }
        PageBean<XzPostion> pageBean = postionService.selPostionIndex(page,rows,map);
        if(pageBean.getTotal()>=10){
            map.put("postionList",pageBean.getList());
        }else{
            Map noMap = new HashMap();
            pageBean = postionService.selPostionIndex(page,rows,noMap);
            map.put("postionList",pageBean.getList());
        }
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
    public ModelAndView selPostionInfo(@ModelAttribute("userLogin") XzLogin userLogin,Long postionId){
        ModelAndView mv=new ModelAndView("/foreEnd3/zp_zwxq");
        XzPostion xzPostion=postionService.selPostionInfo(postionId);
        List<XzPostion> cplist=postionService.selInfoByComId(xzPostion);//该公司相似职位
        postionBrowseService.insertPostionBrowse(postionId,userLogin.getMember().getMemberId());//职位浏览记录
        mv.addObject("cplist",cplist);
        mv.addObject("xzPostion",xzPostion);
        return mv;
    }
    //可能感兴趣的职位
    @ResponseBody
    @RequestMapping("selInfoByName.do")
    public Map selInfoByName(Long postionId){
        XzPostion xzPostion=postionService.selPostionInfo(postionId);
        List<XzPostion> plist =postionService.selInfoByName(xzPostion);
        Map map=new HashMap();
        map.put("plist",plist);
        return map;
    }
    //按职位名模糊查询
    @RequestMapping("selPostionByname.do")
    public ModelAndView selPostionByname(String postionName){
        ModelAndView mv=new ModelAndView("/foreEnd3/test2");
        XzPostion xzPostion=new XzPostion();
        xzPostion.setPostionName(postionName);
        List<XzPostion> plist=postionService.selInfoByName(xzPostion);
        mv.addObject("plist",plist);
        return mv;
    }
    //添加职位信息
    @RequestMapping("insertPostion.do")
    public ModelAndView insertPostion(@ModelAttribute("userLogin") XzLogin userLogin,String postionName,String postionSpace,String postionDepartment,Integer peopleNumber,
                                      Integer postionMm,Integer postionYm,Integer publishMonth,String postionExp,String postionEducation,Integer educationEntrance,
                                        String postionDescription,String postionSpecialty,String postionAgeMin,String postionAgeMax,Integer check,Integer postionWelfare){
        ModelAndView mv=new ModelAndView("redirect:/view/foreEnd3/zpc_position_management.html");
        Map map=new HashMap();
        map.put("postionName",postionName);
        map.put("postionSpace",postionSpace);
        map.put("postionDepartment",postionDepartment);
        map.put("peopleNumber",peopleNumber);
        if (postionMm==null&&postionYm==null){
            postionMm=-1;
        }
        map.put("postionMm",postionMm);
        map.put("postionYm",postionYm);
        map.put("publishMonth",publishMonth);
        if (postionExp==null) {
           postionExp="不限";
        }
        map.put("postionExp", postionExp);
        map.put("postionEducation",postionEducation);
        map.put("postionDescription",postionDescription);
        map.put("postionSpecialty",postionSpecialty);
        map.put("postionAgeMin",postionAgeMin);
        map.put("postionAgeMax",postionAgeMax);
        map.put("companyId",userLogin.getCompany().getCompanyId());
        map.put("educationEntrance",educationEntrance);
        map.put("postionWelfare",postionWelfare);
        if (check!=null&&check==1){
            map.put("forceAgeMax",postionAgeMax);
            map.put("forceAgeMin",postionAgeMin);
            map.put("forceSpecialty",postionSpecialty);
        }
        int i=postionService.insertPostion(map);
        mv.addObject("i",i);
        return mv;
    }
    //收藏职位
    @ResponseBody
    @RequestMapping("insertCollect.do")
    public Map insertCollect(@ModelAttribute("userLogin") XzLogin userLogin,Integer postionId){
        Date collectTime=new Date();
        Map map=new HashMap();
        map.put("postionId",postionId);
        map.put("memberId",userLogin.getMember().getMemberId());
        map.put("collectTime",collectTime);
        int i=postionService.insertCollect(map);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //删除收藏
    @ResponseBody
    @RequestMapping("deleteCollect.do")
    public Map deleteCollect(Long collectId){
        int i=postionService.deleteCollect(collectId);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //查询收藏
    @ResponseBody
    @RequestMapping("selectCollect.do")
    public Map selectCollect(Long memberId){
        List<XzPostion> list1=postionService.selectCollect(memberId);
        Map map=new HashMap();
        map.put("list1",list1);
        return map;
    }
    //修改投递状态(审核中)
    @ResponseBody
    @RequestMapping("updateStateIng.do")
    public Map updateStateIng(Long postionId){
        XzPostion xzPostion=new XzPostion();
        xzPostion.setPostionId(postionId);
        xzPostion.setPostionWelfare("1");
        int i=postionService.updateState(xzPostion);
        Map map=new HashMap();
        map.put("i",i);
        return map;
    }
    //修改投递状态(暂停发布)
    @ResponseBody
    @RequestMapping("updateStatePasue.do")
    public Map updateStatePasue(Long postionId){
    XzPostion xzPostion=new XzPostion();
    xzPostion.setPostionId(postionId);
    xzPostion.setPostionWelfare("4");
    int i=postionService.updateState(xzPostion);
    Map map=new HashMap();
    map.put("i",i);
    return map;
    }
    //修改投递状态(停止发布)
    @ResponseBody
    @RequestMapping("updateStateStop.do")
    public  Map updateStateStop(Long postionId){
        XzPostion xzPostion=new XzPostion();
        xzPostion.setPostionId(postionId);
        xzPostion.setPostionWelfare("5");
        int i=postionService.updateState(xzPostion);
        Map map=new HashMap();
        map.put("i",i);
        return map;
    }
    //修改投递状态(正在招聘)
    @ResponseBody
    @RequestMapping("updateStateZping.do")
    public Map updateStateZping(Long postionId){
        Map map=new HashMap();
        XzPostion xzPostion=new XzPostion();
        xzPostion.setPostionId(postionId);
        xzPostion.setPostionWelfare("3");
        int i=postionService.updateState(xzPostion);
        map.put("i",i);
        return map;
    }
    //按公司Id查职位
    @ResponseBody
    @RequestMapping("selByCompanyId.do")
    public Map selByCompanyId(@ModelAttribute("userLogin")XzLogin xzLogin){
        Map map=new HashMap();
        List<XzPostion> list=postionService.selByCompanyId(xzLogin.getCompany().getCompanyId());
        map.put("list",list);
        return map;
    }
}
