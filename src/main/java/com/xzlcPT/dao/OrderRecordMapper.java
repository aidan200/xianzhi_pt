package com.xzlcPT.dao;/**
 * Created by Administrator on 2017/6/2.
 */

import com.xzlcPT.bean.TrackOrderResponse;

/**
 * 微信订单记录Mapper
 *
 * @author 王天岳
 * @create 2017-06-02 15:06
 **/
public interface OrderRecordMapper {
    /**
     * 前台
     */
    /**
     * 添加订单记录
     * @param trackOrderResponse
     * @return
     */
    int insertOrderRecord(TrackOrderResponse trackOrderResponse);

    /**
     * 修改订单记录
     * @param trackOrderResponse
     * @return
     */
    int updateOrderRecord(TrackOrderResponse trackOrderResponse);

    /**
     * 根据out_trade_no(商户订单号) 订单记录
     * @param out_trade_no
     * @return
     */
    TrackOrderResponse selectOrderRecordByID(String out_trade_no);

}
