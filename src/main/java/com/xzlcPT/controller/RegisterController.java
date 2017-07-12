package com.xzlcPT.controller;

import com.util.MD5;
import com.util.MailUtil;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Controller 层 RegisterController
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/

@Controller
@RequestMapping("/XzRegister")
public class RegisterController extends BaseController {
    @Autowired
    private RegisterService registerService;

    @Autowired
    private CompanyInfoService companyInfoService;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private VipService vipService;

    @Autowired
    //private ResumeService resumeService;

    //    跳转到用户注册页面
    @RequestMapping("/goRegister.do")
    public ModelAndView getRegisterC(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {
        ModelAndView mv = new ModelAndView("foreEnd/RegisterUser");
        XzLogin xzLogin = new XzLogin();
        mv.addObject("xzLogin", xzLogin);

        return mv;
    }

    //    用户注册
    @RequestMapping("Register.do")
    public ModelAndView getRegister1(@Validated({XzLogin.F1.class, XzLogin.F2.class, XzLogin.F3.class}) XzLogin xzLogin, BindingResult result, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("foreEnd/Login");
        Pattern p = Pattern.compile("^([a-z0-9A-Z_]+[_-|\\.]?)+[a-z0-9A-Z_]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
        Matcher m = p.matcher(xzLogin.getLoginEmail());
        boolean bl = m.matches();
        boolean b2 = xzLogin.getConfirmPassword().equals(xzLogin.getLoginPassword());
        System.out.println(b2 + " : " + xzLogin.getConfirmPassword() + "   " + xzLogin.getLoginPassword());
        if (result.hasErrors() || !bl || !b2) {
            mv.setViewName("foreEnd/RegisterUser");
            if (!bl) {
                mv.addObject("eSpan", "邮箱格式错误!");
            }
            if (!b2) {
                mv.addObject("confirmSpan", "两次密码不一致!");
            }
        } else {
            String strMd5 = MD5.md5(xzLogin.getLoginPassword());
            xzLogin.setLoginPassword(strMd5);
            xzLogin.setLoginType(1);
            xzLogin.setLoginActive(2);
            int a = registerService.insertUser(xzLogin);
            XzLogin newXz = new XzLogin();
            newXz = registerService.selectByUser(xzLogin);
            XzMember xzMember = new XzMember();
            xzMember.setLoginId(newXz.getLoginId());
            xzMember.setMemberPicture("timg1.jpg");
//            向用户表中添加一条空数据
            /*int b = userInfoService.addUserInfo(xzMember);
            Resume resume = new Resume();
            resume.setResumeMember(newXz.getLoginID());
            resumeService.insert(resume);*/
            if (a == 1) {//添加未激活用户

                mv = new ModelAndView("foreEnd/jumpGoEmail");
//                发送激活邮件
                String email = "/XzRegister/activeCount.do";
                sentEmail(xzLogin, email, "", request);
                System.out.println("添加未激活用户成功!");
                mv.addObject("jumpInfo", "请登录邮箱激活账号!");
                mv.addObject("jumpAddress", "goIndex.do");
                mv.addObject("goEmail", xzLogin.getLoginEmail());
            } else {
                System.out.println("添加未激活用户失败!");
            }

        }
        return mv;
    }

    //    跳转到企业注册页面
    @RequestMapping("/goRegisterC.do")
    public ModelAndView getRegister(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {
        ModelAndView mv = new ModelAndView("foreEnd/RegisterCompany");
        XzLogin xzLogin = new XzLogin();
        mv.addObject("xzLogin", xzLogin);
        return mv;
    }

    //    企业注册
    @RequestMapping("/RegisterC.do")
    public ModelAndView getRegisterC(@Validated({XzLogin.F1.class, XzLogin.F2.class, XzLogin.F3.class}) XzLogin xzLogin, BindingResult result, String Cname, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("foreEnd/RegisterCompany");

        System.out.println("RegisterC:" + xzLogin.getLoginCount());
        System.out.println("RegisterC:" + Cname);
//        System.out.println(result.hasErrors());
        Pattern p = Pattern.compile("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
        Matcher m = p.matcher(xzLogin.getLoginEmail());
        boolean bl = m.matches();
        boolean b2 = xzLogin.getConfirmPassword().equals(xzLogin.getLoginPassword());
        if (result.hasErrors() || Cname == null || "".equals(Cname) || !bl || !b2) {
//            验证失败
            mv.setViewName("foreEnd/RegisterCompany");
            mv.addObject("companyName", Cname);
            if (Cname == null || "".equals(Cname)) {
                mv.addObject("companyAAA", "公司名不能为空");
            }
            if (!result.hasErrors() && !bl) {
                mv.addObject("eSpan", "邮箱格式错误!");
            }
            if (!b2) {
                mv.addObject("confirmSpan", "两次密码不一致!");
            }
        } else {
            String strMd5 = MD5.md5(xzLogin.getLoginPassword());
            xzLogin.setLoginPassword(strMd5);
            xzLogin.setLoginType(2);
            xzLogin.setLoginActive(2);
            int a = registerService.insertUser(xzLogin);
            XzLogin newUser = registerService.selectByUser(xzLogin);
            System.out.println("01      " + newUser.getLoginId());
            XzCompany companyInfo = new XzCompany();
            companyInfo.setCompanyName(Cname);
            companyInfo.setLoginId(newUser.getLoginId());
            companyInfo.setCompanyPicture("timg1.jpg");
            if (a != 0) {//添加未激活用户
                int b = companyInfoService.insertCompanyInfo(companyInfo);
                if (b != 0) {
                    mv = new ModelAndView("foreEnd/jumpGoEmail");
//                发送激活邮件
                    String email = "/XzRegister/activeCount.do";
                    sentEmail(xzLogin, email, "", request);
                    System.out.println("添加未激活用户成功!");
                    mv.addObject("jumpInfo", "请登录邮箱激活账号!");
                    mv.addObject("jumpAddress", "goIndex.do");
                    mv.addObject("goEmail", xzLogin.getLoginEmail());
                } else {
                    System.out.println("添加公司信息失败!");
                }
            } else {
                System.out.println("添加未激活用户失败!");
            }

        }
        return mv;
    }

    //    跳转到主页
    @RequestMapping("/goIndex.do")
    public ModelAndView getIndex(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }


    //    判定用户名是否重复
    @ResponseBody
    @RequestMapping("selByUser.do")
    public Map<String, Object> selByUser(String str) {
        System.out.println(str);
        XzLogin loginU = new XzLogin(); //接收前台传入值
        loginU.setLoginCount(str);
        Map<String, Object> map = new HashMap<>();
        XzLogin newUser = new XzLogin();
        newUser = registerService.selectByUser(loginU);
        if (newUser == null) {
            map.put("selUser", "√");
            map.put("spanColor", "true");
        } else {
            map.put("selUser", "ｘ 用户名已存在");
            map.put("spanColor", "false");
        }
        return map;
    }

    //    判定邮箱是否重复
    @ResponseBody
    @RequestMapping("selByEmail.do")
    public Map<String, Object> selByEmail(String str) {
        Map<String, Object> map = new HashMap<>();
        if (str != null) {

            Pattern p = Pattern.compile("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
            Matcher m = p.matcher(str);
            boolean b = m.matches();
            if (b) {
                System.out.println(str);
                XzLogin loginU = new XzLogin(); //接收前台传入值
                loginU.setLoginEmail(str);

                XzLogin newUser = new XzLogin();
                newUser = registerService.selectByEmail(loginU);
                if (newUser == null) {
                    map.put("selEmail", "√");
                    map.put("spanColor", "true");
                } else {
                    map.put("selEmail", "ｘ 该邮箱已被注册!");
                    map.put("spanColor", "false");
                }
            } else {
                map.put("selEmail", "ｘ 邮箱格式不正确!");
                map.put("spanColor", "false");
            }
        }
        return map;
    }

    //    判定公司名是否重复
    @ResponseBody
    @RequestMapping("selByCompanyName.do")
    public Map<String, Object> selByCompanyName(String str) {
        Map<String, Object> map = new HashMap<>();
        XzCompany newCompanyInfo = new XzCompany();
        if (str != null && str != "") {
            System.out.println("公司名:" + str);
            newCompanyInfo = companyInfoService.selectByCompany(str);
            if (newCompanyInfo != null) {
                System.out.println(newCompanyInfo.getCompanyName());
            }
            if (newCompanyInfo == null) {
                map.put("selCompany", "√");
                map.put("spanColor", "true");
            } else {
                map.put("selCompany", "ｘ 公司名已存在");
                map.put("spanColor", "false");
            }
        }
        return map;
    }

    //    发送邮件方法
    public void sentEmail(XzLogin LoginUser, String email, String information, HttpServletRequest request) {
        try {
            System.out.println("发邮件:" + LoginUser.getLoginEmail());
            long newTime = System.currentTimeMillis();
            String strMail = "?username=" + LoginUser.getLoginCount() + "&newTime=" + newTime;
            String user = "测试邮件:" + LoginUser.getLoginCount();
            String toMail = LoginUser.getLoginEmail();
            email = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + email;
            MailUtil.sendMail("xianzhi_lc@sina.com", "xianzhi_lc@sina.com", "tt6403947",
                    toMail,
                    "测试邮件",
                    "<a href='" + email + "" + strMail + "'>测试邮件</a>：<b>" + user + "<br/>" + information + "</b>");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("发送失败!");
        }
    }

    //    根据用户名查询
    public XzLogin selActiveUser(String str) {
        XzLogin loginU = new XzLogin(); //接收前台传入值
        loginU.setLoginCount(str);
        Map<String, Object> map = new HashMap<>();
        XzLogin newUser = new XzLogin();
        newUser = registerService.selectByUser(loginU);
        return newUser;
    }

    //    激活账号
    @RequestMapping("activeCount.do")
    public ModelAndView activeCount(String username, String newTime, HttpSession httpSession, HttpServletRequest request) {
        System.out.println(username);
        System.out.println(newTime);
        ModelAndView mv = new ModelAndView("foreEnd/jump");
        if (username != null) {
            XzLogin activeUser = new XzLogin();
            activeUser = selActiveUser(username);
            System.out.println(activeUser);
            long activeTime = System.currentTimeMillis() - Long.parseLong(newTime);
            System.out.println(activeTime);
            if (activeTime < 86400000) {
                if (activeUser.getLoginActive() != 1) {
                    activeUser.setLoginActive(1);
                    System.out.println("激活测试:" + activeUser.getLoginCount());
                    String a = registerService.updateActiveCount(activeUser);
                    activeUser.setLoginPassword(null);
                    httpSession.setAttribute("userLogin", activeUser);
//                    向VIP表中插入数据
                    Vip vip = vipService.selectVipByLoginID(activeUser.getLoginId());
                    if (vip == null) {
                        vip = new Vip();
                        vip.setLoginID(activeUser.getLoginId());
                        vip.setVipRest(0.00);
                        vip.setVipScore(0L);
                        System.out.println(vip);
                        int va = vipService.insertVip(vip);
                        if (va != 0) {
                            System.out.println("添加VIP成功");
                        } else {
                            System.out.println("添加VIP失败");
                        }
                    }
                    mv.addObject("jumpInfo", "激活成功!");
                } else {
                    mv.addObject("jumpInfo", "激活无效!");
                }

            } else {
                String email = "http://localhost:8080/xianzhiPT/XzRegister/activeCount.do";
                sentEmail(activeUser, email, "邮件已超过24小时,请重新激活!", request);
                mv.addObject("jumpInfo", "邮件已超过24小时,请重新激活!");
            }
        }
        mv.addObject("jumpAddress", "goIndex.do");
        return mv;
    }

    //    跳转到修改密码页面
    @RequestMapping("goForget.do")
    public ModelAndView goGetPW() {
        ModelAndView mv = new ModelAndView("foreEnd/forgetPassword");
        return mv;
    }


    //    密码找回(发送邮件)
    @RequestMapping("getPassword.do")
    public ModelAndView getPassword(String username, String email, HttpServletRequest request) {
        System.out.println(username + "     " + email);
        ModelAndView mv = new ModelAndView("foreEnd/jump");
        XzLogin getUser = new XzLogin();
        XzLogin newUser = new XzLogin();
        if (username != null && !"".equals(username) && email != null && !"".equals(email)) {
            getUser.setLoginCount(username);
            getUser.setLoginEmail(email);
            newUser = registerService.getPassword(getUser);
        }
        if (newUser != null) {
            String sEmail = "/XzRegister/goUpdatePW.do";
            sentEmail(newUser, sEmail, "", request);
            mv.addObject("jumpInfo", "邮件已发送!");

        } else {
            mv.addObject("jumpInfo", "该用户不存在!");
            System.out.println("未查到该用户!");
        }
//        添加跳转地址
        mv.addObject("jumpAddress", "goIndex.do");
        return mv;
    }

    //    跳转到修改密码页面
    @RequestMapping("goUpdatePW.do")
    public ModelAndView updatePW(String username, String newTime, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("foreEnd/updatePassword");
        XzLogin newUser = new XzLogin();
        newUser = registerService.selectByCount(username);
        long activeTime = System.currentTimeMillis() - Long.parseLong(newTime);
        if (username != null && !"".equals(username)) {
            if (activeTime < 1800000) {
                mv.addObject("updCount", newUser);
            } else {
                mv = new ModelAndView("foreEnd/jump");
                String sEmail = "/XzRegister/goUpdatePW.do";
                String info = "邮件已超过24小时,请重新填写!";
                mv.addObject("jumpInfo", info);
                mv.addObject("jumpAddress", "goIndex.do");
                sentEmail(newUser, sEmail, info, request);
                System.out.println("邮件已超过24小时!");
            }
        }
        return mv;
    }

    //    修改密码
    @RequestMapping("UpdatePassword.do")
    public ModelAndView updatePassword(String newCount, String password, String confirmPassword) {
        ModelAndView mv = new ModelAndView("foreEnd/jump");
        System.out.println(newCount + "          " + password);
        boolean b1 = password.equals(confirmPassword);
        if (newCount != null && newCount != "" && password != null && password != "") {
            if (b1) {
                XzLogin xzLogin = new XzLogin();
                xzLogin.setLoginCount(newCount);
                xzLogin.setLoginPassword(MD5.md5(password));
                System.out.println("MD5:" + xzLogin.getLoginPassword());
                registerService.updatePassword(xzLogin);
                mv.addObject("jumpInfo", "新密码设置成功!");
                mv.addObject("jumpAddress", "goIndex.do");
            } else {
                mv.setViewName("foreEnd/updatePassword");
                XzLogin newUser = registerService.selectByCount(newCount);
                mv.addObject("password", password);
                mv.addObject("confirmPassword", confirmPassword);
                mv.addObject("confirmPasswordSpan", "两次密码不一致");
                mv.addObject("updCount", newUser);
            }
        } else {
            mv.addObject("jumpInfo", "新密码设置失败!");
            mv.addObject("jumpAddress", "goIndex.do");
        }
        return mv;
    }
}
