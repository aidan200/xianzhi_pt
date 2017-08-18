package com.xzlcPT.controller;

import com.amazonaws.services.dynamodbv2.xspec.M;
import com.github.pagehelper.Page;
import com.util.MobileAndPersonID;
import com.util.PageBean;
import com.util.SavePicture;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

/**
 * Created by Administrator on 2017/4/10.
 */
@Controller
@RequestMapping("/CompanyInfo")
@SessionAttributes("userLogin")
public class CompanyInfoController {
    //    跳转到用户信息页面
    @Autowired
    private CompanyInfoService companyInfoService;
    @Autowired
    private LoginUserService loginUserService;
    @Autowired
    private DiscussService discussService;
    @Autowired
    private XzCompanyService companyService;
    @Autowired
    private XzPostionService xzPostionService;

    @RequestMapping("editCompany.do")
    public ModelAndView editCompany(XzCompany company, String[] welfaress, String[] domainss, String[] skillss){
        ModelAndView mv = new ModelAndView("foreEnd3/zpc_company_home");
        int i = companyService.editCompany(company,welfaress,domainss,skillss);
        if(i==1){
            mv.addObject("msg","ok");
        }else{
            mv.addObject("msg","err");
        }
        System.out.println("cccc----"+company);
        return mv;
    }
    //按公司id查询公司详情
    @RequestMapping("selCompanyInfo.do")
    public ModelAndView selCompanyInfo(@ModelAttribute("userLogin") XzLogin userLogin){
        ModelAndView mv = new ModelAndView("foreEnd3/zp_gsxq_bd");
        XzCompany xzCompany = companyService.selCompanyInf(userLogin.getCompany().getCompanyId());
        mv.addObject("company",xzCompany);
        return mv;
    }
    @ResponseBody
    @RequestMapping("selCompanyInfroation.do")
    public Map selCompanyInfroation(@ModelAttribute("userLogin")XzLogin xzLogin){
        Map map=new HashMap();
        XzCompany xzCompany=companyService.selCompanyInf(xzLogin.getCompany().getCompanyId());
        map.put("xzCompany",xzCompany);
        return map;
    }

    @RequestMapping("goCompanyInfo.do")
    public ModelAndView goCompanyInfoEnd(@ModelAttribute("userLogin") XzLogin userLogin) {
        ModelAndView mv = new ModelAndView("foreEnd/companyInformation");
        XzCompany xzCompany = new XzCompany();
        if (userLogin != null) {
            xzCompany = companyInfoService.selectByLoginID(userLogin.getLoginId());
            System.out.println(xzCompany.getCompanyName());
        } else {
            mv.setViewName("redirect:/XzLogin/ExitUser");
            return mv;
        }
        mv.addObject("xzCompany", xzCompany);
        return mv;
    }

    @RequestMapping("goUpdateCompanyInfo.do")
    public ModelAndView goUpdateCompanyInfo(Long loginID) {
        ModelAndView mv = new ModelAndView("foreEnd/updateCompanyInfo");
        XzCompany xzCompany = new XzCompany();
        xzCompany = companyInfoService.selectByLoginID(loginID);
        mv.addObject("xzCompany", xzCompany);
        return mv;
    }


