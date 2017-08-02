package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzResume;
import com.xzlcPT.service.XzResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Created by Administrator on 2017/7/10.
 */
@Controller
@RequestMapping("/Resume")
@SessionAttributes({"userLogin"})
public class ResumeController extends BaseController {

    @Autowired
    private XzResumeService resumeService;
    //跳转到个人简历编辑
    @RequestMapping("goEditResume.do")
    public ModelAndView goEditResume(@ModelAttribute("userLogin")XzLogin userLogin){
        ModelAndView mv = new ModelAndView("foreEnd3/zp_jianli");
        XzResume resume = resumeService.selectByMemberId(userLogin.getMember().getMemberId());
        mv.addObject("resumeId",resume.getResumeId());
        return mv;
    }

    //个人编辑页查询个人简历
    @ResponseBody
    @RequestMapping("selResume.do")
    public Map<String,Object> selResume(@ModelAttribute("userLogin")XzLogin userLogin){
        Map<String,Object> map = new HashMap<>();
        XzResume resume = resumeService.selectByMemberId(userLogin.getMember().getMemberId());
        map.put("resume",resume);

        return map;
    }
    //刷新简历方法
    @ResponseBody
    @RequestMapping("flashResume.do")
    public Map<String,Object> flashResume(Long resumeId){
        Map<String,Object> map = new HashMap<>();
        XzResume resume = resumeService.selResumeInformation(resumeId);
        int i = resumeService.updateResumeByFore(resume);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        XzResume rss = resumeService.selectById(resumeId);
        map.put("resumeFlash",rss.getResumeFlash());
        map.put("resumeCompletion",rss.getResumeCompletion());
        return map;
    }

    //查看完成度
    @ResponseBody
    @RequestMapping("flashResumeByMore.do")
    public Map<String,Object> flashResumeByMore(Long resumeId){
        Map<String,Object> map = new HashMap<>();
        XzResume rss = resumeService.selectById(resumeId);
        map.put("resumeYm",rss.getResumeYm());
        map.put("resumeFlash",rss.getResumeFlash());
        map.put("resumeCompletion",rss.getResumeCompletion());
        return map;
    }


    //基本资料修改
    @ResponseBody
    @RequestMapping("updateResume.do")
    public Map<String,Object> updateResume(@RequestBody XzResume resume){
        Map<String,Object> map = new HashMap<>();
        int i = resumeService.updateResumeByFore(resume);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //查询简历具体信息
    @RequestMapping("selResumeInformation.do")
    public ModelAndView selResumeInformation(Long resumeId){
        ModelAndView mv=new ModelAndView("foreEnd3/zp_resume");
        XzResume xzResume=resumeService.selResumeInformation(resumeId);
        mv.addObject("xzResume",xzResume);
        return mv;
    }

    @RequestMapping("selResumeByConditions.do")
    public ModelAndView selResumeByConditions(@RequestParam(defaultValue="1")int page, @RequestParam(defaultValue="4")int rows,String fieldName,String educationLevel,
                                                String resumePosition,String resumeMm,Integer resumeIntentYm,String resumeBirth,String resumeSex,String createTime,String resumeState){
        ModelAndView mv=new ModelAndView("foreEnd3/zpc_selectresume");
        Map  map=new HashMap();
        map.put("fieldName",fieldName);
        map.put("educationLevel",educationLevel);
        map.put("resumePosition",resumePosition);
        map.put("resumeMm",resumeMm);
        map.put("resumeIntentYm",resumeIntentYm);
        map.put("resumeBirth",resumeBirth);
        map.put("resumeSex",resumeSex);
        map.put("createTime",createTime);
        map.put("resumeState",resumeState);
        List<String> flist=new ArrayList<>();
        if (fieldName!=null){
            flist.add(fieldName);
        }
        if (educationLevel!=null){
            flist.add(educationLevel);
        }
        if (resumePosition!=null&&resumePosition!=""){
            flist.add(resumePosition);
        }
        if (resumeMm!=null){
            flist.add(resumeMm);
        }
        if (resumeIntentYm!=null){
            flist.add(resumeIntentYm.toString());
        }
        if (resumeBirth!=null){
            flist.add(resumeBirth);
        }
        if (resumeSex!=null){
            flist.add(resumeSex);
        }
        if (createTime!=null){
            flist.add(createTime);
        }
        if (resumeState!=null){
            flist.add(resumeState);
        }
        PageBean<XzResume> pageBean=resumeService.selectRcount(page,rows,map);
        List<XzResume> resumeList=pageBean.getList();
        mv.addObject("flist",flist);
        mv.addObject("resumeList",resumeList);
        mv.addObject("page",pageBean.getPageNum());
        mv.addObject("pages",pageBean.getPages());
        mv.addObject("rows",pageBean.getPageSize());
        mv.addObject("total",pageBean.getTotal());
        mv.addObject("map",map);
        return mv;
    }
    //添加收藏
    @ResponseBody
    @RequestMapping("insertCollect.do")
    public Map insertCollect(Integer resumeId,Integer companyId){
        Date collectTime=new Date();
        Map map=new HashMap();
        map.put("resumeId",resumeId);
        map.put("companyId",companyId);
        map.put("collectTime",collectTime);
        int i=resumeService.insertCollect(map);
        Map map1=new HashMap();
        map1.put("i",i);
        return map1;
    }
    //删除收藏
    @ResponseBody
    @RequestMapping("delectCollect.do")
    public Map deleteCollect(Long collectId){
        int i=resumeService.deleteCollect(collectId);
        Map map=new HashMap();
        map.put("i",i);
        return map;
    }
    //查询收藏
    @ResponseBody
    @RequestMapping("selectCollect.do")
    public Map selectCollect(Long companyId){
        List<XzResume> resumeList=resumeService.selectCollect(companyId);
        Map map=new HashMap();
        map.put("resumeList",resumeList);
        return map;
    }
//    @ResponseBody
//    @RequestMapping("selResume.do")
//    public Map selResume(@RequestParam(defaultValue="1")int page, @RequestParam(defaultValue="4")int rows,Long companyId,Long postionId,
//                            String resumeSex,String resumeName,String resumeWorkspace,Long resumeBirthMin,Long resumeBirthMax,
//                         Long resumeWorkinglifeMin,Long resumeWorkinglifeMax,String resumeField,String resumePosition){
//        Map map=new HashMap();
//        map.put("companyId",companyId);
//        map.put("postionId",postionId);
//        map.put("resumeSex",resumeSex);
//        map.put("resumeName",resumeName);
//        map.put("resumeWorkspace",resumeWorkspace);
//        map.put("resumeBirthMin",resumeBirthMin);
//        map.put("resumeBirthMax",resumeBirthMax);
//        map.put("resumeWorkinglifeMin",resumeWorkinglifeMin);
//        map.put("resumeWorkinglifeMax",resumeWorkinglifeMax);
//        map.put("resumeField",resumeField);
//        map.put("resumePosition",resumePosition);
//        PageBean<XzResume> pageBean=resumeService.selResume(page,rows,map);
//        List<XzResume> resumeList=pageBean.getList();
//        Map map1=new HashMap();
//        map1.put("resumeList",resumeList);
//        map1.put("page",pageBean.getPageNum());
//        map1.put("pages",pageBean.getPages());
//        map1.put("rows",pageBean.getPageSize());
//        map1.put("total",pageBean.getTotal());
//        return map1;
//    }
}
