package com.xzlcPT.service;/**
 * Created by Administrator on 2017/8/3.
 */

import com.util.PageBean;
import com.xzlcPT.bean.XzResumeBrowse;

import java.util.List;


/**
 * @author 甘汝雷
 * @create 2017-08-03 14:38
 **/
public interface XzResumeBrowseService {

    int insert(XzResumeBrowse xzResumeBrowse);

    int updateByPrimaryKey(Long browseId);

    int selCountByResumeId(Long resumeId);

    PageBean<XzResumeBrowse> selWhoSawMe(int page, int rows, Long resumeId);
    //修改已读
    int updateIsRead(Long resumeBrowseId);

    int insertSelective(XzResumeBrowse resumeBrowse);

    int selectByComIdAndRId(XzResumeBrowse xzResumeBrowse);
}
