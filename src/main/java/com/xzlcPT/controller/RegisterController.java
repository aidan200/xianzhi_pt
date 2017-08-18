package com.xzlcPT.controller;

import com.util.MD5;
import com.util.MailUtil;
import com.util.MailUtilSSL;
import com.util.MakeKey;
import com.util.bean.EmailConf;
import com.util.bean.MessageInfo;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeBodyPart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;
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
@SessionAttributes({"userLogin","registerKey"})
public class RegisterController extends BaseController {
    @Autowired
    private RegisterService registerService;

    @Autowired
    private XzCompanyService companyService;

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
    public ModelAndView getRegisterMember(@Validated(XzLogin.Group.class) XzLogin xzLogin, BindingResult result, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("foreEnd3/registeru_1");
        if(xzLogin.getLoginType()==1){
            mv.setViewName("foreEnd3/registerc_1");
        }
        mv.addObject("xzLogin",xzLogin);
        mv.addObject("state",1);
        if(!result.hasErrors()){
            mv.addObject("state",2);
                // 发送激活邮件
                try {
                    sentEmail1(xzLogin,"/XzRegister/activeCount.do","呵呵哒",request);
                    //加密
                    String strMd5 = MD5.md5(xzLogin.getLoginPassword());
                    xzLogin.setLoginPassword(strMd5);
                    xzLogin.setLoginActive(0);
                    int rs = 0;
                    if(xzLogin.getLoginType()==0){
                        rs = loginUserService.addUserForMember(xzLogin);
                    }else if(xzLogin.getLoginType()==1){
                        rs = loginUserService.addUserForCompany(xzLogin);
                    }
                    if(rs!=0){
                        mv.addObject("msg","注册成功，请到邮箱中激活账号");
                    }else{
                        mv.addObject("msg","注册失败，请检查账号和邮箱");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    mv.addObject("msg","发送失败,请检查邮箱");
                }
        }
        return mv;
    }

    //企业信息完善
    @RequestMapping("addCompanyByReg.do")
    public ModelAndView addCompanyByReg(Long companyId, String companyName, MultipartFile file,HttpServletRequest request){
        ModelAndView mv = new ModelAndView("foreEnd3/registerc_1");
        mv.addObject("state",4);
        mv.addObject("xzLogin",new XzLogin());
        if(file!=null){
            String fileName = (file.getOriginalFilename());
            System.out.println("开始");
            String path = request.getSession().getServletContext().getRealPath("uploadImg");
            String prefix=fileName.substring(fileName.lastIndexOf(".")+1);
            fileName = new Date().getTime()+"."+prefix;
            System.out.println(path);
            File targetFile = new File(path, fileName);
            if(!targetFile.exists()){
                targetFile.mkdirs();
            }
            //保存
            try {
                file.transferTo(targetFile);
                XzCompany company = new XzCompany();
                company.setCompanyId(companyId);
                company.setCompanyName(companyName);
                company.setCompanyPicture(fileName);
                company.setCompanyState(1);
                int i = companyService.updateByPrimaryKeySelective(company);
                if(i==1){
                    mv.addObject("msg","保存企业信息成功");
                }else{
                    mv.addObject("msg","保存企业信息失败，请在企业信息中重新编辑");
                }
            } catch (Exception e) {
                e.printStackTrace();
                mv.addObject("msg","营业执照上传失败，请在企业信息中重新上传");
            }
            return mv;
        }
        return mv;
    }


    //重新发送邮件
    @ResponseBody
    @RequestMapping("mailgoReplay.do")
    public Map mailgoReplay(Long loginId,String usertype,HttpServletRequest request){
        System.out.println(loginId);
        Map map = new HashMap();
        map.put("usertype",usertype);
        map.put("loginId",loginId);
        XzLogin login =loginUserService.selLoginForMOrCById(map);
        map = new HashMap();
        if(login!=null){
            try {
                sentEmail1(login,"/XzRegister/activeCount.do","呵呵哒",request);
                map.put("msg","邮件发送成功，请到邮箱中激活账号");
            } catch (Exception e) {
                e.printStackTrace();
                map.put("msg","邮件发送成功，请检查邮箱");
            }
        }else{
            map.put("msg","不存在的用户，请重新注册");
        }
        return map;
    }



    //    激活账号
    @RequestMapping("activeCount.do")
    public ModelAndView activeCount(String username, String newTime) {
        ModelAndView mv = new ModelAndView("foreEnd3/registeru_1");
        mv.addObject("state",3);
        XzLogin activeUser = selActiveUser(username);
        if (activeUser != null) {
            mv.addObject("xzLogin",activeUser);
            if(activeUser.getLoginType()==1){
                mv.setViewName("foreEnd3/registerc_1");
            }
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
                        mv.addObject("msg","激活成功");
                        //把登录成功后的用户加入session
                        Map map = new HashMap();
                        map.put("usertype",activeUser.getLoginType());
                        map.put("loginId",activeUser.getLoginId());
                        mv.addObject("userLogin",loginUserService.selLoginForMOrCById(map));
                    }
                } else {
                    if(activeUser.getLoginType()==1){
                        mv.addObject("state",4);
                    }
                    mv.addObject("msg","已经激活无需重复激活");
                }

            } else {
                mv.addObject("state",2);
                mv.addObject("msg", "邮件已超过24小时,请重新发送邮件");
            }
        }else{
            mv.addObject("msg","激活路径有误请重新登陆激活");
        }
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

    // 查询邮箱是否存在
    @ResponseBody
    @RequestMapping("selByEmail.do")
    public Map<String, Object> selByEmail(String email) {
        Map<String, Object> map = new HashMap<>();
        XzLogin login = registerService.selectEmail(email);
        if (login != null) {
            map.put("msg", "ok");
        } else {
            map.put("msg", "err");
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
            /*newCompanyInfo = companyService.selectByCompany(str);
            if (newCompanyInfo != null) {
                System.out.println(newCompanyInfo.getCompanyName());
            }
            if (newCompanyInfo == null) {
                map.put("selCompany", "√");
                map.put("spanColor", "true");
            } else {
                map.put("selCompany", "ｘ 公司名已存在");
                map.put("spanColor", "false");
            }*/
        }
        return map;
    }

    //密码找回1 发送邮件
    @ResponseBody
    @RequestMapping("findBack1.do")
    public Map findBack1(String email,HttpServletRequest request){
        Map map = new HashMap();
        try {
            sentEmail2(email,"/view/foreEnd3/retrievepassword.html",request);
            map.put("msg","ok");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg","err");
        }
        return map;
    }

    //密码找回2 验证 验证码
    @ResponseBody
    @RequestMapping("findBack2.do")
    public Map findBack2(String email,String key){
        Map map = new HashMap();
        XzLogin login = registerService.selectEmail(email);
        if(key!=null&&key.equals(login.getFiled3())){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //密码找回3 修改密码
    @ResponseBody
    @RequestMapping("findBack3.do")
    public Map findBack3(String password,String email,String key){
        Map map = new HashMap();
        XzLogin login = registerService.selectEmail(email);
        if(key!=null&&key.equals(login.getFiled3())){
            login.setFiled3(null);
            String strMd5 = MD5.md5(password);
            login.setLoginPassword(strMd5);
            int i = loginUserService.updateByPrimaryKey(login);
            if(i>0){
                map.put("msg","ok");
            }else{
                map.put("msg","err");
            }
        }else{
            map.put("msg","miss");
        }
        return map;
    }

    //发送密码找回
    private void sentEmail2(String email, String callBack, HttpServletRequest request) throws IOException, MessagingException {
        String args = "?type=2&email="+email;
        String toMail = email;
        XzLogin login = registerService.selectEmail(email);
        String key = MakeKey.makeKey();
        login.setFiled3(key);
        loginUserService.updateByPrimaryKey(login);
        String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        EmailConf ec = new EmailConf("sina");
        MessageInfo mi = new MessageInfo("findBack");
        List<String> toMails =  new ArrayList<>();
        toMails.add(toMail);
        mi.setTo(toMails);
        String html ="<div style='width: 100%;" +
                "            min-width: 1100px;" +
                "            height: auto;" +
                "            overflow: hidden'>" +
                "    <div style='width: 600px;" +
                "            margin: 40px auto;" +
                "            height: 480px;" +
                "            border: 3px dashed #3d9ccc;" +
                "    padding: 40px'>" +
                "        <img src='cid:g.png' style='width: 150px;" +
                "            height: 60px;" +
                "            margin-left: 30px;" +
                "            margin-top: 20px'>" +
                "        <div style='padding: 20px;" +
                "            width: 90%;" +
                "            height: auto;" +
                "            margin: 0 auto'>" +
                "            <h3 style='color: #3d9ccc;margin-bottom: 30px'><b>先知网用户 您好</b></h3>" +
                "            <div style='font-size: 17px;" +
                "            margin-top: 10px'>" +
                "                &emsp;&emsp;感谢您使用先知网，修改密码的验证码为" +
                "                <div style='color: #fc6866;font-size: 30px;text-align: center;margin-top: 10px'>"+key+"</div>" +
                "            </div>" +
                "            <a style='width: 120px;" +
                "            height: 40px;" +
                "            margin-top: 30px;" +
                "            background-color: #FFA500;" +
                "            border: none;" +
                "            color: #FFFFff;" +
                "            outline: none;" +
                "            border-radius: 3px;" +
                "            display: block;" +
                "            font-size: 15px;" +
                "text-align: center;line-height: 40px;margin-left: 150px" +
                "' href='"+path+callBack+args+"'>密码找回</a>" +
                "            <div style='font-size: 12px;" +
                "            margin-top: 30px;color: rgba(175,175,175,0.91)'>&emsp;&emsp;点击按钮进行密码找回，此邮件由先知网系统发出，系统不接收回信，请勿直接回复。</div>" +
                "        </div>" +
                "    </div>" +
                "</div>";
        mi.setMsg(html);
        //添加图片
        MimeBodyPart image = new MimeBodyPart();
        image.setDataHandler(new DataHandler(new FileDataSource(request.getSession().getServletContext().getRealPath("dist/foreEnd3/img/LOGO12.png"))));  //javamail jaf
        image.setContentID("g.png");
        //发送
        MailUtilSSL.sslSend(mi,ec,image);
    }
    //    发送注册邮件方法
    private void sentEmail1(XzLogin xzLogin, String callBack,String information, HttpServletRequest request) throws IOException, MessagingException {
        System.out.println("发邮件:" + xzLogin.getLoginEmail());
        long newTime = System.currentTimeMillis();
        String args = "?username=" + xzLogin.getLoginCount() + "&newTime=" + newTime;
        String user = xzLogin.getLoginCount();
        String toMail = xzLogin.getLoginEmail();
        String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        EmailConf ec = new EmailConf("sina");
        MessageInfo mi = new MessageInfo("register");
        List<String> toMails =  new ArrayList<>();
        toMails.add(toMail);
        mi.setTo(toMails);
        String html = "<div style='width: 100%;" +
                "            min-width: 1100px;" +
                "            height: auto;" +
                "            overflow: hidden'>" +
                "    <div style='width: 600px;" +
                "            margin: 40px auto;" +
                "            height: 680px;" +
                "            border: 3px dashed #3d9ccc;" +
                "    padding: 40px'>" +
                "        <img src='cid:g.png' style='width: 150px;" +
                "            height: 60px;" +
                "            margin-left: 30px;" +
                "            margin-top: 30px'>" +
                "        <div style='padding: 20px;" +
                "            width: 90%;" +
                "            height: auto;" +
                "            margin: 0 auto'>" +
                "            <h3 style='color: #fc6866;margin-bottom: 30px'><b>亲爱的"+user+" ,您好</b></h3>" +
                "            <div style='font-size: 17px;" +
                "            margin-top: 10px'>" +
                "                &emsp;&emsp;欢迎您成为先知网注册用户，为了您能随时接收与您匹配的高薪职位推荐，邀请您完成 邮箱验证。" +
                "            </div>" +
                "            <div style='font-size: 17px;" +
                "            margin-top: 10px'>" +
                "                &emsp;&emsp;同时，为了您能够快速收到企业HR和猎头顾问的精准职位邀请，让简历曝光机会提升68%，成功应聘率提升23%，我们强烈建议您完善简历。" +
                "            </div>" +
                "" +
                "            <a style='width: 230px;" +
                "            height: 40px;" +
                "            margin-top: 30px;" +
                "            background-color: #FFA500;" +
                "            border: none;" +
                "            color: #FFFFff;" +
                "            outline: none;" +
                "            border-radius: 3px;" +
                "            display: block;" +
                "            font-size: 15px;" +
                "text-align: center;line-height: 40px' href='" + path + callBack + args + "'>开启邮箱验证，走进先知世界</a>" +
                "            <img src='cid:e.png' style='width: 200px;height: 130px;margin-top: 30px;float: right'>" +
                "        </div>" +
                "    </div>" +
                "</div>";
        mi.setMsg(html);
        //添加图片
        MimeBodyPart image = new MimeBodyPart();
        image.setDataHandler(new DataHandler(new FileDataSource(request.getSession().getServletContext().getRealPath("dist/foreEnd3/img/LOGO12.png"))));  //javamail jaf
        image.setContentID("g.png");
        MimeBodyPart image2 = new MimeBodyPart();
        image2.setDataHandler(new DataHandler(new FileDataSource(request.getSession().getServletContext().getRealPath("dist/foreEnd3/img/celebrate.png"))));  //javamail jaf
        image2.setContentID("e.png");
        //发送
        MailUtilSSL.sslSend(mi,ec,image,image2);
    }

    //    根据用户名查询
    public XzLogin selActiveUser(String str) {
        XzLogin loginU = new XzLogin(); //接收前台传入值
        loginU.setLoginCount(str);
        XzLogin newUser = registerService.selectByUser(loginU);
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
            //sentEmail(newUser, sEmail, "找回吧", request);
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
                //sentEmail(newUser, sEmail, info, request);
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
