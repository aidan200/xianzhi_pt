import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;


import org.junit.*;

/**
 * Created by Administrator on 2017/5/8.
 */
public class ALPAY {
    @org.junit.Test
    public void tt(){
        String out_trade_no = "121";
        String subject = "aa";
        String total_amount = "0.1";
        String body = "cc";

        try{
            // 超时时间 可空
            String timeout_express="2m";
            // 销售产品码 必填
            String product_code="FAST_INSTANT_TRADE_PAY";
            /**********************/
            // SDK 公共请求类，包含公共请求参数，以及封装了签名与验签，开发者无需关注签名与验签
            //调用RSA签名方式
            AlipayClient client = new DefaultAlipayClient(CT.gatewayUrl, CT.app_id, CT.merchant_private_key, "json",CT.charset, CT.alipay_public_key, CT.sign_type);

            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();

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
           /* response.setContentType("text/html;charset=" + AlipayUtil.CHARSET);
            response.getWriter().write(form);//直接将完整的表单html输出到页面
            response.getWriter().flush();
            response.getWriter().close();*/
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
