package com.xzlcPT.bean;

import com.util.weChatpay.MD5Util;

/**
 * 微信支付信息 bean
 *
 * @author 王天岳
 * @create 2017-05-25 17:24
 **/
public class UnifiedorderDto implements WeiXinConstants {


    private String appid;               //  公众号ID       必填
    private String body;                //  商品描述       必填  先知蓝创支付中心-微信支付 *
    private String device_info;        //  设备号
    private String mch_id;              //  商户号         必填
    private String nonce_str;           //  随机字符串     必填
    private String notify_url;          //  通知地址       必填
    private String openId;               //  用户标识
    private String out_trade_no;        //  商户订单号     必填
    private String spbill_create_ip;    //  终端IP        必填
    private int total_fee;               //  标价金额      必填
    private String trade_type;            //  交易类型      必填  NATIVE
    private String product_id;            //  商品ID
    private String sign;                   //  签名          必填

    public UnifiedorderDto() {
        this.appid = APPID;
        this.mch_id = WXPAYMENTACCOUNT;
        this.device_info = DEVICE_INFO_WEB;
        this.notify_url = CALLBACK_URL;
        this.trade_type = TRADE_TYPE_NATIVE;
        this.body = BODY;
        this.spbill_create_ip = SPBILL_CREATE_IP;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getDevice_info() {
        return device_info;
    }

    public void setDevice_info(String device_info) {
        this.device_info = device_info;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getNotify_url() {
        return notify_url;
    }

    public void setNotify_url(String notify_url) {
        this.notify_url = notify_url;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getSpbill_create_ip() {
        return spbill_create_ip;
    }

    public void setSpbill_create_ip(String spbill_create_ip) {
        this.spbill_create_ip = spbill_create_ip;
    }

    public int getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(int total_fee) {
        this.total_fee = total_fee;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    /**
     * 生成 xml 方法
     * @return
     */
    public String generateXMLContent() {
        String xml = "<xml>" + "<appid>" + this.appid + "</appid>" + "<body>" + this.body + "</body>" + "<mch_id>" + this.mch_id + "</mch_id>" + "<nonce_str>" + this.nonce_str + "</nonce_str>" + "<notify_url>" + this.notify_url + "</notify_url>" + "<out_trade_no>" + this.out_trade_no + "</out_trade_no>" + "<product_id>" + this.product_id + "</product_id>" + "<spbill_create_ip>" + this.spbill_create_ip + "</spbill_create_ip>" + "<total_fee>" + String.valueOf(this.total_fee) + "</total_fee>" + "<trade_type>" + this.trade_type + "</trade_type>" + "<sign>" + this.sign + "</sign>" + "</xml>";
        return xml;
    }

    /**
     * 生成 签名 方法
     * @return
     */
    public String makeSign() {
        String content = "appid=" + this.appid + "&body=" + this.body + "" + "&mch_id=" + this.mch_id + "&nonce_str=" + this.nonce_str + "&notify_url=" + this.notify_url + "&out_trade_no=" + this.out_trade_no + "&product_id=" + this.product_id + "&spbill_create_ip=" + this.spbill_create_ip + "&total_fee=" + String.valueOf(this.total_fee) + "&trade_type=" + this.trade_type;
        content = content + "&key=" + WeiXinConstants.MD5_API_KEY;
        String esignature = MD5Util.MD5Encode(content, "utf-8");
        return esignature.toUpperCase();
    }

    @Override
    public String toString() {
        return "UnifiedorderDto{" +
                "appid='" + appid + '\'' +
                ", body='" + body + '\'' +
                ", device_info='" + device_info + '\'' +
                ", mch_id='" + mch_id + '\'' +
                ", nonce_str='" + nonce_str + '\'' +
                ", notify_url='" + notify_url + '\'' +
                ", openId='" + openId + '\'' +
                ", out_trade_no='" + out_trade_no + '\'' +
                ", spbill_create_ip='" + spbill_create_ip + '\'' +
                ", total_fee=" + total_fee +
                ", trade_type='" + trade_type + '\'' +
                ", product_id='" + product_id + '\'' +
                ", sign='" + sign + '\'' +
                '}';
    }
}
