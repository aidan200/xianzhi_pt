package com.xzlcPT.service.impl;

import com.xzlcPT.bean.XzPostionBrowse;
import com.xzlcPT.dao.XzPostionBrowseMapper;
import com.xzlcPT.service.XzPostionBrowseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/27.
 */
@Service("postionBrowseService")
public class XzPostionBrowseServiceImpl implements XzPostionBrowseService{

    @Autowired
    XzPostionBrowseMapper postionBrowseMapper;

    @Override
    public int insertPostionBrowse(Long postionId,Long memberId) {
        int count = postionBrowseMapper.selectCountByMemberId(memberId);
        XzPostionBrowse postionBrowse = postionBrowseMapper.selPCinfo(postionId);
        postionBrowse.setMemberId(memberId);
        postionBrowse.setBrowseTime(new Date());
        if(count>=10){
            postionBrowseMapper.delLast(memberId);
        }
        return postionBrowseMapper.insert(postionBrowse);
    }

    @Override
    public List<XzPostionBrowse> selPostionBrowse(Long memberId) {
        return postionBrowseMapper.selectByMemberId(memberId);
    }
}
