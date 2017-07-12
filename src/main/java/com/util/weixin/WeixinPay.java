package com.util.weixin;

import com.util.SentWeiXin;
import com.xzlcPT.bean.TrackOrder;
import com.xzlcPT.bean.TrackOrderResponse;
import com.xzlcPT.bean.UnifiedOrderResponse;
import com.xzlcPT.bean.UnifiedorderDto;

/**
 * 向微信端发送请求 方法 并返回 二维码地址信息
 *
 * @author 王天岳
 * @create 2017-05-26 14:33
 **/
public class WeixinPay {
    /**
     * 返回 下单支付信息
     * @param out_trade_no
     */
    public static TrackOrderResponse trackOrder(String out_trade_no){
        String strURL = "https://api.mch.weixin.qq.com/pay/orderquery"; // 微信 统一下单 接口
        String nonce_str = StochasticNumber.buildRandom(10) + ""; //生成10位随机字符串
        TrackOrder trackOrder = new TrackOrder();   //生成查询订单对象
        trackOrder.setNonce_str(nonce_str);
        trackOrder.setOut_trade_no(out_trade_no);
        trackOrder.setSign(trackOrder.makeSign());

        System.out.println(trackOrder);

        String trackOrderXml = SentWeiXin.postByJson(strURL,trackOrder.generateXMLContent()); //生成 xml 字符串

        System.out.println(trackOrderXml);

        return getTrackOrderResponse(trackOrderXml); //调用方法 将返回的xml字符串封装成 TrackOrderResponse对象
    }

    /**
     * 向微信扫码付费接口 发送付费信息 并返回接收信息 将接受信息封装成对象返回
     * @param total_fee
     * @return
     */
    public static UnifiedOrderResponse result(double total_fee) {

        String strURL = "https://api.mch.weixin.qq.com/pay/unifiedorder"; // 微信 统一下单 接口

        String nonce_str = StochasticNumber.buildRandom(10) + ""; //生成10位随机字符串
        String out_trade_no = StochasticNumber.getOutTradeNo();     //生成商户订单号
        String product_id = StochasticNumber.getProductID((int)total_fee); //生成商品ID

        UnifiedorderDto unifiedorderDto = new UnifiedorderDto();    //new 一个 微信请求 对象
        unifiedorderDto.setTotal_fee((int)total_fee);
        unifiedorderDto.setNonce_str(nonce_str);
        unifiedorderDto.setOut_trade_no(out_trade_no);
        unifiedorderDto.setProduct_id(product_id);
        unifiedorderDto.setSign(unifiedorderDto.makeSign());
        String xml = unifiedorderDto.generateXMLContent();

        System.out.println(xml);

        String newXml= SentWeiXin.postByJson(strURL, xml);
        return getResponse(newXml,out_trade_no);
    }

    /**
     * 截取字符串
     * @param xml
     * @param str1
     * @param str2
     * @return
     */
    public static String getXmlInfo(String xml,String str1,String str2) {
        int a1 = xml.indexOf(str1) + str1.length();
        int a2 = xml.indexOf(str2);
        return xml.substring(a1, a2)+"";
    }

    /**
     * 将 xml 信息 转存到 UnifiedOrderResponse 对象
     * @param xml
     * @return
     */
    public static UnifiedOrderResponse getResponse(String xml,String out_trade_no) {
        String appid = getXmlInfo(xml,"<appid><![CDATA[","]]></appid>");
        String mch_id = getXmlInfo(xml,"<mch_id><![CDATA[","]]></mch_id>");
        String nonce_str = getXmlInfo(xml,"<nonce_str><![CDATA[","]]></nonce_str>");
        String result_code = getXmlInfo(xml,"<result_code><![CDATA[","]]></result_code>");
        String code_url = getXmlInfo(xml,"<code_url><![CDATA[","]]></code_url>");
        UnifiedOrderResponse response = new UnifiedOrderResponse();
        response.setAppid(appid);
        response.setMch_id(mch_id);
        response.setNonce_str(nonce_str);
        response.setResult_code(result_code);
        response.setCode_url(code_url);
        response.setOut_trade_no(out_trade_no);
        return response;
    }

    public static TrackOrderResponse getTrackOrderResponse(String xml){
        TrackOrderResponse trackOrderResponse = new TrackOrderResponse();

        try {
            String return_code = getXmlInfo(xml,"<return_code><![CDATA[","]]></return_code>");
            String return_msg = getXmlInfo(xml,"<return_msg><![CDATA[","]]></return_msg>");
            String appid = getXmlInfo(xml,"<appid><![CDATA[","]]></appid>");
            String mch_id = getXmlInfo(xml,"<mch_id><![CDATA[","]]></mch_id>");
            String nonce_str = getXmlInfo(xml,"<nonce_str><![CDATA[","]]></nonce_str>");
            String sign = getXmlInfo(xml,"<sign><![CDATA[","]]></sign>");
            String result_code = getXmlInfo(xml,"<result_code><![CDATA[","]]></result_code>");
            String out_trade_no = getXmlInfo(xml,"<out_trade_no><![CDATA[","]]></out_trade_no>");
            String trade_state = getXmlInfo(xml,"<trade_state><![CDATA[","]]></trade_state>");
            trackOrderResponse.setReturn_code(return_code);
            trackOrderResponse.setReturn_msg(return_msg);
            trackOrderResponse.setAppid(appid);
            trackOrderResponse.setMch_id(mch_id);
            trackOrderResponse.setNonce_str(nonce_str);
            trackOrderResponse.setSign(sign);
            trackOrderResponse.setResult_code(result_code);
            trackOrderResponse.setOut_trade_no(out_trade_no);
            trackOrderResponse.setTrade_state(trade_state);
            if("SUCCESS".equals(trade_state)){
                String openid = getXmlInfo(xml,"<openid><![CDATA[","]]></openid>");
                String is_subscribe = getXmlInfo(xml,"<is_subscribe><![CDATA[","]]></is_subscribe>");
                String trade_type = getXmlInfo(xml,"<trade_type><![CDATA[","]]></trade_type>");
                String bank_type = getXmlInfo(xml,"<bank_type><![CDATA[","]]></bank_type>");
                String total_fee = getXmlInfo(xml,"<total_fee>","</total_fee>");
                String fee_type = getXmlInfo(xml,"<fee_type><![CDATA[","]]></fee_type>");
                String transaction_id = getXmlInfo(xml,"<transaction_id><![CDATA[","]]></transaction_id>");
                String attach = getXmlInfo(xml,"<attach><![CDATA[","]]></attach>");
                String time_end = getXmlInfo(xml,"<time_end><![CDATA[","]]></time_end>");
                String cash_fee = getXmlInfo(xml,"<cash_fee>","</cash_fee>");
                trackOrderResponse.setOpenid(openid);
                trackOrderResponse.setIs_subscribe(is_subscribe);
                trackOrderResponse.setTrade_type(trade_type);
                trackOrderResponse.setBank_type(bank_type);
                trackOrderResponse.setTotal_fee(total_fee);
                trackOrderResponse.setFee_type(fee_type);
                trackOrderResponse.setTransaction_id(transaction_id);
                trackOrderResponse.setAttach(attach);
                trackOrderResponse.setTime_end(time_end);
                trackOrderResponse.setCash_fee(cash_fee);
            }else{
                String trade_state_desc = getXmlInfo(xml,"<trade_state_desc><![CDATA[","]]></trade_state_desc>");
                trackOrderResponse.setTrade_state_desc(trade_state_desc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return trackOrderResponse;
    }

}
