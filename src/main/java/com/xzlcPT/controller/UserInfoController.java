package com.xzlcPT.controller;

import com.util.MobileAndPersonID;
import com.util.PageBean;
import com.util.SavePicture;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Controller 层 UserInfoController
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Controller
@RequestMapping("/UserInfo")
public class UserInfoController {
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private EducationService educationService;
    @Autowired
    private WorkExperienceService workExperienceService;
    @Autowired
    private ProjectExperienceService projectExperienceService;
    @Autowired
    private LoginUserService loginUserService;

    @Autowired
    private SkillService skillService;
    @Autowired
    private DiscussService discussService;

    //    跳转到用户信息页面
    @RequestMapping("goUserInfo.do")
    public ModelAndView goUserInfoEnd(HttpSession httpSession, String jumpResumeInfo) {
//        System.out.println("goUserInfo.do  :  "+jumpResumeInfo);
        ModelAndView mv = new ModelAndView("foreEnd/userInformation");
        mv.addObject("jumpResumeInfo", jumpResumeInfo);
        XzLogin xzLogin = new XzLogin();
        XzMember xzMember = new XzMember();
        xzLogin = (XzLogin) httpSession.getAttribute("userLogin");
//        查询用户基本信息 返回用户对象
        if (xzLogin != null) {
            xzMember = userInfoService.selectUserByID(xzLogin.getLoginId());
//            System.out.println(xzMember.getLoginID());
        } else {
            mv.setViewName("redirect:/XzLogin/ExitUser");
            return mv;
        }
        mv.addObject("xzMember", xzMember);
//        查询用户学历信息 返回list集合
        List<XzEducation> edList = new ArrayList<XzEducation>();
        edList = educationService.selectEducationByID(xzLogin.getLoginId());
//        System.out.println("edList:" + edList.size());
        mv.addObject("edList", edList);
        // 传入一个空的XzEducation对象 接收sf标签传递的对象
        XzEducation selEd = new XzEducation();
        mv.addObject("xzEducation", selEd);

//        查询工作经验信息
        List<XzWorkExperience> wList = new ArrayList<XzWorkExperience>();
        wList = workExperienceService.selectWorkEByID(xzLogin.getLoginId());
        XzWorkExperience selWork = new XzWorkExperience();
        mv.addObject("wList", wList);
        mv.addObject("xzWorkExperience", selWork);
//        查询项目经验
        List<XzProjectExperience> pList = new ArrayList<>();
        pList = projectExperienceService.selectProjectByID(xzLogin.getLoginId());
        XzProjectExperience selProject = new XzProjectExperience();
        mv.addObject("pList", pList);
        mv.addObject("xzProjectExperience", selProject);
//      查询简历信息
        /*Resume resume = resumeService.selectPersonalResume(xzMember.getLoginID());
        if(resume ==null){
            resume = new Resume();
            resume.setResumeMember(xzMember.getLoginID());
            resumeService.insert(resume);
        }
        mv.addObject("resumeUser", resume);*/

        List<XzSKill> xzSkillList = new ArrayList<>();
        Long[] skillArray = null;
        if (xzLogin.getLoginId() != 0) {
            XzSKill xzSKill1 = new XzSKill();
            xzSKill1.setLoginID(xzLogin.getLoginId());
            xzSkillList = skillService.selectAllSkill(xzSKill1);
            if (xzSkillList.size() != 0) {
                skillArray = new Long[xzSkillList.size()];
                for (int i = 0; i < skillArray.length; i++) {
                    skillArray[i] = xzSkillList.get(i).getSkillID();
                }
            }
        }
        mv.addObject("xzSkillList", xzSkillList);
        System.out.println("xzSkillList : "+ xzSkillList.size());
        if (skillArray != null) {
            mv.addObject("skillArray", skillArray);
        }
        return mv;
    }

    //跳转到修改用户信息页面
    @RequestMapping("goUpdateUserInfo.do")
    public ModelAndView goUpdateUserInfo(Long loginID) {
        ModelAndView mv = new ModelAndView("foreEnd/updateUserInfo");
        XzMember xzMember1 = new XzMember();
        if (loginID != 0) {
            xzMember1 = userInfoService.selectUserByID(loginID);
        }
        mv.addObject("xzMember", xzMember1);
        System.out.println("goUpdateUserInfo:" + xzMember1.getMemberPicture());
        return mv;
    }

