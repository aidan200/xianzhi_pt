package com.util;

import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * 比较时间
 *
 * @author 王天岳
 * @create 2017-04-19 11:22
 **/
public class ComPareDate {
    public static boolean comPareDate (Date starDate,Date endDate){
        Long a = starDate.getTime();
        Long b = endDate.getTime();
        if (a >= b){
            return true;
        }
        return false;
    }
}
