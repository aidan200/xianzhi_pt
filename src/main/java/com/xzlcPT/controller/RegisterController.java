package com.xzlcPT.controller;

import com.util.MD5;
import com.util.MailUtil;
import com.util.MailUtilSSL;
import com.util.bean.EmailConf;
import com.util.bean.MessageInfo;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
@SessionAttributes({"userLogin"})
public class RegisterController extends BaseController {
    @Autowired
    private RegisterService registerService;

    @Autowired
    private CompanyInfoService companyInfoService;

    @Autowired
    private LoginUserService loginUserService;


    //    跳转到用户注册页面
    @RequestMapping("/goRegister.do")
    public ModelAndView toRegister() {
        ModelAndView mv = new ModelAndView("foreEnd3/registeru_1");
        XzLogin xzLogin = new XzLogin();
        xzLogin.setLoginType(0);
        mv.addObject("xzLogin", xzLogin);
        mv.addObject("state",1);
        return mv;
    }
    //    跳转到企业注册页面
    @RequestMapping("/goRegisterC.do")
    public ModelAndView getRegister() {
        ModelAndView mv = new ModelAndView("foreEnd3/registerc_1");
        XzLogin xzLogin = new XzLogin();
        xzLogin.setLoginType(1);
        mv.addObject("xzLogin", xzLogin);
        return mv;
    }



    //    用户注册
    @RequestMapping("Register.do")
    public ModelAndView getRegister1(@Validated(XzLogin.Group.class) XzLogin xzLogin, BindingResult result, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("foreEnd3/registeru_1");
        if(!result.hasErrors()){
            //加密
            String strMd5 = MD5.md5(xzLogin.getLoginPassword());
            xzLogin.setLoginPassword(strMd5);
            xzLogin.setLoginActive(0);
            int i = registerService.insertUser(xzLogin);
            if(i==1){
                int rs = 0;
                if(xzLogin.getLoginType()==0){
                    rs = loginUserService.addUserForMember(xzLogin);
                }else{
                    //企业用户跳转到注册第二步---企业信息
                    XzCompany company = loginUserService.addUserForCompany(xzLogin);
                    mv.setViewName("foreEnd3/registerc_1");
                    mv.addObject("xzCompany",company);
                    return mv;
                }
                if(rs==1){
                    //第一步成功
                    mv.addObject("state",2);
                    mv.addObject("xzLogin",xzLogin);
                    String information = "呵呵哒";
                    //                发送激活邮件
                    try {
                        System.out.println("发邮件:" + xzLogin.getLoginEmail());
                        long newTime = System.currentTimeMillis();
                        String strMail = "?username=" + xzLogin.getLoginCount() + "&newTime=" + newTime;
                        String user = "测试邮件:" + xzLogin.getLoginCount();
                        String toMail = xzLogin.getLoginEmail();
                        String email = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
                        EmailConf ec = new EmailConf("sina");
                        MessageInfo mi = new MessageInfo("register");
                        List<String> toMails =  new ArrayList<>();
                        toMails.add(toMail);
                        mi.setTo(toMails);
                        mi.setMsg("<a href='" + email + "/XzRegister/activeCount.do" + strMail + "'>"+ email + "/XzRegister/activeCount.do" + strMail +"</a>：<b>" + user + "<br/>" + information + "</b>");
                        MailUtilSSL.sslSend(mi,ec);
                        mv.addObject("msg","发送成功巴拉巴拉");
                    } catch (Exception e) {
                        e.printStackTrace();
                        System.out.println("发送失败!");
                        mv.addObject("msg","发送失败巴拉巴拉");
                    }
                }else{
                    mv.addObject("msg","注册失败");
                }
            }else{
                mv.addObject("msg","注册失败");
            }
        }
        return mv;
    }

    //    激活账号
    @RequestMapping("activeCount.do")
    public ModelAndView activeCount(String username, String newTime) {
        ModelAndView mv = new ModelAndView("foreEnd3/registeru_1");
        mv.addObject("state",2);
        if (username != null) {
            XzLogin activeUser = selActiveUser(username);
            mv.addObject("xzLogin",activeUser);
            long activeTime = System.currentTimeMillis() - Long.parseLong(newTime);
            System.out.println(activeTime);
            if (activeTime < 86400000) {
                if (activeUser.getLoginActive() != 1) {
                    activeUser.setLoginActive(1);
                    System.out.println("激活测试:" + activeUser.getLoginCount());
                    int a = registerService.updateActiveCount(activeUser);
                    if(a!=1){
                        mv.addObject("msg","激活失败");
                    }else{
                        mv.addObject("state",3);
                        mv.addObject("msg","激活成功");
                        //把登录成功后的用户加入session
                        Map map = new HashMap();
                        map.put("usertype",activeUser.getLoginType());
                        map.put("loginId",activeUser.getLoginId());
                        mv.addObject("userLogin",loginUserService.selLoginForMOrCById(map));
                    }
                } else {
                    mv.addObject("state",3);
                    mv.addObject("msg","已经激活无需重复激活");
                }

            } else {
                mv.addObject("msg", "邮件已超过24小时,请重新激活!");
            }
        }
        mv.addObject("msg","激活路径有误请重新登陆激活");
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
    private void sentEmail(XzLogin LoginUser, String email, String information, HttpServletRequest request) {
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
