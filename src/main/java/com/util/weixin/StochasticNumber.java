package com.util.weixin;

import com.util.weChatpay.TenpayUtil;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 生成 随机单号
 *
 * @author 王天岳
 * @create 2017-05-26 10:08
 **/
public class StochasticNumber {
    /**
     *  生成商品ID方法
     * @param pay (付款金额 : 分)
     * @return
     */
    public static  String getProductID (int pay){
        String strTime = getCurrTime(); // 取当前系统时间 (yyyyMMddHHmmss)
        String random = buildRandom(8)+""; //  随机生成十随机数    (String)
        return strTime+random+pay;
    }

    /**
     * 生成 商户订单号 (24位)
     * @return
     */
    public static String getOutTradeNo(){
        String strTime ="2" + System.currentTimeMillis(); // 取当前系统时间 毫秒数 (String)
        String random = buildRandom(10)+""; //  随机生成十随机数    (String)
        return strTime+random;
    }

    /**
     * 获取当前 字符串类型系统时间 yyyyMMddHHmmss
     * @return
     */
    public static String getCurrTime() {
        Date now = new Date();
        SimpleDateFormat outFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String s = outFormat.format(now);
        return s;
    }
    /**
     * 生成 length 位随机数
     * @param length
     * @return
     */
    public static int buildRandom(int length) {
        int num = 1;
        double random = Math.random();
        if (random < 0.1) {
            random = random + 0.1;
        }
        for (int i = 0; i < length; i++) {
            num = num * 10;
        }
        return (int) ((random * num));
    }

}
