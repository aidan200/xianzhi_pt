package com.xzlcPT.controller;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradePrecreateRequest;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.util.AlipayUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * 支付宝付款测试Controller
 *
 * @author 王诗钰
 * @create 2017-05-04 9:38
 **/
@Controller
@RequestMapping("/AliPay")
public class ApplyPayController extends BaseController{

    /**支付接口(可用)*/
    @RequestMapping("payAliPay.do")
    public void pay(HttpServletResponse response, String out_trade_no, String subject, String total_amount, String body){
        if(out_trade_no != null){
            try{
            // 超时时间 可空
            String timeout_express="5m";
            // 销售产品码 必填
            String product_code="FAST_INSTANT_TRADE_PAY";
            /**********************/
            // SDK 公共请求类，包含公共请求参数，以及封装了签名与验签，开发者无需关注签名与验签
            //调用RSA签名方式
            AlipayClient client = new DefaultAlipayClient(AlipayUtil.URL, AlipayUtil.APP_ID, AlipayUtil.APP_PRIVATE_KEY, AlipayUtil.FORMAT, AlipayUtil.CHARSET, AlipayUtil.ALIPAY_PUBLIC_KEY, AlipayUtil.SIGN_TYPE);
            AlipayTradePagePayRequest alipayRequest=new AlipayTradePagePayRequest();

            System.out.println("订单号:"+out_trade_no);
            System.out.println("订单名称:"+subject);
            System.out.println("付款金额:"+total_amount);
            System.out.println("商品描述:"+body);

            // 封装请求支付信息
            AlipayTradeWapPayModel model=new AlipayTradeWapPayModel();
            model.setOutTradeNo(out_trade_no);
            model.setSubject(subject);
            model.setTotalAmount(total_amount);
            model.setBody(body);
            model.setTimeoutExpress(timeout_express);
            model.setProductCode(product_code);
            alipayRequest.setBizModel(model);
            // 设置异步通知地址
            alipayRequest.setNotifyUrl(null);
            // 设置同步地址
            alipayRequest.setReturnUrl(null);

            // form表单生产
            String form = "";
                // 调用SDK生成表单
                form = client.pageExecute(alipayRequest).getBody();
                System.out.println(form);
                response.setContentType("text/html;charset=" + AlipayUtil.CHARSET);
                response.getWriter().write(form);//直接将完整的表单html输出到页面
                response.getWriter().flush();
                response.getWriter().close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**开发文档的SDK(暂不可用)*/
    @RequestMapping("aliPayAliPayAliPay.do")
    public void payAliPay(String out_trade_no, String subject, String total_amount, String body){
        try {
            AlipayClient alipayClient = new DefaultAlipayClient(AlipayUtil.URL, AlipayUtil.APP_ID, AlipayUtil.APP_PRIVATE_KEY, AlipayUtil.FORMAT, AlipayUtil.CHARSET, AlipayUtil.ALIPAY_PUBLIC_KEY, AlipayUtil.SIGN_TYPE); //获得初始化的AlipayClient
            //创建API对应的request类
            AlipayTradePrecreateRequest request = new AlipayTradePrecreateRequest();
            request.setBizContent("{" +
                    "    \"out_trade_no\":\""+out_trade_no+"\"," +
                    "    \"seller_id\":\"\"," +
                    "    \"total_amount\":\""+total_amount+"\"," +
                    "    \"discountable_amount\":\"8.88\"," +
                    "    \"undiscountable_amount\":\"80\"," +
                    "    \"buyer_logon_id\":\"15901825620\"," +
                    "    \"subject\":\""+subject+"\"," +
                    "    \"store_id\":\"NJ_001\"" +
                    "    }");
            //通过alipayClient调用API，获得对应的response类
            AlipayTradePrecreateResponse responseA = alipayClient.execute(request);
            System.out.print(responseA.getBody());
            //根据response中的结果继续业务逻辑处理

        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    /**赋值*/
    @RequestMapping("alipayMessage.do")
    public ModelAndView alipayMessage(String subject,String total_amount,String body){
        ModelAndView mav = new ModelAndView("foreEnd/payByAlipay");
        // 商户订单号，商户网站订单系统中唯一订单号，必填  (取毫秒数+5位顺序数字)
        String out_trade_no = getOrderId();
        mav.addObject("out_trade_no",out_trade_no);
        // 订单名称，必填
        mav.addObject("subject",subject);
        // 付款金额，必填
        mav.addObject("total_amount",total_amount);
        // 商品描述，可空
        mav.addObject("body",body);
        return mav;
    }



    /**支付前跳转页面*/
    @RequestMapping("turnPay.do")
    public ModelAndView turnPay(){
        ModelAndView mav = new ModelAndView("foreEnd/vipDisplay");
        return mav;
    }

    /**支付后跳转页面*/
    @RequestMapping("returnUrlJump.do")
    public ModelAndView returnUrlJump(){
        ModelAndView mav = new ModelAndView("foreEnd/aliPayReturnTest");
        return mav;
    }

    /**返回支付结果，成功or失败*/
    @RequestMapping("returnResult.do")
    public void returnResult(String qrLogonId, String qrStatus, String succ,
                              String WIDout_trade_no, String WIDtrade_no/*, JspWriter out*/){
        Boolean succe = true;
        try {
            /*{succ: true, qrStatus: "0", qrLogonId: "15241801615"}
                qrLogonId:"15241801615"
                qrStatus:"0"
                succ:true*/
            //获取支付宝GET过来反馈信息
            Map<String, String> params = new HashMap<String, String>();
//            Map requestParams = request.getParameterMap();
            Map<Object,Object> requestParams = new HashMap<>();
            requestParams.put("qrLogonId",qrLogonId);
            requestParams.put("qrStatus",qrStatus);
            requestParams.put("succ",succe);


            for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
                String name = (String) iter.next();
                String[] values = (String[]) requestParams.get(name);
                String valueStr = "";
                for (int i = 0; i < values.length; i++) {
                    valueStr = (i == values.length - 1) ? valueStr + values[i]
                            : valueStr + values[i] + ",";
                }
                //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
//                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
//                params.put(name, valueStr);
            }

            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
            //商户订单号

            String out_trade_no = WIDout_trade_no;

            //支付宝交易号

            String trade_no = WIDtrade_no;

            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
            //计算得出通知验证结果
            //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
            boolean verify_result = AlipaySignature.rsaCheckV1(params, AlipayUtil.ALIPAY_PUBLIC_KEY, AlipayUtil.CHARSET, "RSA2");

            if (verify_result) {//验证成功
                //////////////////////////////////////////////////////////////////////////////////////////
                //请在这里加上商户的业务逻辑程序代码
                //该页面可做页面美工编辑
//                out.clear();
//                out.println("验证成功<br />");
                //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

                //////////////////////////////////////////////////////////////////////////////////////////
            } else {
                //该页面可做页面美工编辑
//                out.clear();
//                out.println("验证失败");
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    }
}
