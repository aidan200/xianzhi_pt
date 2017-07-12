package com.tag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import java.io.IOException;

import static java.lang.System.out;

/**
 * 自定义标签 测试类
 *
 * @author 王天岳
 * @create 2017-06-06 9:06
 **/
public class PageTest extends TagSupport {
    /**
     * 重写 doStartTag 方法
     * @return
     */
    public int doStartTag(){
        //声明一个网页输出对象
        JspWriter out = pageContext.getOut();
        try {
            //在网页输出内容
            out.print("<a class=\"a\" href=\"http://www.baidu.com\">百度</a>");
        } catch (IOException e) {
            e.printStackTrace();
        }
        //结束方法
        return SKIP_BODY;
    }
}
