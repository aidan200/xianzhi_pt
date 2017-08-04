package com.xzlcPT.service.impl;/**
 * Created by Administrator on 2017/8/3.
 */

import com.xzlcPT.bean.XzResumeBrowse;
import com.xzlcPT.dao.XzResumeBrowseMapper;
import com.xzlcPT.service.XzResumeBrowseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 甘汝雷
 * @create 2017-08-03 14:38
 **/
@Service("resumeBrowseService")
public class XzResumeBrowseServiceImpl implements XzResumeBrowseService {
    @Autowired
    private XzResumeBrowseMapper xzResumeBrowseMapper;


    @Override
    public int insert(XzResumeBrowse xzResumeBrowse) {
        int i=xzResumeBrowseMapper.insert(xzResumeBrowse);
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Long browseId) {
        int i=xzResumeBrowseMapper.updateByPrimaryKey(browseId);
        return i;
    }

    @Override
    public int selCountByResumeId(Long resumeId) {
        int i=xzResumeBrowseMapper.selCountByResumeId(resumeId);
        return i;
    }
}
