package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.XzPostion;


/**
 * Created by Administrator on 2017/7/11.
 */
public interface XzPostionService {

    PageBean<XzPostion> selPostionIndex(int page, int rows, XzPostion postion);
}
