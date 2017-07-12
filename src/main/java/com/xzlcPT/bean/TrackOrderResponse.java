package com.xzlcPT.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 查询定单信息 response 对象
 *
 * @author 王天岳
 * @create 2017-06-02 10:40
 **/
public class TrackOrderResponse {
    private Long order_id;//订单表ID

    private String return_code; //返回状态码
    private String return_msg;  //返回信息
    private String appid;       //平台ID
    private String mch_id;      //商户号
    private String nonce_str;   //随机字符串
    private String sign;        //签名
    private String result_code; //业务结果
    private String out_trade_no;    //商户订单号
    private String trade_state; //交易状态
    private String trade_state_desc;    //交易状态描述

    private String openid; //用户标识
    private String is_subscribe; //是否关注公众账号
    private String trade_type; //交易类型
    private String bank_type; //付款银行
    private String total_fee; //标价金额(分)
    private String fee_type; //标价币种
    private String transaction_id; //微信支付订单号
    private String attach; //附加数据
    private String time_end; //支付完成时间
    private String cash_fee; //支付金额
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date record_time;
    private Date deleteOrderDate;//删除日期
    private int deleteFalt;//删除类型 0未删除 1删除

    @Override
    public String toString() {
        return "TrackOrderResponse{" +
                "order_id='" + order_id + '\'' +
                ", return_code='" + return_code + '\'' +
                ", return_msg='" + return_msg + '\'' +
                ", appid='" + appid + '\'' +
                ", mch_id='" + mch_id + '\'' +
                ", nonce_str='" + nonce_str + '\'' +
                ", sign='" + sign + '\'' +
                ", result_code='" + result_code + '\'' +
                ", out_trade_no='" + out_trade_no + '\'' +
                ", trade_state='" + trade_state + '\'' +
                ", trade_state_desc='" + trade_state_desc + '\'' +
                ", openid='" + openid + '\'' +
                ", is_subscribe='" + is_subscribe + '\'' +
                ", trade_type='" + trade_type + '\'' +
                ", bank_type='" + bank_type + '\'' +
                ", total_fee='" + total_fee + '\'' +
                ", fee_type='" + fee_type + '\'' +
                ", transaction_id='" + transaction_id + '\'' +
                ", attach='" + attach + '\'' +
                ", time_end='" + time_end + '\'' +
                ", cash_fee='" + cash_fee + '\'' +
                ", record_time=" + record_time +
                ", deleteOrderDate=" + deleteOrderDate +
                ", deleteFalt=" + deleteFalt +
                '}';
    }

    public Date getRecord_time() {
        return record_time;
    }

    public void setRecord_time(Date record_time) {
        this.record_time = record_time;
    }

    public Date getDeleteOrderDate() {
        return deleteOrderDate;
    }

    public void setDeleteOrderDate(Date deleteOrderDate) {
        this.deleteOrderDate = deleteOrderDate;
    }

    public int getDeleteFalt() {
        return deleteFalt;
    }

    public void setDeleteFalt(int deleteFalt) {
        this.deleteFalt = deleteFalt;
    }

    public Long getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Long order_id) {
        this.order_id = order_id;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getIs_subscribe() {
        return is_subscribe;
    }

    public void setIs_subscribe(String is_subscribe) {
        this.is_subscribe = is_subscribe;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getBank_type() {
        return bank_type;
    }

    public void setBank_type(String bank_type) {
        this.bank_type = bank_type;
    }

    public String getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(String total_fee) {
        this.total_fee = total_fee;
    }

    public String getFee_type() {
        return fee_type;
    }

    public void setFee_type(String fee_type) {
        this.fee_type = fee_type;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getTime_end() {
        return time_end;
    }

    public void setTime_end(String time_end) {
        this.time_end = time_end;
    }

    public String getCash_fee() {
        return cash_fee;
    }

    public void setCash_fee(String cash_fee) {
        this.cash_fee = cash_fee;
    }

    public String getReturn_code() {
        return return_code;
    }

    public void setReturn_code(String return_code) {
        this.return_code = return_code;
    }

    public String getReturn_msg() {
        return return_msg;
    }

    public void setReturn_msg(String return_msg) {
        this.return_msg = return_msg;
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

    public String getResult_code() {
        return result_code;
    }

    public void setResult_code(String result_code) {
        this.result_code = result_code;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getTrade_state() {
        return trade_state;
    }

    public void setTrade_state(String trade_state) {
        this.trade_state = trade_state;
    }

    public String getTrade_state_desc() {
        return trade_state_desc;
    }

    public void setTrade_state_desc(String trade_state_desc) {
        this.trade_state_desc = trade_state_desc;
    }
}
