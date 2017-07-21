package com.Interceptor;

import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.service.LoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/21.
 */
public class ForeEndInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private LoginUserService loginUserService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("mem-----"+request.getRequestURI());
        XzLogin loginOnline = (XzLogin) request.getSession().getAttribute("userLogin");
        if(loginOnline==null){
            String username = null;
            String password = null;
            boolean cookieS = false;
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if(cookie.getName().equals("username")){
                    username = cookie.getValue();
                }
                if(cookie.getName().equals("password")){
                    password = cookie.getValue();
                }
            }
            if(username!=null&&password!=null){
                Map map = loginUserService.sellogin(username, password);
                if(map.get("msg").equals("ok")){
                    cookieS = true;
                    request.getSession().setAttribute("memLogin", map.get("login"));
                }
            }
            //判断cookie登陆是否成功
            if(cookieS){
                return true;
            }else{
                response.sendRedirect(request.getServletContext().getContextPath()+"/view/foreEnd3/login.html");
                return false;
            }
        }
        return true;
    }
}
