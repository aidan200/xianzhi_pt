package com.xzlcPT.dao;/**
 * Created by Administrator on 2017/4/23.
 */

import com.xzlcPT.bean.XzVideoRecord;

import java.util.List;

/**
 * 建立视频记录Mapper
 *
 * @author 王天岳
 * @create 2017-04-23 17:55
 **/
public interface VideoRecordMapper {
    /**
     * 添加视频记录
     *
     * @param xzVideoRecord
     * @return
     */
    int insertRecord(XzVideoRecord xzVideoRecord);

    /**
     * 根据条件查询视频记录
     *
     * @param xzVideoRecord
     * @return
     */
    List<XzVideoRecord> selectRecord(XzVideoRecord xzVideoRecord);


    /**
     * 修改视频记录
     *
     * @param xzVideoRecord
     * @return
     */
    int updateRecord(XzVideoRecord xzVideoRecord);

    /**
     * 根据记录表ID查询
     *
     * @param rid
     * @return
     */
    XzVideoRecord selectRecordByID(long rid);

    /**
     * 判断某用户是否购买过某视频
     * @param xzVideoRecord
     * @return
     */
    XzVideoRecord selectBuyRecord(XzVideoRecord xzVideoRecord);
}
