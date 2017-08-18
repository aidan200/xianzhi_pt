package com.xzlcPT.controller;

import com.util.PageBean;
import com.util.PdfUtil;
import com.util.ZipUtil;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.XzPostionService;
import com.xzlcPT.service.XzResumeBrowseService;
import com.xzlcPT.service.XzResumeService;
import com.xzlcPT.service.XzShieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
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
    @Autowired
    private XzPostionService postionService;
    @Autowired
    private XzResumeBrowseService resumeBrowseService;
    @Autowired
    private XzShieldService shieldService;

    //跳转到个人简历编辑
    @RequestMapping("goEditResume.do")
    public ModelAndView goEditResume(@ModelAttribute("userLogin")XzLogin userLogin){
        ModelAndView mv = new ModelAndView("foreEnd3/zp_jianli");
        XzResume resume = resumeService.selectByMemberId(userLogin.getMember().getMemberId());
        mv.addObject("resume",resume);
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
    //个人投递职位查询
    @RequestMapping("selPostionBySelf.do")
    public ModelAndView selPostionBySelf(@ModelAttribute("userLogin") XzLogin userLogin,String type){
        ModelAndView mv = new ModelAndView("foreEnd3/zp_postposition");
        XzResume resume =  resumeService.selectByMemberId(userLogin.getMember().getMemberId());
        mv.addObject("resume",resume);
        if(null!=type){
            mv.addObject("type",type);
        }
        return mv;
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

    //查看完成度Session
    @ResponseBody
    @RequestMapping("flashResumeByMember.do")
    public Map<String,Object> flashResumeByMember(@ModelAttribute("userLogin") XzLogin userLogin){
        Map<String,Object> map = new HashMap<>();
        XzResume rss = resumeService.selectByMemberId(userLogin.getMember().getMemberId());
        map.put("resumeCompletion",rss.getResumeCompletion());
        return map;
    }

    //简历下载
    @ResponseBody
    @RequestMapping("ResumeDownload.do")
    public void ResumeDownload(Long resumeId, HttpServletRequest request, HttpServletResponse response){
        XzResume xzResume = resumeService.selResumeInformation(resumeId);
        System.out.println("路径：：："+request.getServletContext().getRealPath("/dist/foreEnd3/img/boy.png"));
        System.out.println(xzResume);
        String fileName = (xzResume.getResumeName()==null?"unKnown":xzResume.getResumeName())+"("+new Date().getTime()+").pdf";
        File file = PdfUtil.makePdf(xzResume,fileName,request);
        if(file!=null){
            try {
                fileName = new String(fileName.getBytes(), "ISO-8859-1");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            response.setHeader("Content-Disposition","attachment;filename="+fileName);
            try {
                DataOutputStream temps = new DataOutputStream(response
                        .getOutputStream());
                DataInputStream in = new DataInputStream(
                        new FileInputStream(file));

                byte[] b = new byte[512];
                while ((in.read(b)) != -1) {
                    temps.write(b);
                    temps.flush();
                }
                in.close();
                temps.close();
            }catch (Exception e){
                e.printStackTrace();
            }
            file.delete();
        }
    }

    //简历批量下载
    @ResponseBody
    @RequestMapping("ResumeDownloadPL.do")
    public void ResumeDownload(Long [] resumeIds, HttpServletRequest request, HttpServletResponse response){
        List<File> resumeFiles = new ArrayList<>();
        for (Long resumeId : resumeIds) {
            XzResume xzResume = resumeService.selResumeInformation(resumeId);
            System.out.println(xzResume);
            String fileName = xzResume.getResumeName()+"("+new Date().getTime()+").pdf";
            File file = PdfUtil.makePdf(xzResume,fileName,request);
            resumeFiles.add(file);
        }
        String fileName = "批量导出简历("+new Date().getTime()+").zip";
        File file = ZipUtil.compress(request.getServletContext().getRealPath("/pdf/"+fileName),resumeFiles);
        if(file!=null){
            try {
                fileName = new String(fileName.getBytes(), "ISO-8859-1");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            response.setHeader("Content-Disposition","attachment;filename="+fileName);
            try {
                DataOutputStream temps = new DataOutputStream(response
                        .getOutputStream());
                DataInputStream in = new DataInputStream(
                        new FileInputStream(file));

                byte[] b = new byte[512];
                while ((in.read(b)) != -1) {
                    temps.write(b);
                    temps.flush();
                }
                in.close();
                temps.close();
            }catch (Exception e){
                e.printStackTrace();
            }
            file.delete();
            for (File resumeFile : resumeFiles) {
                resumeFile.delete();
            }
        }
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
    //按条件搜索简历
    @RequestMapping("selResumeByConditions.do")
    public ModelAndView selResumeByConditions(@RequestParam(defaultValue="1")int page, @RequestParam(defaultValue="10")int rows,@ModelAttribute("userLogin")XzLogin xzLogin,String fieldName,String educationLevel,
                                                String resumePosition,String resumeMm,Integer resumeIntentYm,String resumeBirth,String resumeSex,String resumeFlash,String resumeState,String workspace){
        ModelAndView mv=new ModelAndView("foreEnd3/zpc_selectresume");
        Map  map=new HashMap();
        map.put("fieldName",fieldName);
        map.put("educationLevel",educationLevel);
        map.put("resumePosition",resumePosition);
        map.put("resumeMm",resumeMm);
        map.put("resumeIntentYm",resumeIntentYm);
        map.put("resumeBirth",resumeBirth);
        map.put("resumeSex",resumeSex);
        map.put("resumeFlash",resumeFlash);
        map.put("resumeState",resumeState);
        map.put("workspace",workspace);
        List<XzShield> shieldList=shieldService.selByCompanyId(xzLogin.getCompany().getCompanyId());
        List<Long> list=new ArrayList<>();
        for (XzShield xzShield:shieldList){
            list.add(xzShield.getResumeId());
        }
        map.put("list",list);
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
        if (resumeFlash!=null){
            flist.add(resumeFlash);
        }
        if (resumeState!=null){
            flist.add(resumeState);
        }
        PageBean<XzResume> pageBean=resumeService.selectRcount(page,rows,map);
        List<XzResume> resumeList=pageBean.getList();
        mv.addObject("flist",flist);
        mv.addObject("resumePosition",resumePosition);
        mv.addObject("resumeList",resumeList);
        mv.addObject("page",pageBean.getPageNum());
        mv.addObject("pages",pageBean.getPages());
        mv.addObject("rows",pageBean.getPageSize());
        mv.addObject("total",pageBean.getTotal());
        mv.addObject("workspace",workspace);
        mv.addObject("userLogin",xzLogin);
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
    @ResponseBody
    @RequestMapping("selectResume.do")
    public Map selResume(@RequestParam(defaultValue="1")int page, @RequestParam(defaultValue="10")int rows,Long companyId,Long postionId,
                            String resumeSex,String resumeName,String resumeWorkspace,Long resumeBirthMin,Long resumeBirthMax,
                         Long resumeWorkinglifeMin,Long resumeWorkinglifeMax,String resumeField,String resumePosition){
        Map map=new HashMap();
        map.put("companyId",companyId);
        map.put("postionId",postionId);
        map.put("resumeSex",resumeSex);
        map.put("resumeName",resumeName);
        map.put("resumeWorkspace",resumeWorkspace);
        map.put("resumeBirthMin",resumeBirthMin);
        map.put("resumeBirthMax",resumeBirthMax);
        map.put("resumeWorkinglifeMin",resumeWorkinglifeMin);
        map.put("resumeWorkinglifeMax",resumeWorkinglifeMax);
        map.put("resumeField",resumeField);
        map.put("resumePosition",resumePosition);
        PageBean<XzResume> pageBean=resumeService.selResume(page,rows,map);
        List<XzResume> resumeList=pageBean.getList();
        List<XzPostion> postionList=postionService.selectByComId(companyId);
        Map map1=new HashMap();
        map1.put("resumeList",resumeList);
        map1.put("page",pageBean.getPageNum());
        map1.put("pages",pageBean.getPages());
        map1.put("rows",pageBean.getPageSize());
        map1.put("total",pageBean.getTotal());
        map1.put("postionList",postionList);
         return map1;
    }
    @RequestMapping("selResumeInfoCom.do")
    public ModelAndView selResumeInfoCom(@ModelAttribute("userLogin")XzLogin xzLogin,Long resumeId){
        ModelAndView mv=new ModelAndView("foreEnd3/zp_resumein");
        XzResume xzResume=resumeService.selResumeInformation(resumeId);

        XzResumeBrowse resumeBrowse=new XzResumeBrowse();
        resumeBrowse.setResumeId(resumeId);
        resumeBrowse.setCompanyId(xzLogin.getCompany().getCompanyId());
        Date t1=new Date();
        resumeBrowse.setBrowseTime(t1);
        int j=resumeBrowseService.selectByComIdAndRId(resumeBrowse);
        if (j==0) {
            int i = resumeBrowseService.insertSelective(resumeBrowse);
        }
        mv.addObject("xzResume",xzResume);
        return mv;
    }
    //-----------------------------------以下为后台管理员用户使用的方法------------------------------
    @RequestMapping("selAllResume.emp")
    public ModelAndView selAllResume(@RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "10")int rows,XzResume xzResume){
        ModelAndView mv=new ModelAndView("backEnd3/resume_manage");
        PageBean<XzResume> pageBean=resumeService.selAllResume(page,rows,xzResume);
        mv.addObject("list",pageBean.getList());
        mv.addObject("page",pageBean.getPageNum());
        mv.addObject("pages",pageBean.getPages());
        mv.addObject("total",pageBean.getTotal());
        mv.addObject("rows",pageBean.getPageSize());
        return mv;
    }
    @ResponseBody
    @RequestMapping("deleteByPrimaryKey.emp")
    public Map deleteByPrimaryKey(Long resumeId){
        Map map=new HashMap();
        int i=resumeService.deleteByPrimaryKey(resumeId);
        if(i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    @ResponseBody
    @RequestMapping("selectByPrimaryKey.emp")
    public Map selectByPrimaryKey(Long resumeId){
        Map map=new HashMap();
        XzResume xzResume=resumeService.selectByPrimaryKey(resumeId);
        map.put("xzResume",xzResume);
        return map;
    }
}
