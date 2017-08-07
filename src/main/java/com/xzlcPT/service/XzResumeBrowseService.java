package com.xzlcPT.service;/**
 * Created by Administrator on 2017/8/3.
 */

import com.util.PageBean;
import com.xzlcPT.bean.XzResumeBrowse;


/**
 * @author 甘汝雷
 * @create 2017-08-03 14:38
 **/
public interface XzResumeBrowseService {

    int insert(XzResumeBrowse xzResumeBrowse);

    int updateByPrimaryKey(Long browseId);

    int selCountByResumeId(Long resumeId);

    PageBean<XzResumeBrowse> updateWhoSawMe(int page, int rows, Long resumeId);
}
