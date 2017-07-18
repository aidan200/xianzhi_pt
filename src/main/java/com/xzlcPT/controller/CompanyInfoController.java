package com.xzlcPT.controller;

import com.amazonaws.services.dynamodbv2.xspec.L;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.util.MobileAndPersonID;
import com.util.PageBean;
import com.util.SavePicture;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.CompanyInfoService;
import com.xzlcPT.service.DiscussService;
import com.xzlcPT.service.LoginUserService;
import com.xzlcPT.service.XzCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

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


    @RequestMapping("addCompany.do")
    public ModelAndView addCompany(XzCompany company){
        ModelAndView mv = new ModelAndView();

        System.out.println("cccc----"+company);

        //companyService.addCompany(company);
        return mv;
    }

    @RequestMapping("selCompanyInfo.do")
    public ModelAndView selCompanyInfo(){
        ModelAndView mv = new ModelAndView();
        XzCompany c = companyInfoService.selCompanyInfo(2L);
        System.out.println(c);
        return mv;
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
    @RequestMapping("selectAllJob")
    public ModelAndView selectAllJob(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "8") Integer rows, XzCompany xzCompany){
        ModelAndView mv =new ModelAndView("/foreEnd3/companylist");
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
    @RequestMapping("selectByDomain")
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
    @ResponseBody
    @RequestMapping("selCompanyInf")
    public ModelAndView selCompanyInf (Long companyId){
        ModelAndView mv=new ModelAndView("/foreEnd3/test2");
        XzCompany xzCompany=companyService.selCompanyInf(companyId);
        mv.addObject("xzCompany",xzCompany);
        return mv;
    }
    @RequestMapping("updateCompanyPic")
    public  ModelAndView updateCompanyPic(XzCompany xzCompany){
        ModelAndView mv=new ModelAndView("/foreEnd3/test2");
        int i=companyService.updateCompanyPic(xzCompany);
        mv.addObject("i",i);
        return mv;
    }
}
