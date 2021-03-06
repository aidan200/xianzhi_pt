package com.xzlcPT.controller;

import com.util.MD5;
import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Controller 层 LoginController
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/

@Controller
@RequestMapping("/XzLogin")
@SessionAttributes({"userLogin"})
public class LoginController extends BaseController {

    @Autowired
    private LoginUserService loginService;

    @Autowired
    private CompanyInfoService companyInfoService;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private VipService vipService;

    //      登录方法
    @RequestMapping("/Login.do")
    public ModelAndView getLogin1(String username, String password, String remember,HttpServletResponse response,HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("foreEnd3/login");
        mv.addObject("username",username);
        String checkBox = remember;
        Map map = loginService.sellogin(username,MD5.md5(password));
        System.out.println(map);
        if(map.get("msg").equals("miss")){
            //没找到用户
            mv.addObject("msg","不存在此用户");
        }else if(map.get("msg").equals("err")){
            //用户名或密码错误
            mv.addObject("msg","用户密码错误");
        }else if(map.get("msg").equals("ok")){
            XzLogin login = (XzLogin) map.get("login");
            if(login.getLoginActive()==0){
                //账号没激活
                if(login.getLoginType()==0){
                    mv.setViewName("foreEnd3/registeru_1");
                    mv.addObject("xzLogin",login);
                    mv.addObject("state",2);
                }else if (login.getLoginType()==1){
                    mv.setViewName("");
                }
                mv.addObject("msg","账号未激活，请激活账号");
            }else{
                mv.setViewName("redirect:/");
                //session中存入当前用户
                mv.addObject("userLogin",login);
                //cookie记住用户
                if ("true".equals(checkBox)) {
                    Cookie cookies1 = new Cookie("count", login.getLoginCount());
                    cookies1.setMaxAge(3600 * 24 * 30);
                    //获取项目名
                    String b =  request.getContextPath();
                    cookies1.setPath(b+"/");
                    response.addCookie(cookies1);
                    Cookie cookies2 = new Cookie("pw", password);
                    cookies2.setMaxAge(3600 * 24 * 30);
                    cookies2.setPath(b+"/");
                    response.addCookie(cookies2);
                }
            }
        }
        return mv;
    }

    //免登陆方法
    @ResponseBody
    @RequestMapping("/LoginCookie.do")
    public Map loginCookie(String username,String password,Model model){
        Map map = loginService.sellogin(username,MD5.md5(password));
        System.out.println(map);
        if(map.get("msg").equals("ok")){
            XzLogin login = (XzLogin) map.get("login");
            if(login.getLoginActive()==0){
                //账号没激活
                map.put("msg","noa");
            }else{
                //session中存入当前用户
                model.addAttribute("userLogin",login);
            }
        }
        return map;
    }