    //    修改公司信息
    @RequestMapping("updateCompanyInfo.do")
    public ModelAndView updateCompanyInfo(@Validated({XzCompany.F1.class}) XzCompany xzCompany, BindingResult result,
                                          @RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("redirect:goCompanyInfo.do");
        if (result.hasErrors()) {
            mv.setViewName("foreEnd/updateCompanyInfo");
            System.out.println("aaa");
        } else {
            int a = 0;
            boolean pho = MobileAndPersonID.isPhone(xzCompany.getCompanyPhone());
            boolean mo = MobileAndPersonID.isMobileNO(xzCompany.getCompanyPhone());
            boolean p1 = pho || mo;
            if (!p1) {
                mv.addObject("pho", "格式错误!");
                mv.setViewName("foreEnd/updateCompanyInfo");
                mv.addObject("xzCompany", xzCompany);
                return mv;
            }
            if (photoFile.getOriginalFilename() != null && !"".equals(photoFile.getOriginalFilename())) {
                String picName = SavePicture.savePicture(photoFile, request);
                xzCompany.setCompanyPicture(picName);
            }
            System.out.println(xzCompany.getCompanyPicture());
            a = companyInfoService.updateCompanyInfo(xzCompany);
            Discuss discuss = new Discuss();
            discuss.setMemberID(xzCompany.getLoginId());
            discuss.setMemberPicture(xzCompany.getCompanyPicture());
            discussService.updateMemberPicture(discuss);

            if (a != 0) {

                System.out.println("修改成功!");
            } else {
                System.out.println("修改失败!");
            }
        }
        return mv;
    }


