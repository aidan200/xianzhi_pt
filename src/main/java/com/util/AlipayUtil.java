package com.util;

import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;

import static com.alipay.api.AlipayConstants.SIGN_ALGORITHMS;

/**
 * Created by Administrator on 2017/5/2.
 */
public class AlipayUtil {
    // 请求网关地址
    public static String URL = "https://openapi.alipay.com/gateway.do";
    // 商户appid
    public static String APP_ID = "2017050407107774";
    // 私钥 pkcs8格式的
    public static String APP_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC8ozPeVKgpMQj3UulIRfzK9T/jfwLWt50gKcHiPd8KyL1YsJtmz7jt2zx5tNzLN9Xe7BcIr/djktbIJbIH/mZrwZ04TMFV/3wGpDRfMGH3EUpEnSkc0OVEROuM3P7/wgXeFR9Js9LMm77zSJYRjXEEuvShRzdHhXL0NtQGBwqetS/tRudZnSE8xC9Pw6rNB894t1GU+hVRc/oO3Lhwa6iSdp8GLMLSXaQiRkLA2rz74a2IUb462DLdgEBD8z6+vgA/1si9BTTFE/bqkmrJAFSf6tip26OrnmQFWlp4H6nUkFtS61UrSTzu6AaDVeDBR9ZTdaOf750cWpMmA81CcDKVAgMBAAECggEBALa1SIbe7mW/VdTf3I4hI8GdG72IhsJb4/eEGoO8s60pU6R0ooBJT/AqOgAT+wtmUGNzvreuYGp0jk4bnL17Xc6fIF2oklZud72jDArqvOhmOc4NfwWnG3ktXAz6/I3SaoZ5ZO2pG9MMQz42nwvvOHmBb3JKnTNMAVSjSmdwKIwgfoX+zOdksf6EBMZ/tAb37ukfqqtHae5KxjRIl+Yb8kpX2RMXfvwtWL9a9iX2yulpOl+IHkDUAcTyOkkLVEoedAwR6wFOqutih43p4AGh3rT8ZkBU6+RCicqHrifOZ/xiuTBEGIjgS39Vv4GbucVYTnGT/FFMHSwz8IZRjyKzS+ECgYEA5Bv9gNpYEQ9ZzVLHGjqHoXfyYTDNjr2GRU8GNGd9MsCYsYM11IEfl0tz/jLAMkLPMv3p5hBSDEbcoRPh3RRbHW4d1t1tBry6qa6wsdp6Fb0rrtKdsSnQl8ZKvvQwPYqRHfFk2+jJ6p1fRZD5n3xvCLTqV/OjBL257hlVpOTrdckCgYEA07O2NLezVbNg09g2T35nllPKFwb52tLOvCdVHyO7Kdd9AIXvP3IU13nsYhjH+s1RKvabntBLK50anxDQZKHMD5IijChFCAvFYIq7fHrNoKtcmNY/yhmhgfiZajXkJ9/znEW+wR+FK/+zUnuLZAAe9ySiWTC8WLZQzi00rNSsrG0CgYBGjVm09tNyQ1s1JDsso5m7mUvAP8X0Ni5HVY/HuZKBlgwkKz8FAQLyWoX/w1aqtPs8/EfRvo6B+ZDXyTx8koUz7xEPmeDUyp65SKyh9b745k+SfNYFK7e2mcAYm5IoFqmXp0fYtIFvLUmATLzIVUZKXRp2JYbwOnY9bFyO6bbh8QKBgDz+cCasLq0oa2NdzfgFUU8MgRM1XVNgnVO0eV/paYlanpdB/3ZmJf8XD7YLscJe2V3pg1i0ZpQARaVCsOftfd+WmQGMsKbqzUlNb0skDo6WEK2wPNy7mb7ao0jokf2zFnsV1SnLLRFKMJ45HiYHquRF18ietAVTMeDVQXHyLHXZAoGAGUnajA/keCFRktmQhfQ0Ru1HAWlrOynzVM9OWx4feHICLYt5vt8msn+6/f9ja7B51N1ydSNXS03Q60/YtIGCljDcYgmaT0Sky+sHGJIi4ZeFnYTmAVesYuWFj+BdxL6KiGdlw86Lqv2PM2nJzECkhb56+3Y6JBe+yL+YEN3A9rQ=";
    // 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    //public static String notify_url = "http://商户网关地址/alipay.trade.wap.pay-JAVA-UTF-8/notify_url.jsp";//(Controller)
    // 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static String return_url = "http://xianzhilanchuang.com/xianzhiPT/AliPay/returnResult.do";//返回二维码的页面
    // 编码
    public static String CHARSET = "UTF-8";
    // 返回格式
    public static String FORMAT = "json";
    // 支付宝公钥
    public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqc5Wpwip73wPML5vKNzPlsliB0lfQO60uSlbkMQBP8bp2g16aV0c0FDBKPTR/wIPgAZKIQvoaWdbgSxj3Yk406dQ3GN2L5r3PJ20Vr2irivlkbKlEZLUmhCzwnAgGspAUzRYDuyyedG1zBXyg8HsjsfwM4ZsYCGvkqc4TLAdWc47I5RzlBYoieij4jF127HF6w5XxVBLo4NoMheNSkr7ATE00PXwVS3JlTQtnPzCzP95R7TCTgw5ezOYzcBkdm6gVw6EzfTzuCYM7lnidduoXjO3hyP7Pt7KjntslZZfQ37+MnVZHMuvT15IU/eTYEi9vif/81+eUNdqiGfujHVYhwIDAQAB";
    // 日志记录目录
    public static String log_path = "/log";
    // RSA2
    public static String SIGN_TYPE = "RSA2";

    /**
     * RSA签名
     * @param content 待签名数据
     * @param privateKey 商户私钥
     * @param input_charset 编码格式
     * @return 签名值
     */
//    public static String sign(String content, String privateKey, String input_charset)
//    {
//        try
//        {
//            PKCS8EncodedKeySpec priPKCS8 	= new PKCS8EncodedKeySpec( Base64.decode(privateKey) );
//            KeyFactory keyf 	= KeyFactory.getInstance("RSA");
//            PrivateKey priKey 	= keyf.generatePrivate(priPKCS8);
//
//            java.security.Signature signature = java.security.Signature
//                    .getInstance(SIGN_ALGORITHMS);
//
//            signature.initSign(priKey);
//            signature.update( content.getBytes(input_charset) );
//
//            byte[] signed = signature.sign();
//
//            return Base64.encode(signed);
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//
//        return null;
//    }
}