    //    退出登录方法
    @RequestMapping("ExitUser.do")
    public ModelAndView exitUser(SessionStatus sessionStatus,HttpServletRequest request,HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("redirect:/");
        sessionStatus.setComplete();//清空session
        //删除cookie
        Cookie[] cookies = request.getCookies();
        if (null==cookies) {
            System.out.println("没有cookie");
        } else {
            for(Cookie cookie : cookies){
                //如果找到同名cookie，就将value设置为null，将存活时间设置为0，再替换掉原cookie，这样就相当于删除了。
                if(cookie.getName().equals("count")||cookie.getName().equals("pw")){
                    cookie.setValue(null);
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
        System.out.println("ExitUser");
        return mv;
    }


//    跳转到后台 查询所有登录表信息(分页查询)

    @RequestMapping("selAllLogin.emp")
    public ModelAndView selAllLoginEnd(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows, XzLogin xzLogin) {
        ModelAndView mv = new ModelAndView("backEnd/loginEnd");
        PageBean<XzLogin> pageBean = loginService.selAllLoginEnd(page, rows, xzLogin);
        List<XzLogin> loginList = pageBean.getList();
        mv.addObject("loginList", loginList);
        mv.addObject("page", pageBean.getPageNum());
        mv.addObject("pages", pageBean.getPages());
        mv.addObject("rows", pageBean.getPageSize());
        mv.addObject("total", pageBean.getTotal());
        mv.addObject("test", xzLogin);
        return mv;
    }

    @RequestMapping("goAddLogin.emp")
    public ModelAndView goAddLoginEnd() {
        ModelAndView mv = new ModelAndView("backEnd/updateLoginEnd");
        XzLogin xzLogin = new XzLogin();
        mv.addObject("xzLogin", xzLogin);
        return mv;
    }

    //    添加用户
    @RequestMapping("addLogin.emp")
    public ModelAndView addLoginEnd(@Validated({XzLogin.F1.class}) XzLogin xzLogin, BindingResult result) {
        ModelAndView mv = new ModelAndView("redirect:selAllLogin.emp");
        if (result.hasErrors()) {
            System.out.println("hasErrors:" + xzLogin);
            mv.setViewName("backEnd/updateLoginEnd");
        } else {
            xzLogin.setLoginPassword(MD5.md5(xzLogin.getLoginPassword()));
            int a = loginService.addLoginEnd(xzLogin);
            if (a != 0) {
                System.out.println("添加成功!");
                xzLogin = loginService.selLoginByCountEnd(xzLogin);
                if (xzLogin.getLoginType() == 1) {
                    XzMember xzMember = new XzMember();
                    //xzMember.setLoginId(xzLogin.getLoginId());
                    xzMember.setMemberPicture("timg1.jpg");
                    userInfoService.addUserInfo(xzMember);
                } else {
                    XzCompany xzCompany = new XzCompany();
                    xzCompany.setLoginId(xzLogin.getLoginId());
                    //xzCompany.setCompanyName(xzLogin.getCompanyName());
                    xzCompany.setCompanyPicture("timg1.jpg");
                    companyInfoService.insertCompanyInfo(xzCompany);
                }
                //添加 VIP
                Vip vip = vipService.selectVipByLoginID(xzLogin.getLoginId());
                if (vip == null) {
                    vip = new Vip();
                    vip.setLoginID(xzLogin.getLoginId());
                    vip.setVipRest(0.00);
                    vip.setVipScore(0L);
                    int va = vipService.insertVip(vip);
                    if (va != 0) {
                        System.out.println("添加VIP成功");
                    } else {
                        System.out.println("添加VIP失败");
                    }
                }
            } else {
                System.out.println("添加失败!");
            }

        }


        return mv;
    }

    //    根据条件修改登录表信息
    @RequestMapping("goUpdateLogin.emp")
    public ModelAndView goUpdateLoginEnd(long loginID) {
        ModelAndView mv = new ModelAndView("backEnd/updateLoginEnd");
        XzLogin xzLogin = loginService.selByLoginIDEnd(loginID);
        System.out.println("goUpdateLogin.emp" + xzLogin.getLoginId());
        mv.addObject("xzLogin", xzLogin);
        return mv;
    }

    //    根据条件修改登录表信息
    @RequestMapping("updateLogin.emp")
    public ModelAndView updateLoginEnd(@Validated({XzLogin.F2.class}) XzLogin xzLogin, BindingResult result) {
        ModelAndView mv = new ModelAndView("backEnd/updateLoginEnd");

        if (result.hasErrors()) {
            System.out.println(xzLogin);
        } else {
            mv.setViewName("redirect:selAllLogin.emp");
            XzLogin xzLogin1 = new XzLogin();
//        比较密码 若有改动则重新MD5加密
            xzLogin1 = loginService.selByLoginIDEnd(xzLogin.getLoginId());
            System.out.println(xzLogin.getLoginPassword());
            System.out.println(xzLogin1.getLoginPassword());
            if (!xzLogin.getLoginPassword().equals(xzLogin1.getLoginPassword())) {
                xzLogin.setLoginPassword(MD5.md5(xzLogin.getLoginPassword()));
            }

            if (xzLogin.getDeleteFalt() == 1) {
                xzLogin.setDeleteLoginDate(new Date());
            }
            int a = loginService.updateLoginEnd(xzLogin);
            if (a != 0) {
                System.out.println("修改成功!");
            } else {
                System.out.println("修改失败!");
            }
            xzLogin1 = loginService.selByLoginIDEnd(xzLogin.getLoginId());
            mv.addObject("xzLogin", xzLogin1);
        }
        return mv;
    }

    //    根据条件删除登录表信息
    @RequestMapping("deleteLogin.emp")
    public ModelAndView deleteLoginEnd(long loginID) {
        ModelAndView mv = new ModelAndView("redirect:selAllLogin.emp");
        XzLogin xzLogin = new XzLogin();
        xzLogin.setLoginId(loginID);
        xzLogin.setDeleteFalt(1);
        xzLogin.setDeleteLoginDate(new Date());
        int a = loginService.updateLoginEnd(xzLogin);
        if (a != 0) {
            System.out.println("删除成功!");
        } else {
            System.out.println("删除失败!");
        }
        return mv;
    }


    //    跳转到后台主页
    /*@RequestMapping("/goIndex.emp")
    public ModelAndView goBackEndIndex(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {
        ModelAndView mv = new ModelAndView("backEnd/backEndIndex");
        return mv;
    }
*/
    //    管理员登录
    /*@RequestMapping("/goLogin.emp")
    public ModelAndView goLoginEnd() {
        ModelAndView mv = new ModelAndView("backEnd/loginAdminEnd");
        XzLogin xzLogin = new XzLogin();
        mv.addObject("xzLogin", xzLogin);
        return mv;
    }*/

    //    管理员登录
    @RequestMapping("/Login.emp")
    public ModelAndView loginEnd(String username, String password) {
        ModelAndView mv = new ModelAndView("backEnd/loginAdminEnd");
        XzLogin admin = loginService.selAdmin(username,MD5.md5(password));
        if(admin!=null){
            mv.addObject("adminLogin", admin);
            mv.setViewName("backEnd/backEndIndex");
        }
        return mv;
    }

}