    //    后台
//    跳转到查询所有 企业用户信息 页面
    @RequestMapping("goCompanyInfo.emp")
    public ModelAndView selAllCompanyInfoEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows, XzCompany xzCompany) {
        ModelAndView mv = new ModelAndView("backEnd/companyInfoEnd");
        PageBean<XzCompany> pageBean = companyInfoService.selAllCompanyEnd(page, rows, xzCompany);
        List<XzCompany> companyList = pageBean.getList();
        mv.addObject("companyList", companyList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzCompany);
        return mv;
    }

    //    跳转到修改 企业用户信息 页面
    @RequestMapping("goUpdateCompanyInfo.emp")
    public ModelAndView goUpdateCompanyInfoEnd(long loginID) {
        ModelAndView mv = new ModelAndView("backEnd/updateCompanyInfoEnd");
        System.out.println(loginID);
        XzCompany xzCompany = new XzCompany();
        if (loginID != 0) {

            xzCompany = companyInfoService.selByLoginIDEnd(loginID);
        }
        mv.addObject("xzCompany", xzCompany);
        return mv;
    }

    //    修改方法
    @RequestMapping("updateCompanyInfo.emp")
    public ModelAndView updateCompanyInfoEnd(XzCompany xzCompany, @RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("redirect:goCompanyInfo.emp");
        int a = 0;
        boolean pho = MobileAndPersonID.isPhone(xzCompany.getCompanyPhone());

        if (!pho) {
            mv.addObject("pho", "手机号格式错误!");
        }

        if (!pho) {
            mv.setViewName("backEnd/updateCompanyInfoEnd");
            mv.addObject("xzCompany", xzCompany);
            return mv;
        }

        XzCompany xzCompany1 = companyInfoService.selByLoginIDEnd(xzCompany.getLoginId());
        if (xzCompany.getDeleteFalt() == 1 && xzCompany.getDeleteFalt() != xzCompany1.getDeleteFalt()) {
            xzCompany.setDeleteCompanyDate(new Date());
        }
        if (photoFile.getOriginalFilename() != null && !"".equals(photoFile.getOriginalFilename())) {
            String picName = SavePicture.savePicture(photoFile, request);
            xzCompany.setCompanyPicture(picName);
        }
        System.out.println(xzCompany.getCompanyPicture());
        a = companyInfoService.updateCompanyEnd(xzCompany);
        Discuss discuss = new Discuss();
        discuss.setMemberID(xzCompany.getLoginId());
        discuss.setMemberPicture(xzCompany.getCompanyPicture());
        discussService.updateMemberPicture(discuss);
        if (a != 0) {

            int b = updateLogin(xzCompany.getLoginId(), xzCompany.getDeleteFalt());
            if (b != 0) {

                System.out.println("修改成功!");
            } else {
                System.out.println("修改失败!");
            }
        } else {
            System.out.println("修改失败!");
        }
        return mv;
    }

    //      删除方法
    @RequestMapping("deleteCompanyInfo.emp")
    public ModelAndView deleteCompanyInfoEnd(Long loginID) {
        ModelAndView mv = new ModelAndView("redirect:goCompanyInfo.emp");
        XzCompany xzCompany = new XzCompany();
        int a = 0;
        System.out.println("deleteCompanyInfo.emp" + loginID);
        if (loginID != 0) {

            xzCompany = companyInfoService.selByLoginIDEnd(loginID);
            System.out.println(xzCompany);
            xzCompany.setDeleteFalt(1);
            xzCompany.setDeleteCompanyDate(new Date());
            a = companyInfoService.updateCompanyEnd(xzCompany);
        }
        if (a != 0) {
            System.out.println(xzCompany);
            int b = updateLogin(xzCompany.getLoginId(), xzCompany.getDeleteFalt());
            if (b != 0) {
                System.out.println("删除成功!");
            } else {
                System.out.println("删除失败2!");
            }
        } else {
            System.out.println("删除失败1!");
        }

        return mv;
    }

    public int updateLogin(long loginID, int deleteFalt) {
        XzLogin xzLogin = new XzLogin();
        xzLogin = loginUserService.selByLoginIDEnd(loginID);
        xzLogin.setDeleteFalt(deleteFalt);
        xzLogin.setDeleteLoginDate(new Date());
        System.out.println(xzLogin);
        int b = loginUserService.updateLoginEnd(xzLogin);
        return b;
    }
    @RequestMapping("selectAllJob.do")
    public ModelAndView selectAllJob(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "8") Integer rows, XzCompany xzCompany){
        ModelAndView mv =new ModelAndView("foreEnd3/zp_companylist");
        PageBean<XzCompany> pageBean=companyService.selectPcount(page, rows, xzCompany);
        List<XzCompany> clist=pageBean.getList();
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzCompany);
        mv.addObject("clist",clist);
        return mv;
    }
    @RequestMapping("selectByDomain.do")
    public ModelAndView selectByDomain(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "8") Integer rows,XzCompany xzCompany, String[] fieldList){
        ModelAndView mv=new ModelAndView("/foreEnd3/test1");
            if (fieldList!=null){
              List<String> fieldList1=Arrays.asList(fieldList);
              List<XzField> fields=new ArrayList<>();
              for (int i=0;i<fieldList1.size();i++){
                XzField xzField=new XzField();
                xzField.setFieldName(fieldList1.get(i));
                fields.add(xzField);
              }
            }
            PageBean<XzCompany> pageBean = companyService.selectDomain(page, rows, xzCompany);
            List<XzCompany> dlist = pageBean.getList();
            mv.addObject("page", pageBean.getPageNum());
            mv.addObject("pages", pageBean.getPages());
            mv.addObject("rows", pageBean.getPageSize());
            mv.addObject("total", pageBean.getTotal());
            mv.addObject("test", xzCompany);
            mv.addObject("dlist", dlist);
            return mv;
    }
    @RequestMapping("selCompanyInf.do")
    public ModelAndView selCompanyInf (@RequestParam(defaultValue="1")int page, @RequestParam(defaultValue="4")int rows,Long companyId){
        ModelAndView mv=new ModelAndView("/foreEnd3/zp_gsxq");
        PageBean<XzPostion> pageBean=xzPostionService.selectByCompanyId(page,rows,companyId);
        List<XzPostion> plist=pageBean.getList();
        List<XzPostion> clist=xzPostionService.selectCityByComId(companyId);
        XzCompany xzCompany=companyService.selCompanyInf(companyId);
        mv.addObject("plist",plist);
        mv.addObject("clist",clist);
        mv.addObject("page",pageBean.getPageNum());
        mv.addObject("pages",pageBean.getPages());
        mv.addObject("rows",pageBean.getPageSize());
        mv.addObject("total",pageBean.getTotal());
        mv.addObject("xzCompany",xzCompany);
        return mv;
    }
    @ResponseBody
    @RequestMapping("updateCompanyPic.do")
    public Map updateCompanyPic(@RequestBody XzCompany xzCompany){
       Map map=new HashMap();
        int i=companyService.updateCompanyPic(xzCompany);
        map.put("i",i);
        return map;
    }
    @ResponseBody
    @RequestMapping("selectByConditions.do")
    public ModelAndView selectByConditions (@RequestParam(defaultValue="1")int page, @RequestParam(defaultValue="4")int rows,XzPostion xzPostion){
        ModelAndView mv=new ModelAndView("/foreEnd3/zp_gsxq");
        PageBean<XzPostion> pageBean=xzPostionService.selectByConditions(page,rows,xzPostion);
        List<XzPostion> plist=pageBean.getList();
        List<XzPostion> clist=xzPostionService.selectCityByComId(xzPostion.getCompanyId());
        XzCompany xzCompany=companyService.selCompanyInf(xzPostion.getCompanyId());
        mv.addObject("plist",plist);
        mv.addObject("clist",clist);
        mv.addObject("xzPostion",xzPostion);
        mv.addObject("page",pageBean.getPageNum());
        mv.addObject("pages",pageBean.getPages());
        mv.addObject("rows",pageBean.getPageSize());
        mv.addObject("total",pageBean.getTotal());
        mv.addObject("xzCompany",xzCompany);
        return mv;
    }
    @ResponseBody
    @RequestMapping("selByCompanyName.do")
    public Map selByCompanyName(@RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "10")int rows,String companyName,Long resumeId){
    Map map=new HashMap();
    PageBean<XzCompany> PageBean=companyService.selByCompanyName(page,rows,companyName,resumeId);
    List<XzCompany> plist=PageBean.getList();
    map.put("plist",plist);
    return map;
    }
    //关注公司
    @ResponseBody
    @RequestMapping("insertFollow.do")
    public Map insertFollow(@ModelAttribute("userLogin") XzLogin userLogin,Long companyId){
        Date followTime=new Date();
        Map map=new HashMap();
        map.put("companyId",companyId);
        map.put("memberId",userLogin.getMember().getMemberId());
        map.put("followTime",followTime);
        int i=companyService.insertFollow(map);
        Map map1=new HashMap();
        if(i==1){
            map1.put("msg","ok");
        }else {
            map1.put("msg","err");
        }
        return map1;
    }
    //取消关注
    @ResponseBody
    @RequestMapping("deleteFollow.do")
    public Map deleteFollow(Long followId){
        int i=companyService.deleteFollow(followId);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
    //查询该用户关注的企业
    @RequestMapping("selectFollow.do")
    public ModelAndView selectFollow(Long memberId){
        ModelAndView mv=new ModelAndView("/foreEnd3/index");
        List<XzCompany> companyList=companyService.selectFollow(memberId);
        mv.addObject("companyList",companyList);
        return mv;
    }
    //按条件搜索公司
    @RequestMapping("selCompany.do")
    public ModelAndView selCompany(@RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "8")int rows,String companyCity,String companyName,String[] fffs){
        ModelAndView mv=new ModelAndView("foreEnd3/zp_companydetailed");
        Map map=new HashMap();
        map.put("companyCity",companyCity);
        map.put("companyName",companyName);
        map.put("list",fffs);
        PageBean<XzCompany> pageBean=companyService.selComCount(page, rows,map );
        List<XzCompany> clist=pageBean.getList();
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("map", map);
        mv.addObject("clist",clist);
        return mv;
    }
    //查询关注状态
    @ResponseBody
    @RequestMapping("selFollowState.do")
    public Map selFollowState(@ModelAttribute("userLogin") XzLogin userLogin,Long companyId){
        Map map=new HashMap();
        map.put("memberId",userLogin.getMember().getMemberId());
        map.put("companyId",companyId);
        int i=companyService.selFollowState(map);
        Map map1=new HashMap();
        if(i==1){
            map1.put("msg","ok");
        }else {
            map1.put("msg","err");
        }
        return map1;
    }

    //按公司id查询公司详情
    @RequestMapping("selCompanyName.do")
    public ModelAndView selCompanyName(@ModelAttribute("userLogin") XzLogin userLogin){
        ModelAndView mv = new ModelAndView("foreEnd3/zpc_auditing");  //跳转到zpc_auditing页面
        XzCompany xzCompany = companyService.selCompanyInf(userLogin.getCompany().getCompanyId());
        System.out.println(xzCompany);
        if(xzCompany.getCompanyState()==1){
            mv.setViewName("foreEnd3/zpc_auditing2");
        }
        mv.addObject("company",xzCompany);
        return mv;
    }

    //
    @RequestMapping("updateCompanyLic.do")
    public ModelAndView updateCompanyLic(MultipartFile file, HttpServletRequest request, @ModelAttribute("userLogin") XzLogin userLogin,XzCompany company){
        ModelAndView mv=new ModelAndView("foreEnd3/zpc_auditing2");
        XzCompany xzCompany = companyService.selCompanyInf(userLogin.getCompany().getCompanyId());
        Map<String,Object> map = new HashMap<>();
        String fileName = (file.getOriginalFilename());
        System.out.println("开始");
        String path = request.getSession().getServletContext().getRealPath("uploadImg");
        String prefix=fileName.substring(fileName.lastIndexOf(".")+1);
        fileName = new Date().getTime()+"."+prefix;
        System.out.println(path);
        if(company.getCompanyName() != "" && company.getCompanyName() != null){
            xzCompany.setCompanyName(company.getCompanyName());
        }
        xzCompany.setLicence(fileName);// 设置营业执照
        xzCompany.setCompanyState(1);// 设置营业执照状态
        companyService.updateByPrimaryKeySelective(xzCompany);
        File targetFile = new File(path, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        //保存
        try {
            file.transferTo(targetFile);
            map.put("msg","ok");
            map.put("imgName",fileName);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg","err");
        }
        mv.addObject("company",xzCompany);
        mv.addObject("map",map);
        return mv;
    }

    //---------------------------------以下为管理员用户操作方法-------------------------
    //按公司id查询公司详情
    @RequestMapping("selAllCompanyExa.emp")
    public ModelAndView selAllCompanyExamine(){
        ModelAndView mv = new ModelAndView("");
        List list = companyService.selAllCompanyExamine();
        System.out.println(list);
        mv.addObject("list",list);
        return mv;
    }

    //按公司id查询与预览
    @RequestMapping("selCompanyById.emp")
    public ModelAndView selCompanyById(Long memberId){
        ModelAndView mv=new ModelAndView("");
        XzCompany company=companyService.selCompanyById(memberId);
        mv.addObject("company",company);
        return mv;
    }

    //修改执照审核状态
    @ResponseBody
    @RequestMapping("updateCompanyState.emp")
    public Map updateCompanyState(@RequestBody XzCompany xzCompany){
        Map map=new HashMap();
        int i=companyService.updateCompanyState(xzCompany);
        map.put("i",i);
        return map;
    }


//------------------------------以下为管理员用户操作的方法------------------------------------
    @RequestMapping("selAllCompany.emp")
    public ModelAndView selAllCompany(@RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "10")int rows,XzCompany xzCompany){
        ModelAndView mv=new ModelAndView("index");
        PageBean<XzCompany> pageBean=companyService.selAllCompany(page,rows,xzCompany);
        mv.addObject("list",pageBean.getList());
        return mv;
    }
    @ResponseBody
    @RequestMapping("selectByPrimaryKey.emp")
    public Map selectByPrimaryKey(Long companyId){
        Map map=new HashMap();
        XzCompany xzCompany=companyService.selectByPrimaryKey(companyId);
        map.put("xzCompany",xzCompany);
        return map;
    }
    @ResponseBody
    @RequestMapping("deleteByPrimaryKey.emp")
    public Map deleteByPrimaryKey(Long companyId){
        Map map=new HashMap();
        int i=companyService.deleteByPrimaryKey(companyId);
        if(i==1){
            map.put("msg","ok");
        }else {
            map.put("msg","err");
        }
        return map;
    }
}
