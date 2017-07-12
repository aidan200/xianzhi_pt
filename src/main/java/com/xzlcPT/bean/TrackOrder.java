package com.xzlcPT.bean;

import com.util.weChatpay.MD5Util;

/**
 * 微信支付 查询订单
 *
 * @author 王天岳
 * @create 2017-06-02 9:04
 **/
public class TrackOrder implements WeiXinConstants {
    private String appid; //平台ID
    private String mch_id;//商户号
    private String nonce_str;//随机字符串
    private String out_trade_no; //商户订单号
    private String sign;//签名

    public TrackOrder() {
        this.appid = APPID;
        this.mch_id = WXPAYMENTACCOUNT;
    }

    /**
     * 生成XML方法
     *
     * @return
     */
    public String generateXMLContent() {
        String xml = "<xml>" + "<appid>" + this.appid + "</appid>" +
                "<mch_id>" + this.mch_id + "</mch_id>" +
                "<nonce_str>" + this.nonce_str + "</nonce_str>" +
                "<out_trade_no>" + this.out_trade_no + "</out_trade_no>" +
                "<sign>" + this.sign + "</sign>" + "</xml>";
        return xml;
    }

    /**
     * 生成 签名 方法
     * @return
     */
    public String makeSign() {
        String content = "appid=" + this.appid +
                "&mch_id=" + this.mch_id +
                "&nonce_str=" + this.nonce_str +
                "&out_trade_no=" + this.out_trade_no;
        content = content + "&key=" + WeiXinConstants.MD5_API_KEY;
        String esignature = MD5Util.MD5Encode(content, "utf-8");
        return esignature.toUpperCase();
    }


    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    @Override
    public String toString() {
        return "TrackOrder{" +
                "appid='" + appid + '\'' +
                ", mch_id='" + mch_id + '\'' +
                ", nonce_str='" + nonce_str + '\'' +
                ", out_trade_no='" + out_trade_no + '\'' +
                ", sign='" + sign + '\'' +
                '}';
    }
}
