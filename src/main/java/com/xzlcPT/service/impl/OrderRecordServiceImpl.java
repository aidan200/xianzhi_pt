package com.xzlcPT.service.impl;

import com.xzlcPT.bean.TrackOrderResponse;
import com.xzlcPT.dao.OrderRecordMapper;
import com.xzlcPT.service.OrderRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 建立 微信交易记录 实现类
 *
 * @author 王天岳
 * @create 2017-06-02 16:20
 **/
@Service("orderRecordService")
public class OrderRecordServiceImpl implements OrderRecordService {
    @Autowired
    private OrderRecordMapper orderRecordMapper;
    /**
     * 添加记录
     * @param trackOrderResponse
     * @return
     */
    @Override
    public int insertOrderRecord(TrackOrderResponse trackOrderResponse) {
        return orderRecordMapper.insertOrderRecord(trackOrderResponse);
    }

    /**
     * 修改记录
     * @param trackOrderResponse
     * @return
     */
    @Override
    public int updateOrderRecord(TrackOrderResponse trackOrderResponse) {
        return orderRecordMapper.updateOrderRecord(trackOrderResponse);
    }

    /**
     * 根据订单号查询交易记录
     * @param out_trade_no
     * @return
     */
    @Override
    public TrackOrderResponse selectOrderRecord(String out_trade_no) {
        return orderRecordMapper.selectOrderRecordByID(out_trade_no);
    }
}
