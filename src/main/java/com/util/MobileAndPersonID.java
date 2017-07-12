package com.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 验证身份证号和手机号格式
 *
 * @author 王天岳
 * @create 2017-04-19 19:06
 **/
public class MobileAndPersonID {

    /**
     * 验证身份证号格式
     *
     * @param text
     * @return
     */
    public static boolean personIdValidation(String text) {
        boolean flag = false;
        String regx = "[0-9]{17}x";
        String reg1 = "[0-9]{15}";
        String regex = "[0-9]{18}";
        flag = text.matches(regx) || text.matches(reg1) || text.matches(regex);
        return flag;
    }

    /**
     * 验证手机号格式
     * @param mobiles
     * @return
     */

    public static boolean isMobileNO(String mobiles) {

        Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");

        Matcher m = p.matcher(mobiles);

        System.out.println(m.matches() + "---");

        return m.matches();

    }

    public static  boolean isPhone(String legalPhone){


        Pattern p = Pattern.compile("d{8}|[0]{1}[0-9]{2,3}-[0-9]{7,8}$");

        Matcher m = p.matcher(legalPhone);

        System.out.println(m.matches() + "---");

        return m.matches();

    }


}
