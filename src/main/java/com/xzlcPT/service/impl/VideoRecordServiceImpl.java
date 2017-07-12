package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzVideoRecord;
import com.xzlcPT.dao.VideoRecordMapper;
import com.xzlcPT.service.VideoRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 建立 视频记录 service 实现类
 *
 * @author 王天岳
 * @create 2017-05-11 18:43
 **/
@Service("videoRecordService")
public class VideoRecordServiceImpl implements VideoRecordService{
    @Autowired
    private VideoRecordMapper videoRecordMapper;

    /**
     * 添加记录
     * @param xzVideoRecord
     * @return
     */
    @Override
    public int insertVideoRecord(XzVideoRecord xzVideoRecord) {
        return videoRecordMapper.insertRecord(xzVideoRecord);
    }

    /**
     * 条件查询 视频记录
     * @param xzVideoRecord
     * @return
     */
    @Override
    public List<XzVideoRecord> selectRecord(XzVideoRecord xzVideoRecord) {
        return videoRecordMapper.selectRecord(xzVideoRecord);
    }

    /**
     * 判断某用户是否购买过某视频
     * @param xzVideoRecord
     * @return
     */
    public XzVideoRecord selectBuyRecord(XzVideoRecord xzVideoRecord){
        return videoRecordMapper.selectBuyRecord(xzVideoRecord);
    }
}
