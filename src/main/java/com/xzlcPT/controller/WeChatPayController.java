package com.xzlcPT.controller;

import com.util.MD5;
import com.util.SentWeiXin;
import com.util.weChatpay.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.*;

/**
 * 微信支付接口测试
 *
 * @author 王诗钰
 * @create 2017-05-21 11:23
 **/
@Controller
@RequestMapping("/WeChat")
public class WeChatPayController extends BaseController {

    @RequestMapping("toPay.do")
    public void toPayController(String describe, String money, String payType,
                                HttpServletRequest request, HttpServletResponse response) {
        System.out.println("商品描述:" + describe);
        System.out.println("商品价格:" + money);
        System.out.println("充值类型:" + payType);
        //商户订单号
        String out_trade_no = getOrderId();
        System.out.println("订单号:" + out_trade_no);
        //金额转化为分为单位
//        float sessionMoney = Float.parseFloat(money);
//        String finalMoney = String.format("%.2f", sessionMoney);
//        finalMoney = finalMoney.replace(".", "");
//        System.out.println("金额:"+finalMoney);
        //商户相关资料
        String appid = "wx3fde7f58c03d3ab4";//公众账号ID
        String mch_id = "1469476002";//商户号


        //获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
        String currTime = TenpayUtil.getCurrTime();
        //8位日期
        String strTime = currTime.substring(8, currTime.length());
        //四位随机数
        String strRandom = TenpayUtil.buildRandom(10) + "";
        //随机数
        String nonce_str = strTime + strRandom;

        //总金额以分为单位，不带小数点
//        int total_fee = Integer.parseInt(finalMoney);
        int total_fee = 1;
        //订单生成的机器 IP
        String spbill_create_ip = "123.12.12.123";

        //这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
        String notify_url = "http://www.weixin.qq.com/wxpay/pay.php";

        String trade_type = "NATIVE";

        //商品描述
        String body = describe;

        //商品ID
        int randomId = TenpayUtil.buildRandom(5);//生成五位随机数
        String product_id = randomId + payType + money;

        String A = "appid=" + appid + "&body=" + body + "&mch_id=" + mch_id + "&nonce_str=" + nonce_str + "&notify_url=" + notify_url
                + "&out_trade_no=" + out_trade_no + "&product_id=" + product_id + "&spbill_create_ip=" + spbill_create_ip
                + "&total_fee=" + total_fee + "&trade_type" + trade_type;
        String signTemp = A + "&key=abcx1234xxyw7890jkfq4638aa2399zz";
        System.out.println("签名1:" + signTemp);
        String sign = MD5Util.MD5Encode(signTemp, "").toUpperCase();//md5加密并转换成大写字母
        String xml = "<xml>\n" +
                "<appid>" + appid + "</appid>\n" +
                "<body><![CDATA[" + body + "]]></body>\n" +
                "<mch_id>" + mch_id + "</mch_id>\n" +
                "<nonce_str><![CDATA[" + nonce_str + "]]></nonce_str>\n" +
                "<notify_url><![CDATA[" + notify_url + "]]></notify_url>\n" +
                "<out_trade_no><![CDATA[" + out_trade_no + "]]></out_trade_no>\n" +
                "<product_id>" + product_id + "</product_id>\n" +
                "<spbill_create_ip><![CDATA[" + spbill_create_ip + "]]></spbill_create_ip>\n" +
                "<total_fee>" + total_fee + "</total_fee>\n" +
                "<trade_type>" + trade_type + "</trade_type>\n" +
                "<sign><![CDATA[" + sign + "]]></sign>\n" +
                "</xml>";

        try {
            SentWeiXin.postByJson("", xml);
//            response.sendRedirect("https://api.mch.weixin.qq.com/pay/unifiedorder?"+mmm);
        } catch (Exception e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
    }

    /**
     * 跳转页面
     */
    @RequestMapping("turnPay.do")
    public ModelAndView turnPay() {
        ModelAndView mav = new ModelAndView("foreEnd/wxPay");
        mav.addObject("appid", "wx3fde7f58c03d3ab4");
        mav.addObject("mch_id", "1469476002");
        mav.addObject("device_info", "1000");
        mav.addObject("body", "测试商品");
        mav.addObject("nonce_str", "180516807421430");
        mav.addObject("sign", "4A54E44BCFA5F125666EEC793E73C619");
        return mav;
    }


}
