package com.xzlcPT.service;/**
 * Created by Administrator on 2017/6/2.
 */

import com.xzlcPT.bean.TrackOrderResponse;

/**
 * 建立 微信交易记录 service 层
 *
 * @author 王天岳
 * @create 2017-06-02 16:17
 **/
public interface OrderRecordService {
    int insertOrderRecord(TrackOrderResponse trackOrderResponse);
    int updateOrderRecord(TrackOrderResponse trackOrderResponse);
    TrackOrderResponse selectOrderRecord(String out_trade_no);
}