    //  修改用户信息
    @RequestMapping("updateUserInfo.do")
    public ModelAndView updateUserInfo(@Validated({XzMember.F1.class}) XzMember xzMember, BindingResult bindingResult, @RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("redirect:goUserInfo.do");

//        System.out.println("姓名:" + xzMember.getMemberName());
//        System.out.println("性别:" + xzMember.getMemberSex());
//        System.out.println(xzMember.getMemberPicture());
//        System.out.println("路径" + photoFile.getOriginalFilename());

        Pattern p = Pattern.compile("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
        Matcher m = p.matcher(xzMember.getMemberEmail());
        boolean bl = m.matches();

        if (bindingResult.hasErrors() || !bl) {
            mv.setViewName("foreEnd/updateUserInfo");
            if (!bl && xzMember.getMemberEmail() != null && !"".equals(xzMember.getMemberEmail())) {
                mv.addObject("memberEmailSpan", "邮箱有误");
            }
        } else {
            int a = 0;
            boolean mo = MobileAndPersonID.isMobileNO(xzMember.getMemberPhone());
            if (!mo) {
                mv.addObject("mob", "格式错误!");
            }

            if (xzMember != null) {
                if (photoFile.getOriginalFilename() != null && photoFile.getOriginalFilename() != "") {
                    String picName = SavePicture.savePicture(photoFile, request);
                    xzMember.setMemberPicture(picName);

                }
                a = userInfoService.updateUserInfo(xzMember);
                Discuss discuss = new Discuss();
                //discuss.setMemberID(xzMember.getLoginId());
                discuss.setMemberPicture(xzMember.getMemberPicture());
                int c = discussService.updateMemberPicture(discuss);
                System.out.println(c + "   :" + discuss.getMemberID() + "    " + discuss.getMemberPicture());

            }

            if (a != 0) {
                System.out.println("修改成功！");
            } else {
                System.out.println("修改失败!");
            }
        }

        return mv;
    }

    //    后台
//    跳转到查询所有 企业用户信息 页面
    @RequestMapping("goUserInfo.emp")
    public ModelAndView selAllUserInfoEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows, XzMember xzMember,
                                          ModelMap model) {
        ModelAndView mv = new ModelAndView("backEnd/userInfoEnd");
        PageBean<XzMember> pageBean = userInfoService.selAllUserInfoEnd(page, rows, xzMember);
        List<XzMember> userList = pageBean.getList();
        mv.addObject("userList", userList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzMember);
        model.addAttribute("loginID", (long) 0);
        return mv;
    }

    @RequestMapping("goUpdateUserInfo.emp")
    public ModelAndView goUpdateUserInfoEnd(long loginID) {
        ModelAndView mv = new ModelAndView("backEnd/updateUserInfoEnd");
        XzMember xzMember1 = new XzMember();
        xzMember1 = userInfoService.selByLoginIDEnd(loginID);
        mv.addObject("xzMember", xzMember1);
        return mv;
    }
/*

    //    修改方法
    @RequestMapping("updateUserInfo.emp")
    public ModelAndView updateUserInfoEnd(XzMember xzMember, @RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("backEnd/updateUserInfoEnd");
        boolean mo = MobileAndPersonID.isMobileNO(xzMember.getMemberPhone());
        boolean pe = MobileAndPersonID.personIdValidation(xzMember.getMemberIDcard());
        if (!mo) {
            mv.addObject("mob", "手机号格式错误!");
        }
        if (!pe) {
            mv.addObject("peID", "身份证号格式错误!");
        }
        if (mo && pe) {

        } else {
            mv.setViewName("backEnd/updateUserInfoEnd");
            mv.addObject("xzMember", xzMember);
            return mv;
        }
        System.out.println(xzMember);
        int a = 0;
        XzMember xzMember1 = userInfoService.selByLoginIDEnd(xzMember.getLoginId());
        if (xzMember.getDeleteFalt() == 1 && xzMember.getDeleteFalt() != xzMember1.getDeleteFalt()) {
            xzMember.setDeleteMemberDate(new Date());
        }
        String picName = SavePicture.savePicture(photoFile, request);
        xzMember.setMemberPicture(picName);
        a = userInfoService.updateUserInfoEnd(xzMember);
        Discuss discuss = new Discuss();
        discuss.setMemberID(xzMember.getLoginId());
        discuss.setMemberPicture(xzMember.getMemberPicture());
        discussService.updateMemberPicture(discuss);
        if (a != 0) {
            int b = updateLogin(xzMember.getLoginId(), xzMember.getDeleteFalt());
            if (b != 0) {

                mv.setViewName("redirect:goUserInfo.emp");
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
    @RequestMapping("deleteUserInfo.emp")
    public ModelAndView deleteUserInfoEnd(Long loginID) {
        ModelAndView mv = new ModelAndView("redirect:goUserInfo.emp");
        XzMember xzMember = new XzMember();
        int a = 0;
        if (loginID != 0) {
            xzMember = userInfoService.selByLoginIDEnd(loginID);
            xzMember.setDeleteFalt(1);
            xzMember.setDeleteMemberDate(new Date());
            a = userInfoService.updateUserInfoEnd(xzMember);
        }
        if (a != 0) {
            int b = updateLogin(xzMember.getLoginId(), xzMember.getDeleteFalt());
            if (b != 0) {
                System.out.println("删除成功!");
            } else {
                System.out.println("删除失败!");
            }
        } else {
            System.out.println("删除失败!");
        }

        return mv;
    }
*/


    public int updateLogin(long loginID, int deleteFalt) {
        XzLogin xzLogin = loginUserService.selByLoginIDEnd(loginID);
        xzLogin.setDeleteFalt(deleteFalt);
        xzLogin.setDeleteLoginDate(new Date());
        int b = loginUserService.updateLoginEnd(xzLogin);
        return b;
    }


}
