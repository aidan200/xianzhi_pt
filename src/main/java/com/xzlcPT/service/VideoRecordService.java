package com.xzlcPT.service;/**
 * Created by Administrator on 2017/5/11.
 */

import com.xzlcPT.bean.XzVideoRecord;

import java.util.List;

/**
 * 建立 视频记录service
 *
 * @author 王天岳
 * @create 2017-05-11 18:41
 **/
public interface VideoRecordService {
    /**
     * 添加记录
     * @param xzVideoRecord
     * @return
     */
    int insertVideoRecord(XzVideoRecord xzVideoRecord);

    /**
     * 条件查询 视频记录
     * @param xzVideoRecord
     * @return
     */
    List<XzVideoRecord> selectRecord(XzVideoRecord xzVideoRecord);

    /**
     * 判断某用户是否购买过某视频
     * @param xzVideoRecord
     * @return
     */
    XzVideoRecord selectBuyRecord(XzVideoRecord xzVideoRecord);
}
