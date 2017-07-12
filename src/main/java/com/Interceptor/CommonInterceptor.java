package com.Interceptor;

import com.xzlcPT.bean.XzLogin;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 建立拦截器
 *
 * @author 王天岳
 * @create 2017-04-24 19:40
 **/
public class CommonInterceptor extends HandlerInterceptorAdapter {
    /**
     * 页面未加载之前拦截请求
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        XzLogin username = (XzLogin) request.getSession().getAttribute("userLogin");
//        System.out.println("拦截器:" + username);
        if (username == null || username.getLoginId() == 0 || username.getLoginPassword() == null || "".equals(username.getLoginPassword())) {
//            String a = request.getRequestURI();
//            System.out.println(a);
//            获取项目名
            String b =  request.getContextPath();
//            response.sendRedirect(b + "/view/foreEnd/Login.html?redirectUrl=" + a);
            response.sendRedirect(b + "/XzLogin/goLogin.do");
            return false;
        } else {
            return true;
        }
    }
}
