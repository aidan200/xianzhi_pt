package com.xzlcPT.service;/**
 * Created by Administrator on 2017/7/17.
 */

import com.xzlcPT.bean.XzCompanyMien;

/**
 * @author 甘汝雷
 * @create 2017-07-17 20:34
 **/
public interface XzMienService {

    int insertMien(XzCompanyMien xzCompanyMien);

    int updateMien(XzCompanyMien xzCompanyMien);

    XzCompanyMien selectByMienId(Long mienId);
}
